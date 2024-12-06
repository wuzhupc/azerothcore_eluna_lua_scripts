--[[
Author: wuzhu
Date: 2024-10-30 16:46:45
LastEditTime: 2024-11-14 18:22:34
FilePath: \Azerothcore\lua_scripts\WuzhuCustom\wzSuperStone.lua
Description:超级炉石(物品：炉石-6948)脚本
Copyright (c) 2024 by WUZHUPC, All Rights Reserved.
--]]
print(">>Script: wzSuperStone loading...")
local wzCommon = require("wzCommon")

--菜单所有者 --默认炉石
local itemEntry              = 6948
--阵营
local TEAM_ALLIANCE          = 0
local TEAM_HORDE             = 1
local TEAM_NONE              = 2
--菜单号
local MMENU                  = 1
local TPMENU                 = 2
local GMMENU                 = 3
local ENCMENU                = 4
local PTMENU                 = 5
--菜单类型
local FUNC                   = 1
local MENU                   = 2
local TP                     = 3
local ENC                    = 4

--GOSSIP_ICON 菜单图标
local GOSSIP_ICON_CHAT       = 0  -- 对话
local GOSSIP_ICON_VENDOR     = 1  -- 货物
local GOSSIP_ICON_TAXI       = 2  -- 传送
local GOSSIP_ICON_TRAINER    = 3  -- 训练（书）
local GOSSIP_ICON_INTERACT_1 = 4  -- 复活
local GOSSIP_ICON_INTERACT_2 = 5  -- 设为我的家
local GOSSIP_ICON_MONEY_BAG  = 6  -- 钱袋
local GOSSIP_ICON_TALK       = 7  -- 申请 说话+黑色点
local GOSSIP_ICON_TABARD     = 8  -- 工会（战袍）
local GOSSIP_ICON_BATTLE     = 9  -- 加入战场 双剑交叉
local GOSSIP_ICON_DOT        = 10 -- 加入战场


local Instances              = {  --副本表
    { 249, 0 }, { 249, 1 }, { 269, 1 }, { 309, 0 },
    { 409, 0 }, { 469, 0 },
    { 509, 0 }, { 531, 0 }, { 532, 0 }, { 533, 0 }, { 533, 1 },
    { 534, 0 }, { 540, 1 }, { 542, 1 }, { 543, 1 }, { 544, 0 }, { 545, 1 }, { 546, 1 }, { 547, 1 }, { 548, 0 },
    { 550, 0 }, { 552, 1 }, { 553, 1 }, { 554, 1 }, { 555, 1 }, { 556, 1 }, { 557, 1 }, { 558, 1 },
    { 560, 1 }, { 564, 0 }, { 565, 0 }, { 568, 0 },
    { 574, 1 }, { 575, 1 }, { 576, 1 }, { 578, 1 },
    { 580, 0 }, { 585, 1 }, { 595, 1 }, { 598, 1 }, { 599, 1 },
    { 600, 1 }, { 601, 1 }, { 602, 1 }, { 603, 0 }, { 603, 1 }, { 604, 1 }, { 608, 1 },
    { 615, 0 }, { 615, 1 }, { 616, 0 }, { 616, 1 }, { 619, 1 }, { 624, 0 }, { 624, 1 },
    { 631, 0 }, { 631, 1 }, { 631, 2 }, { 631, 3 }, { 632, 1 },
    { 649, 0 }, { 649, 1 }, { 649, 2 }, { 649, 3 }, --十字军的试炼
    { 650, 1 }, { 658, 1 }, { 668, 1 },
    { 724, 0 }, { 724, 1 }, { 724, 2 }, { 724, 3 },
}
--随身NPC
local ST                     = {
    TIME = 180,
    NPCID1 = 922001, --召唤传送师
    NPCID2 = 922002, --召唤技能师
    NPCID3 = 922003, --召唤技能传送师
    NPCID6 = 922006, --召唤超级商人
    --商业技能训练师
    NPCID501 = 28703,
    NPCID501A = 33630,
    NPCID502 = 28694,
    NPCID503 = 28693,
    NPCID503A = 33633,
    NPCID504 = 28697,
    NPCID505 = 28704,
    NPCID506 = 28702,
    NPCID507 = 28701,
    NPCID508 = 28700,
    NPCID509 = 28698,
    NPCID510 = 28696,
    NPCID511 = 28699,
    NPCID512 = 28705,
    NPCID513 = 28706,
    NPCID514 = 28742,
    --结束商业技能
    --{guid,npc,time},
}

function ST.GetLevelDescStr(money, level)
    local tmpStr = wzCommon.MoneyToString(money,true)
    if level > 0 then
        if tmpStr ~= "" then
            tmpStr =  level.. "级，"..tmpStr
        else
            tmpStr = level.. "级"
        end
    end
    if tmpStr ~= "" then
        tmpStr = "(".. tmpStr .. ")"
    end
    return tmpStr
end

function ST.SummonNPC(player, entry)
    local guid = player:GetGUIDLow()
    local lastTime, nowTime = (ST[guid] or 0), os.time()

    if (player:IsInCombat()) then
        player:SendAreaTriggerMessage("不能在战斗中召唤。")
    else
        if (nowTime > lastTime) then
            local map = player:GetMap()
            if (map) then
                player:SendAreaTriggerMessage(map:GetName())
                local x, y, z = player:GetX() + 1, player:GetY(), player:GetZ()
                local nz = map:GetHeight(x, y)
                if (nz) then
                else
                    nz = player:GetZ() + 0.3
                end
                if (nz > z and nz < (z + 5)) then
                    z = nz
                end
                local NPC = player:SpawnCreature(entry, x, y, z, 0, 3, ST.TIME * 1000)
                if (NPC) then
                    player:SendAreaTriggerMessage("召唤对象成功。")
                    NPC:SetFacingToObject(player)
                    NPC:SendUnitSay(string.format("%s,我响应你的召唤，从远方来到你的身边。请问你需要什么？", player:GetName()), 0)
                    lastTime = os.time() + ST.TIME
                else
                    player:SendAreaTriggerMessage("召唤对象失败。")
                end
            end
        else
            player:SendAreaTriggerMessage("召唤NPC不能太频繁。")
        end
    end
    ST[guid] = lastTime
end

function ST.SummonTeleporterSNPC(player) --召唤传送师
    ST.SummonNPC(player, ST.NPCID1)
end

function ST.SummonSpellerRNPC(player) --召唤技能师
    ST.SummonNPC(player, ST.NPCID2)
end

function ST.SummonSuperProfessionsNPC(player) --召唤商业训练师
    ST.SummonNPC(player, ST.NPCID3)
end


function ST.SummonSuperVendorNPC(player) --召唤超级商人
    ST.SummonNPC(player, ST.NPCID6)
end

--商业技能师
function ST.SummonNPCAlchemy(player)
    ST.SummonNPC(player, ST.NPCID501)
    ST.SummonNPC(player, ST.NPCID501A)
end

function ST.SummonNPCBlacksmithing(player)
    ST.SummonNPC(player, ST.NPCID502)
end

function ST.SummonNPCEnchanting(player)
    ST.SummonNPC(player, ST.NPCID503)
    ST.SummonNPC(player, ST.NPCID503A)
end

function ST.SummonNPCEngineering(player)
    ST.SummonNPC(player, ST.NPCID504)
end

function ST.SummonNPCHerbalism(player)
    ST.SummonNPC(player, ST.NPCID505)
end

function ST.SummonNPCInscription(player)
    ST.SummonNPC(player, ST.NPCID506)
end

function ST.SummonNPCJewelcrafting(player)
    ST.SummonNPC(player, ST.NPCID507)
end

function ST.SummonNPCLeatherworking(player)
    ST.SummonNPC(player, ST.NPCID508)
end

function ST.SummonNPCMining(player)
    ST.SummonNPC(player, ST.NPCID509)
end

function ST.SummonNPCSkinning(player)
    ST.SummonNPC(player, ST.NPCID510)
end

function ST.SummonNPCTailoring(player)
    ST.SummonNPC(player, ST.NPCID511)
end

function ST.SummonNPCCooking(player)
    ST.SummonNPC(player, ST.NPCID512)
end

function ST.SummonNPCFirstAid(player)
    ST.SummonNPC(player, ST.NPCID513)
end

function ST.SummonNPCFishing(player)
    ST.SummonNPC(player, ST.NPCID514)
end

local Stone = {
    GetTimeASString = function(player)
        local inGameTime = player:GetTotalPlayedTime()
        local days = math.modf(inGameTime / (24 * 3600))
        local hours = math.modf((inGameTime - (days * 24 * 3600)) / 3600)
        local mins = math.modf((inGameTime - (days * 24 * 3600 + hours * 3600)) / 60)
        return days .. "天" .. hours .. "时" .. mins .. "分"
    end,

    GoHome = function(player) --穿越回去
        player:CastSpell(player, 8690, true)
        player:ResetSpellCooldown(8690, true)
        player:SendBroadcastMessage("已经传送回来了")
    end,

    SetHome = function(player) --记录当前位置
        local x, y, z, mapId, areaId = player:GetX(), player:GetY(), player:GetZ(), player:GetMapId(), player:GetAreaId()
        player:SetBindPoint(x, y, z, mapId, areaId)
        player:SendBroadcastMessage("已经记录当前位置")
    end,

    OpenBank = function(player) --打开银行
        player:SendShowBank(player)
        player:SendBroadcastMessage("已经打开银行")
    end,

    OpenAutionHouse = function(player) --打开拍卖行
        player:SendAuctionMenu(player)
        player:SendBroadcastMessage("已经打开拍卖行")
    end,

    OpenMailBox = function(player) --打开邮箱
        player:SendShowMailBox(player:GetGUID())
        player:SendBroadcastMessage("已经打开邮箱")
    end,

    WeakOut = function(player)       --移除复活虚弱
        if (player:HasAura(15007)) then
            player:RemoveAura(15007) --移除复活虚弱
            player:SetHealth(player:GetMaxHealth())
            --self:RemoveAllAuras()        --移除所有状态
            player:SendBroadcastMessage("你的身上的复活虚弱状态已经被移除。")
        else
            player:SendBroadcastMessage("你的身上没有复活虚弱状态。")
        end
    end,

    OutCombat = function(player) --脱离战斗
        if (player:IsInCombat()) then
            player:ClearInCombat()
            player:SendAreaTriggerMessage("你已经脱离战斗")
            player:SendBroadcastMessage("你已经脱离战斗。")
        else
            player:SendAreaTriggerMessage("你并没有在战斗。")
            player:SendBroadcastMessage("你并没有在战斗。")
        end
    end,

    ResetTalents = function(player) --重置天赋
        player:ResetTalents(true)   --免费
        player:SendBroadcastMessage("已经重置天赋")
    end,

    ResetPetTalents = function(player) --重置宠物天赋
        player:ResetPetTalents()
        player:SendBroadcastMessage("已经重置宠物天赋")
    end,

    ResetAllCD = function(player) --刷新冷却
        player:ResetAllCooldowns()
        player:SendBroadcastMessage("已经重置物品和技能冷却")
    end,

    RepairAll = function(player) --修理装备
        player:DurabilityRepairAll(true, 1, false)
        player:SendBroadcastMessage("修理完所有装备。")
    end,

    SaveToDB = function(player) --保存数据
        player:SaveToDB()
        player:SendAreaTriggerMessage("保存数据完成")
    end,

    Logout = function(player) --返回选择角色
        player:SendAreaTriggerMessage("正在返回选择角色菜单")
        player:LogoutPlayer(true)
    end,

    LogoutNosave = function(player) --不保存数据,返回选择角色
        player:SendAreaTriggerMessage("正在返回选择角色菜单")
        player:LogoutPlayer(false)
    end,

    UnBind = function(player) --副本解绑
        local nowmap = player:GetMapId()
        for k, v in pairs(Instances) do
            local mapid = v[1]
            if (mapid ~= nowmap) then
                player:UnbindInstance(v[1], v[2])
            else
                player:SendBroadcastMessage("你所在的当前副本无法解除绑定。")
            end
        end
        player:SendAreaTriggerMessage("已经解除所有副本的绑定")
        player:SendBroadcastMessage("已经解除所有副本的绑定。")
    end
}

local Menu = {
    [MMENU] = { --主菜单
        { FUNC, "传送→位置", Stone.GoHome, GOSSIP_ICON_INTERACT_1, false, "是否传送回|cFFF0F000记录位置|r ?" },
        { FUNC, "记录←位置", Stone.SetHome, GOSSIP_ICON_INTERACT_2, false, "是否记录当前|cFFF0F000位置|r ?" },
        { MENU, "地图传送", TPMENU, GOSSIP_ICON_TAXI },
        -- { FUNC, "修理装备", Stone.RepairAll, GOSSIP_ICON_MONEY_BAG, false, "需要花费金币修理装备 ?" },
        { FUNC, "在线银行", Stone.OpenBank, GOSSIP_ICON_MONEY_BAG },
        { FUNC, "空中邮箱", Stone.OpenMailBox, GOSSIP_ICON_CHAT },
        -- { FUNC, "在线拍卖行", Stone.OpenAutionHouse, GOSSIP_ICON_MONEY_BAG }, --目前会出现搜索不出物品
        -- { FUNC, "召唤传送师", ST.SummonTeleporterSNPC, GOSSIP_ICON_TAXI },
        -- { FUNC, "召唤技能师", ST.SummonSpellerRNPC, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤超级商人", ST.SummonSuperVendorNPC, GOSSIP_ICON_MONEY_BAG },
        { MENU, "召唤商业训练师", PTMENU, GOSSIP_ICON_TRAINER },
        { MENU, "其他功能", MMENU + 0x10, GOSSIP_ICON_CHAT },
        -- { FUNC, "强制脱离战斗", Stone.OutCombat, GOSSIP_ICON_DOT },
    },

    [MMENU + 0x10] = { --其他功能
        { FUNC, "重置副本", Stone.UnBind, GOSSIP_ICON_INTERACT_2, false, "是否重置所有副本进度 ?" },
        { FUNC, "解除虚弱", Stone.WeakOut, GOSSIP_ICON_INTERACT_1, false, "是否解除虚弱，并回复生命 ?" },
        { FUNC, "重置天赋", Stone.ResetTalents, GOSSIP_ICON_TRAINER, false, "确认重置天赋 ?" },
        -- { FUNC, "空中邮箱", Stone.OpenMailBox, GOSSIP_ICON_CHAT },
    },

    [GMMENU] = { --GM菜单
        { FUNC, "重置所有冷却", Stone.ResetAllCD, GOSSIP_ICON_INTERACT_1, false, "确认重置所有冷却 ?" },
        { FUNC, "保存角色", Stone.SaveToDB, GOSSIP_ICON_INTERACT_1 },
        { FUNC, "返回选择角色", Stone.Logout, GOSSIP_ICON_INTERACT_1, false, "返回选择角色界面 ?" },
        { FUNC, "|cFF800000不保存角色|r", Stone.LogoutNosave, GOSSIP_ICON_INTERACT_1, false, "|cFFFF0000不保存角色，并返回选择角色界面 ?|r" },

    },

    [TPMENU] = { --传送菜单
        { MENU, "|cFF002244[城市]|r主要城市", TPMENU + 0x10, GOSSIP_ICON_BATTLE },
        { MENU, "|cFF002288[出生]|r种族出生地", TPMENU + 0x20, GOSSIP_ICON_BATTLE },
        { MENU, "|cFF0022CC[野外]|r东部王国", TPMENU + 0x30, GOSSIP_ICON_BATTLE },
        { MENU, "|cFF0022CC[野外]|r卡利姆多", TPMENU + 0x40, GOSSIP_ICON_BATTLE },
        { MENU, "|cFF0022CC[野外]|r外域", TPMENU + 0x50, GOSSIP_ICON_BATTLE },
        { MENU, "|cFF0022CC[野外]|r诺森德", TPMENU + 0x60, GOSSIP_ICON_BATTLE },
        { MENU, "|cFF822222【5人】经典旧世界地下城|r    ★☆☆☆☆", TPMENU + 0x70, GOSSIP_ICON_BATTLE },
        { MENU, "|cFF922222【5人】燃烧的远征地下城|r    ★★☆☆☆", TPMENU + 0x80, GOSSIP_ICON_BATTLE },
        { MENU, "|cFFA22222【5人】巫妖王之怒地下城|r    ★★★☆☆", TPMENU + 0x90, GOSSIP_ICON_BATTLE },
        { MENU, "|cFFB22222【10人-40人】团队地下城|r  ★★★★★", TPMENU + 0xa0, GOSSIP_ICON_BATTLE },
        { MENU, "|cFF0022FF[特殊]|r竞技场传送", TPMENU + 0xb0, GOSSIP_ICON_BATTLE },
        { MENU, "|cFF0022FF[特殊]|r传送到职业训练", MMENU + 0x20, GOSSIP_ICON_TAXI },
        { MENU, "|cFF0022FF[特殊]|r传送到技能训练|cFF0000FF[武器/骑术/飞行]|r", MMENU + 0x30, GOSSIP_ICON_TAXI },
        --{MENU, "风景传送",							TPMENU+0xc0,	GOSSIP_ICON_BATTLE},
        --{MENU, "野外BOSS传送",						TPMENU+0xd0,	GOSSIP_ICON_BATTLE},
    },

    [TPMENU + 0x10] = { --主要城市
        { TP, "暴风城", 0, -8832.833, 633.1505, 94.2408, 1.70201, TEAM_ALLIANCE },
        { TP, "铁炉堡", 0, -4926.76, -949.64, 501.559, 2.24414, TEAM_ALLIANCE },
        { TP, "达纳苏斯", 1, 9869.91, 2493.58, 1315.88, 2.78897, TEAM_ALLIANCE },
        { TP, "埃索达", 530, -3864.92, -11643.7, -137.644, 5.50862, TEAM_ALLIANCE },
        { TP, "奥格瑞玛", 1, 1601.08, -4378.69, 9.9846, 2.14362, TEAM_HORDE },
        { TP, "幽暗城", 0, 1633.75, 240.167, -43.1034, 6.26128, TEAM_HORDE },
        { TP, "雷霆崖", 1, -1274.45, 71.8601, 128.159, 2.80623, TEAM_HORDE },
        { TP, "银月城", 530, 9738.28, -7454.19, 13.5605, 0.043914, TEAM_HORDE },
        { TP, "|cFF001088[中立]|r棘齿城", 1, -955.219, -3678.92, 8.29946, 0, TEAM_NONE, 10, 20000 },
        { TP, "|cFF003088[中立]|r加基森", 1, -7122.8, -3704.82, 14.0526, 0, TEAM_NONE, 30, 20000 },
        { TP, "|cFF003588[中立]|r藏宝海湾", 0, -14281.9, 552.564, 8.90422, 0.860144, TEAM_NONE, 35, 20000 },
        { TP, "|cFF005588[中立]|r永望镇", 1, 6724.58, -4609.16, 720.597, 4.87852, TEAM_NONE, 55, 20000 },
        { TP, "|cFF006088[外域]|r沙塔斯", 530, -1887.62, 5359.09, -12.4279, 4.40435, TEAM_NONE, 60, 50000 }, --增加显示此菜单等级，传送使用金币
        { TP, "|cFF007088[诺森德]|r达拉然", 571, 5809.55, 503.975, 657.526, 2.38338, TEAM_NONE, 70, 100000 },

    },

    [TPMENU + 0x20] = { --各种族出生地
        { TP, "人类出生地", 0, -8949.95, -132.493, 83.5312, 0, TEAM_ALLIANCE },
        { TP, "矮人出生地", 0, -6240.32, 331.033, 382.758, 6.1, TEAM_ALLIANCE },
        { TP, "侏儒出生地", 0, -6240, 331, 383, 0, TEAM_ALLIANCE },
        { TP, "暗夜精灵出生地", 1, 10311.3, 832.463, 1326.41, 5.6, TEAM_ALLIANCE },
        { TP, "德莱尼出生地", 530, -3961.64, -13931.2, 100.615, 2, TEAM_ALLIANCE },
        { TP, "兽人出生地", 1, -618.518, -4251.67, 38.718, 0, TEAM_HORDE },
        { TP, "巨魔出生地", 1, -618.518, -4251.67, 38.7, 4.747, TEAM_HORDE },
        { TP, "牛头人出生地", 1, -2917.58, -257.98, 52.9968, 0, TEAM_HORDE },
        { TP, "亡灵出生地", 0, 1676.71, 1678.31, 121.67, 2.70526, TEAM_HORDE },
        { TP, "血精灵出生地", 530, 10349.6, -6357.29, 33.4026, 5.31605, TEAM_HORDE },
        { TP, "|cFF005588死亡骑士出生地|r", 609, 2355.84, -5664.77, 426.028, 3.65997, TEAM_NONE, 55, 0 },
    },

    [TPMENU + 0x30] = { --东部王国
        { TP, "艾尔文森林", 0, -9449.06, 64.8392, 56.3581, 3.0704, TEAM_NONE, 1, 1000 },
        { TP, "永歌森林", 530, 9024.37, -6682.55, 16.8973, 3.1413, TEAM_NONE, 1, 1000 },
        { TP, "丹莫罗", 0, -5603.76, -482.704, 396.98, 5.2349, TEAM_NONE, 1, 1000 },
        { TP, "提瑞斯法林地", 0, 2274.95, 323.918, 34.1137, 4.2436, TEAM_NONE, 1, 1000 },
        { TP, "洛克莫丹", 0, -5405.85, -2894.15, 341.972, 5.4823, TEAM_NONE, 10, 2000 },
        { TP, "幽魂之地", 530, 7595.73, -6819.6, 84.3718, 2.5656, TEAM_NONE, 10, 2000 },
        { TP, "西部荒野", 0, -10684.9, 1033.63, 32.5389, 6.0738, TEAM_NONE, 10, 2000 },
        { TP, "银松森林", 0, 505.126, 1504.63, 124.808, 1.7798, TEAM_NONE, 10, 2000 },
        { TP, "赤脊山", 0, -9447.8, -2270.85, 71.8224, 0.28385, TEAM_NONE, 15, 20000 }, --官服坐飞机都是2G起，所以并不贵
        { TP, "暮色森林", 0, -10531.7, -1281.91, 38.8647, 1.5695, TEAM_NONE, 18, 20000 },
        { TP, "湿地", 0, -3517.75, -913.401, 8.86625, 2.607, TEAM_NONE, 20, 20000 },
        { TP, "希尔斯布莱德丘陵", 0, -385.805, -787.954, 54.6655, 1.0392, TEAM_NONE, 20, 20000 },
        { TP, "奥特兰克山脉", 0, 275.049, -652.044, 130.296, 0.50203, TEAM_NONE, 25, 20000 },
        { TP, "阿拉希高地", 0, -1581.45, -2704.06, 35.4168, 0.490373, TEAM_NONE, 30, 20000 },
        { TP, "荆棘谷", 0, -11921.7, -59.544, 39.7262, 3.7357, TEAM_NONE, 30, 20000 },
        { TP, "荒芜之地", 0, -6782.56, -3128.14, 240.48, 5.6591, TEAM_NONE, 35, 20000 },
        { TP, "悲伤沼泽", 0, -10368.6, -2731.3, 21.6537, 5.2923, TEAM_NONE, 35, 20000 },
        { TP, "辛特兰", 0, 112.406, -3929.74, 136.358, 0.981903, TEAM_NONE, 40, 20000 },
        { TP, "灼热峡谷", 0, -6686.33, -1198.55, 240.027, 0.91688, TEAM_NONE, 43, 20000 },
        { TP, "诅咒之地", 0, -11184.7, -3019.31, 7.29238, 3.20542, TEAM_NONE, 45, 20000 },
        { TP, "燃烧平原", 0, -7979.78, -2105.72, 127.919, 5.10148, TEAM_NONE, 50, 20000 },
        { TP, "西瘟疫之地", 0, 1743.69, -1723.86, 59.6648, 5.23722, TEAM_NONE, 51, 20000 },
        { TP, "东瘟疫之地", 0, 2280.64, -5275.05, 82.0166, 4.747, TEAM_NONE, 53, 20000 },
        { TP, "奎尔丹纳斯岛", 530, 12806.5, -6911.11, 41.1156, 2.2293, TEAM_NONE, 68, 50000 },
    },

    [TPMENU + 0x40] = { --卡利姆多
        { TP, "秘蓝岛", 530, -4192.62, -12576.7, 36.7598, 1.62813, TEAM_NONE, 1, 1000 },
        { TP, "秘血岛", 530, -2095.7, -11841.1, 51.1557, 6.19288, TEAM_NONE, 1, 1000 },
        { TP, "泰达希尔", 1, 9889.03, 915.869, 1307.43, 1.9336, TEAM_NONE, 1, 1000 },
        { TP, "杜隆塔尔", 1, 228.978, -4741.87, 10.1027, 0.416883, TEAM_NONE, 1, 1000 },
        { TP, "莫高雷", 1, -2473.87, -501.225, -9.42465, 0.6525, TEAM_NONE, 1, 1000 },
        { TP, "黑海岸", 1, 6463.25, 683.986, 8.92792, 4.33534, TEAM_NONE, 10, 2000 },
        { TP, "贫瘠之地", 1, -1028.95, -2462.17, 91.6679, 5.83412, TEAM_NONE, 10, 2000 },
        { TP, "石爪山脉", 1, 1574.89, 1031.57, 137.442, 3.8013, TEAM_NONE, 15, 20000 },
        { TP, "灰谷森林", 1, 1919.77, -2169.68, 94.6729, 6.14177, TEAM_NONE, 18, 20000 },
        { TP, "千针石林", 1, -5375.53, -2509.2, -40.432, 2.41885, TEAM_NONE, 30, 20000 },
        { TP, "凄凉之地", 1, -656.056, 1510.12, 88.3746, 3.29553, TEAM_NONE, 30, 20000 },
        { TP, "尘泥沼泽", 1, -3350.12, -3064.85, 33.0364, 5.12666, TEAM_NONE, 35, 20000 },
        { TP, "菲拉斯", 1, -4808.31, 1040.51, 103.769, 2.90655, TEAM_NONE, 40, 20000 },
        { TP, "塔纳利斯沙漠", 1, -6940.91, -3725.7, 48.9381, 3.11174, TEAM_NONE, 40, 20000 },
        { TP, "艾萨拉", 1, 3117.12, -4387.97, 91.9059, 5.49897, TEAM_NONE, 45, 20000 },
        { TP, "费伍德森林", 1, 3898.8, -1283.33, 220.519, 6.24307, TEAM_NONE, 48, 20000 },
        { TP, "安戈洛环形山", 1, -6291.55, -1158.62, -258.138, 0.457099, TEAM_NONE, 48, 20000 },
        { TP, "希利苏斯", 1, -6815.25, 730.015, 40.9483, 2.39066, TEAM_NONE, 50, 20000 },
        { TP, "冬泉谷", 1, 6658.57, -4553.48, 718.019, 5.18088, TEAM_NONE, 55, 20000 },
    },

    [TPMENU + 0x50] = { --外域
        { TP, "地狱火半岛", 530, -207.335, 2035.92, 96.464, 1.59676, TEAM_NONE, 60, 50000 },
        { TP, "地狱火半岛-荣耀堡", 530, -683.05, 2657.57, 91.04, 1, TEAM_ALLIANCE, 60, 50000 },
        { TP, "地狱火半岛-萨尔玛", 530, 139.96, 2671.51, 85.509, 1, TEAM_HORDE, 60, 50000 },
        { TP, "赞加沼泽", 530, -220.297, 5378.58, 23.3223, 1.61718, TEAM_NONE, 62, 50000 },
        { TP, "泰罗卡森林", 530, -2266.23, 4244.73, 1.47728, 3.68426, TEAM_NONE, 64, 50000 },
        { TP, "纳格兰", 530, -1610.85, 7733.62, -17.2773, 1.33522, TEAM_NONE, 64, 50000 },
        { TP, "刀锋山", 530, 2029.75, 6232.07, 133.495, 1.30395, TEAM_NONE, 66, 50000 },
        { TP, "虚空风暴", 530, 3271.2, 3811.61, 143.153, 3.44101, TEAM_NONE, 68, 50000 },
        { TP, "影月谷", 530, -3681.01, 2350.76, 76.587, 4.25995, TEAM_NONE, 68, 50000 },
    },

    [TPMENU + 0x60] = { --诺森德
        { TP, "北风苔原", 571, 2954.24, 5379.13, 60.4538, 2.55544, TEAM_NONE, 68, 100000 },
        { TP, "凛风峡湾", 571, 682.848, -3978.3, 230.161, 1.54207, TEAM_NONE, 68, 100000 },
        { TP, "龙骨荒野", 571, 2678.17, 891.826, 4.37494, 0.101121, TEAM_NONE, 71, 100000 },
        { TP, "灰熊丘陵", 571, 4017.35, -3403.85, 290, 5.35431, TEAM_NONE, 73, 100000 },
        { TP, "祖达克", 571, 5560.23, -3211.66, 371.709, 5.55055, TEAM_NONE, 74, 100000 },
        { TP, "索拉查盆地", 571, 5614.67, 5818.86, -69.722, 3.60807, TEAM_NONE, 75, 100000 },
        { TP, "水晶之歌森林", 571, 5411.17, -966.37, 167.082, 1.57167, TEAM_NONE, 74, 100000 },
        { TP, "风暴峭壁", 571, 6120.46, -1013.89, 408.39, 5.12322, TEAM_NONE, 76, 100000 },
        { TP, "冰冠冰川", 571, 8323.28, 2763.5, 655.093, 2.87223, TEAM_NONE, 77, 100000 },
        { TP, "冬拥湖", 571, 4522.23, 2828.01, 389.975, 0.215009, TEAM_NONE, 77, 100000 },
    },

    [TPMENU + 0x70] = { --经典旧世界地下城★
        { TP, "怒焰裂谷", 1, 1811.78, -4410.5, -18.4704, 5.20165, TEAM_NONE, 15, 1000 },
        { TP, "死亡矿井", 0, -11209.6, 1666.54, 24.6974, 1.42053, TEAM_NONE, 17, 1000 },
        { TP, "哀嚎洞穴", 1, -731.607, -2218.39, 17.0281, 2.78486, TEAM_NONE, 17, 20000 },
        { TP, "影牙城堡", 0, -234.675, 1561.63, 76.8921, 1.24031, TEAM_NONE, 18, 20000 },
        { TP, "暴风城监狱", 0, -8799.15, 832.718, 97.6348, 6.04085, TEAM_NONE, 22, 20000 },
        { TP, "剃刀沼泽", 1, -4470.28, -1677.77, 81.3925, 1.16302, TEAM_NONE, 24, 20000 },
        { TP, "黑暗深渊", 1, 4249.99, 740.102, -25.671, 1.34062, TEAM_NONE, 21, 20000 },
        { TP, "诺莫瑞根", 0, -5163.54, 925.423, 257.181, 1.57423, TEAM_NONE, 25, 20000 },
        { TP, "血色修道院", 0, 2873.15, -764.523, 160.332, 5.10447, TEAM_NONE, 29, 20000 },
        { TP, "剃刀高地", 1, -4657.3, -2519.35, 81.0529, 4.54808, TEAM_NONE, 34, 20000 },
        { TP, "奥达曼", 0, -6071.37, -2955.16, 209.782, 0.015708, TEAM_NONE, 37, 20000 },
        { TP, "玛拉顿", 1, -1421.42, 2907.83, 137.415, 1.70718, TEAM_NONE, 41, 20000 },
        { TP, "祖尔法拉克", 1, -6801.19, -2893.02, 9.00388, 0.158639, TEAM_NONE, 43, 20000 },
        { TP, "沉没的神庙", 0, -10177.9, -3994.9, -111.239, 6.01885, TEAM_NONE, 47, 20000 },
        { TP, "黑石深渊", 0, -7179.34, -921.212, 165.821, 5.09599, TEAM_NONE, 49, 20000 },
        { TP, "黑石塔", 0, -7527.05, -1226.77, 285.732, 5.29626, TEAM_NONE, 57, 20000 },
        { TP, "厄运之槌", 1, -3520.14, 1119.38, 161.025, 4.70454, TEAM_NONE, 55, 20000 },
        { TP, "通灵学院", 0, 1269.64, -2556.21, 93.6088, 0.620623, TEAM_NONE, 55, 20000 },
        { TP, "斯坦索姆", 0, 3352.92, -3379.03, 144.782, 6.25978, TEAM_NONE, 55, 20000 },
    },

    [TPMENU + 0x80] = { --燃烧的远征地下城★
        { TP, "|cFF0000FF地狱火堡垒[地狱火城墙]|r", 530, -360.671, 3071.90, -15.1, 1.883, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF地狱火堡垒[鲜血熔炉]|r", 530, -296.487, 3154.6098, 31.617, 2.24, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF地狱火堡垒[破碎大厅]|r", 530, -308.05, 3066.98, -3.018, 1.76, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF盘牙水库[奴隶围栏]|r", 530, 727.828, 7011.997, -71.861, 0.245473, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF盘牙水库[幽暗沼泽]|r", 530, 777.089, 6763.45, -72.066, 5.03985, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF盘牙水库[蒸汽地窟]|r", 530, 817.459, 6934.923, -80.624, 1.51974, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF奥金顿[塞泰克大厅]|r", 530, -3362.165, 4826.771, -101.396, 4.73, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF奥金顿[法力陵墓]|r", 530, -3243.83, 4942.69, -101.364, 0, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF奥金顿[奥金尼地穴]|r", 530, -3362.06, 5059.393, -101.396, 1.573, TEAM_NONE, 61, 100000 },
        { TP, "|cFF4B0082奥金顿[暗影迷宫]|r", 530, -3494.912, 4943.865, -101.393, 3.125, TEAM_NONE, 65, 100000 },
        { TP, "|cFF4B0082时光之穴[黑色沼泽]|r", 1, -8742.04, -4217.996, -209.5, 2.1, TEAM_NONE, 66, 100000 },
        { TP, "|cFF4B0082时光之穴[旧希尔斯布莱德丘陵]|r", 1, -8391.215, -4064.293, -208.585, 0.199, TEAM_NONE, 66, 100000 },
        { TP, "|cFF4B0082风暴要塞[禁魔监狱]|r", 530, 3281.65, 1408.55, 502.413, 5.22, TEAM_NONE, 68, 100000 },
        { TP, "|cFF4B0082风暴要塞[生态船]|r", 530, 3351.35, 1530.116, 179.69, 5.63, TEAM_NONE, 68, 100000 },
        { TP, "|cFF4B0082风暴要塞[能源舰]|r", 530, 2926.8, 1603.597, 249, 3.91, TEAM_NONE, 68, 100000 },
        { TP, "|cFF4B0082魔导师平台|r", 530, 12884.6, -7317.69, 65.5023, 4.799, TEAM_NONE, 68, 100000 },
    },

    [TPMENU + 0x90] = { --巫妖王之怒地下城★
        { TP, "|cFF4B0082乌特加德城堡|r", 571, 1203.41, -4868.59, 41.2486, 0.283237, TEAM_NONE, 65, 100000 },
        { TP, "|cFF4B0082魔枢|r", 571, 3782.89, 6965.23, 105.088, 6.14194, TEAM_NONE, 66, 100000 },
        { TP, "|cFF4B0082艾卓-尼鲁布|r", 571, 3707.86, 2150.23, 36.76, 3.22, TEAM_NONE, 67, 100000 },
        { TP, "|cFF4B0082达克萨隆要塞|r", 571, 4765.59, -2038.24, 229.363, 0.887627, TEAM_NONE, 69, 100000 },
        { TP, "|cFF4B0082紫罗兰监狱|r", 571, 5693.08, 502.588, 652.672, 4.0229, TEAM_NONE, 70, 100000 },
        { TP, "|cFFB22222古达克|r", 571, 6722.44, -4640.67, 450.632, 3.91123, TEAM_NONE, 71, 100000 },
        { TP, "|cFFB22222岩石大厅|r", 571, 8922.12, -1009.16, 1039.56, 1.57044, TEAM_NONE, 72, 100000 },
        { TP, "|cFFB22222净化斯坦索姆|r", 1, -8756.39, -4440.68, -199.489, 4.66289, TEAM_NONE, 75, 100000 },
        { TP, "|cFFB22222闪电大厅|r", 571, 9136.52, -1311.81, 1066.29, 5.19113, TEAM_NONE, 75, 100000 },
        { TP, "|cFFB22222乌特加德之巅|r", 571, 1267.24, -4857.3, 215.764, 3.22768, TEAM_NONE, 75, 100000 },
        { TP, "|cFFB22222冰封大殿|r[灵魂洪炉/映像大厅/萨隆矿坑]", 571, 5643.16, 2028.81, 798.274, 4.60242, TEAM_NONE, 80, 100000 },
        { TP, "|cFFB22222冠军的试炼|r", 571, 8590.95, 791.792, 558.235, 3.13127, TEAM_NONE, 80, 100000 },
    },

    [TPMENU + 0xa0] = { --团队地下城★
        { TP, "|cFF0000FF【20人】祖尔格拉布|r", 0, -11916.7, -1215.72, 92.289, 4.72454, TEAM_NONE, 57, 100000 },
        { TP, "|cFF0000FF【20人】安其拉废墟|r", 1, -8409.82, 1499.06, 27.7179, 2.51868, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF【40人】熔火之心|r", 230, 1126.64, -459.94, -102.535, 3.46095, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF【40人】安其拉神殿|r", 1, -8240.09, 1991.32, 129.072, 0.941603, TEAM_NONE, 60, 100000 },
        { TP, "|cFF0000FF【40人】黑翼之巢|r", 229, 152.451, -474.881, 116.84, 0.001073, TEAM_NONE, 60, 100000 },
        { TP, "|cFF4B0082【25人】格鲁尔的巢穴|r", 530, 3530.06, 5104.08, 3.50861, 5.51117, TEAM_NONE, 70, 100000 },
        { TP, "|cFF4B0082【25人】玛瑟里顿的巢穴|r", 530, -336.411, 3130.46, -102.928, 5.20322, TEAM_NONE, 70, 100000 },
        { TP, "|cFF4B0082【10人】卡拉赞|r", 0, -11105.9, -2000.33, 49.4819, 0.649895, TEAM_NONE, 70, 100000 },
        { TP, "|cFF4B0082【10人】祖阿曼|r", 530, 6851.78, -7972.57, 179.242, 4.64691, TEAM_NONE, 70, 100000 },
        { TP, "|cFF4B0082【25人】黑暗神殿|r", 530, -3649.92, 317.469, 35.2827, 2.94285, TEAM_NONE, 70, 100000 },
        { TP, "|cFF4B0082【25人】海加尔山之巅|r", 1, -8177.89, -4181.23, -167.552, 0.913338, TEAM_NONE, 70, 100000 },
        { TP, "|cFF4B0082【25人】毒蛇神殿|r", 530, 797.855, 6865.77, -65.4165, 0.005938, TEAM_NONE, 70, 100000 },
        { TP, "|cFF4B0082【25人】太阳之井高地|r", 530, 12574.1, -6774.81, 15.0904, 3.13788, TEAM_NONE, 70, 100000 },
        { TP, "|cFF4B0082【25人】风暴要塞|r", 530, 3088.49, 1381.57, 184.863, 4.61973, TEAM_NONE, 70, 100000 },
        { TP, "|cFFB22222【10人/25人】十字军的试炼|r", 571, 8515.61, 714.153, 558.248, 1.57753, TEAM_NONE, 80, 100000 },
        { TP, "|cFFB22222【10人/25人】冰冠堡垒|r", 571, 5855.22, 2102.03, 635.991, 3.57899, TEAM_NONE, 80, 100000 },
        { TP, "|cFFB22222【10人/25人】奥妮克希亚的巢穴|r", 1, -4708.27, -3727.64, 54.5589, 3.72786, TEAM_NONE, 80, 100000 },
        { TP, "|cFFB22222【10人/25人】纳克萨玛斯|r", 571, 3668.72, -1262.46, 243.622, 4.785, TEAM_NONE, 80, 100000 },
        { TP, "|cFFB22222【10人/25人】永恒之眼|r", 571, 3784.17, 7028.84, 161.258, 5.79993, TEAM_NONE, 80, 100000 },
        { TP, "|cFFB22222【10人/25人】奥杜尔|r", 571, 9222.88, -1113.59, 1216.12, 6.27549, TEAM_NONE, 80, 100000 },
        { TP, "|cFFB22222【10人/25人】黑曜石圣殿|r", 571, 3472.43, 264.923, -120.146, 3.27923, TEAM_NONE, 80, 100000 },
        { TP, "|cFFB22222【10人/25人】阿尔卡冯的宝库|r", 571, 5453.72, 2840.79, 421.28, 0.01, TEAM_NONE, 80, 100000 },
    },


    [TPMENU + 0xb0] = { --特色任务传送
        { TP, "古拉巴什竞技场", 0, -13181.8, 339.356, 42.9805, 1.18013 },
        { TP, "奥特兰战场", 0, 5.599396, -308.73822, 132.26651, 0, TEAM_ALLIANCE },
        { TP, "阿拉希战场", 0, -1229.860352, -2545.07959, 21.180079, 0, TEAM_ALLIANCE },
        { TP, "奥特兰战场", 0, 396.471863, -1006.229126, 111.719086, 0, TEAM_HORDE },
        { TP, "阿拉希战场", 0, -847.953491, -3519.764893, 72.607727, 0, TEAM_HORDE },
        { TP, "战歌峡谷", 1, 1036.794800, -2106.138672, 122.94553, 0, TEAM_HORDE },
    },

    [TPMENU + 0xc0] = { --风景传送
        { TP, "GM之岛", 1, 16222.1, 16252.1, 12.5872, 0 },
        { TP, "时光之穴", 1, -8173.93018, -4737.46387, 33.77735, 0 },
        { TP, "双塔山", 1, -3331.35327, 2225.72827, 30.9877, 0 },
        { TP, "梦境之树", 1, -2914.7561, 1902.19934, 34.74103, 0 },
        { TP, "恐怖之岛", 1, 4603.94678, -3879.25097, 944.18347, 0 },
        { TP, "天涯海滩", 1, -9851.61719, -3608.47412, 8.93973, 0 },
        { TP, "安戈洛环形山", 1, -8562.09668, -2106.05664, 8.85254, 0 },
        { TP, "石堡瀑布", 0, -9481.49316, -3326.91528, 8.86435, 0 },
        { TP, "暴雪建设公司路障", 1, 5478.06006, -3730.8501, 1593.44, 0 },
    },

    [TPMENU + 0xd0] = { --野外BOSS传送
        { TP, "暮色森林", 0, -10526.16895, -434.996796, 50.8948, 0 },
        { TP, "辛特兰", 0, 759.605713, -3893.341309, 116.4753, 0 },
        { TP, "灰谷", 1, 3120.289307, -3439.444336, 139.5663, 0 },
        { TP, "艾萨拉", 1, 2622.219971, -5977.930176, 100.5629, 0 },
        { TP, "菲拉斯", 1, -2741.290039, 2009.481323, 31.8773, 0 },
        { TP, "诅咒之地", 0, -12234, -2474, -3, 0 },
        { TP, "水晶谷", 1, -6292.463379, 1578.029053, 0.1553, 0 },
    },

    [MMENU + 0x20] = { --联盟职业技能训练师
        --Alliance
        { TP, "战士训练师", 0, -8682.700195, 322.091125, 109.437958, 0, TEAM_ALLIANCE },
        { TP, "圣骑士训练师", 0, -8573.793945, 877.343018, 106.519310, 0, TEAM_ALLIANCE },
        { TP, "死亡骑士训练师", 0, 2365.21, -5658.35, 426.06, 0, TEAM_ALLIANCE },
        { TP, "萨满训练师", 0, -9032.573242, 545.842590, 72.160950, 0, TEAM_ALLIANCE },
        { TP, "猎人训练师", 0, -8422.097656, 550.078674, 95.448730, 0, TEAM_ALLIANCE },
        { TP, "德鲁伊训练师", 1, 7870.23, -2586.97, 486.95, 0, TEAM_ALLIANCE },
        { TP, "盗贼训练师", 0, -8751.876953, 381.321930, 101.056236, 0, TEAM_ALLIANCE },
        { TP, "法师训练师", 0, -9009.386719, 875.746765, 29.621387, 0, TEAM_ALLIANCE },
        { TP, "术士训练师", 0, -8972.834961, 1027.723511, 101.40416, 0, TEAM_ALLIANCE },
        { TP, "牧师训练师", 0, -8517.649414, 858.083801, 109.81385, 0, TEAM_ALLIANCE },
        --Horde
        { TP, "战士训练师", 1, 1971.24, -4805.08, 56.99, 0, TEAM_HORDE },
        { TP, "圣骑士训练师", 1, 1936.14, -4138.31, 41.03, 0, TEAM_HORDE },
        { TP, "死亡骑士训练师", 0, 2365.21, -5658.35, 426.06, 0, TEAM_HORDE },
        { TP, "萨满训练师", 1, 1928.482, -4228.17, 42.3219, 0, TEAM_HORDE },
        { TP, "猎人训练师", 1, 2135.33, -4610.78, 54.3865, 0, TEAM_HORDE },
        { TP, "德鲁伊训练师", 1, 7870.23, -2586.97, 486.95, 0, TEAM_HORDE },
        { TP, "盗贼训练师", 1, 1776.47, -4285.65, 7.44, 0, TEAM_HORDE },
        { TP, "法师训练师", 1, 1468.58, -4221.86, 59.22, 0, TEAM_HORDE },
        { TP, "术士训练师", 1, 1838.19, -4355.78, -14.71, 0, TEAM_HORDE },
        { TP, "牧师训练师", 1, 1454.71, -4179.42, 61.56, 0, TEAM_HORDE },
    },

    [MMENU + 0x30] = { --专业技能训练师
        --Alliance
        { TP, "武器训练师", 0, -8793.120117, 613.002991, 96.856400, 0, TEAM_ALLIANCE },
        { TP, "骑术训练师", 0, -9443.556641, -1388.178345, 46.9881, 0, TEAM_ALLIANCE },
        { TP, "飞行训练师", 530, -676.925598, 2730.669434, 93.9085, 0, TEAM_ALLIANCE },
        --Horde
        { TP, "武器训练师", 1, 2093.829346, -4821.349609, 24.382, 0, TEAM_HORDE },
        { TP, "骑术训练师", 530, 9268.768555, -7508.026367, 38.09, 0, TEAM_HORDE },
        { TP, "飞行训练师", 530, 48.719337, 2741.370850, 85.255180, 0, TEAM_HORDE },
    },

    [PTMENU] = { --GM菜单
        { FUNC, "召唤炼金训练师", ST.SummonNPCAlchemy, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤锻造训练师", ST.SummonNPCBlacksmithing, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤附魔训练师", ST.SummonNPCEnchanting, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤工程学训练师", ST.SummonNPCEngineering, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤草药训练师", ST.SummonNPCHerbalism, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤铭文训练师", ST.SummonNPCInscription, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤珠宝加工训练师", ST.SummonNPCJewelcrafting, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤皮甲训练师", ST.SummonNPCLeatherworking, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤采矿训练师", ST.SummonNPCMining, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤剥皮训练师", ST.SummonNPCSkinning, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤裁缝训练师", ST.SummonNPCTailoring, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤烹饪训练师", ST.SummonNPCCooking, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤急救训练师", ST.SummonNPCFirstAid, GOSSIP_ICON_TRAINER },
        { FUNC, "召唤钓鱼训练师", ST.SummonNPCFishing, GOSSIP_ICON_TRAINER },
    },
}

function Stone.AddGossip(player, item, id)
    player:GossipClearMenu() --清除菜单
    local Rows = Menu[id] or {}

    local Pteam = player:GetTeam()
    local teamStr, team = "", player:GetTeam()
    if (team == TEAM_ALLIANCE) then
        teamStr = "[|cFF0070d0联盟|r]"
    elseif (team == TEAM_HORDE) then
        teamStr = "[|cFFF000A0部落|r]"
    end

    for k, v in pairs(Rows) do
        local mtype, text, icon, intid = v[1], (v[2] or "???"), (v[4] or GOSSIP_ICON_CHAT), (id * 0x100 + k)
        if (mtype == MENU) then
            player:GossipMenuAddItem(icon, text, 0, (v[3] or id) * 0x100)
        elseif (mtype == FUNC) then
            local code, msg, money = v[5], (v[6] or ""), (v[7] or 0)
            if ((code == true or code == false)) then
                player:GossipMenuAddItem(icon, text, money, intid, code, msg, money)
            else
                player:GossipMenuAddItem(icon, text, 0, intid)
            end
        elseif (mtype == TP) then
			local mteam,level,money=(v[8] or TEAM_NONE),(v[9] or 0),(v[10] or 0)
            -- if (player:GetLevel() >= level) then
				if(mteam==Pteam)then
					player:GossipMenuAddItem(GOSSIP_ICON_TAXI, teamStr..text..ST.GetLevelDescStr(money, level), money, intid, false,"是否传送到 |cFFFFFF00"..text.."|r ?",money)
				elseif(mteam == TEAM_NONE)then
					player:GossipMenuAddItem(GOSSIP_ICON_TAXI, text..ST.GetLevelDescStr(money, level), money, intid, false,"是否传送到 |cFFFFFF00"..text.."|r ?",money)
				end
			-- end
        else
            player:GossipMenuAddItem(icon, text, 0, intid)
        end
    end

    if (id > 0) then --添加返回上一页菜单
        local length = string.len(string.format("%x", id))
        if (length > 1) then
            local temp = bit_and(id, 2 ^ ((length - 1) * 4) - 1)
            if (temp ~= MMENU) then
                player:GossipMenuAddItem(GOSSIP_ICON_CHAT, "上一页", 0, temp * 0x100)
            end
        end
    end

    if (id ~= MMENU) then --添加返回主菜单
        player:GossipMenuAddItem(GOSSIP_ICON_CHAT, "主菜单", 0, MMENU * 0x100)
    else
        if (player:GetGMRank() >= 3) then --是GM
            player:GossipMenuAddItem(GOSSIP_ICON_CHAT, "GM功能", 0, GMMENU * 0x100)
        end
        player:GossipMenuAddItem(GOSSIP_ICON_CHAT, "在线总时间：|cFF000080" .. Stone.GetTimeASString(player) .. "|r", 0,
            MMENU * 0x100)
    end

    player:GossipSendMenu(1, item) --发送菜单
end

function Stone.ShowGossip(event, player, item)
    -- player:MoveTo(0, player:GetX(), player:GetY(), player:GetZ() + 0.01) --移动就停止当前施法
    Stone.AddGossip(player, item, MMENU)    
    return false
end

function Stone.SelectGossip(event, player, item, sender, intid, code, menu_id)
    local menuid = math.modf(intid / 0x100) --菜单组
    local rowid  = intid - menuid * 0x100   --第几项

    if (rowid == 0) then
        Stone.AddGossip(player, item, menuid)
    else
        player:GossipComplete() --关闭菜单
        local v = Menu[menuid] and Menu[menuid][rowid]
        if (v) then             --如果找到菜单项
            local mtype = v[1] or MENU
            if (mtype == MENU) then
                Stone.AddGossip(player, item, (v[3] or MMENU))
            elseif (mtype == FUNC) then --功能
                local f = v[3]
                if (f) then
                    player:ModifyMoney(-sender) --扣费
                    f(player, code)
                end
            elseif (mtype == TP) then                        --传送
                local map, mapid, x, y, z, o = v[2], v[3], v[4], v[5], v[6], v[7] or 0
                local pname = player:GetName()               --得到玩家名
                if (player:Teleport(mapid, x, y, z, o)) then --传送
                    Nplayer = GetPlayerByName(pname)         --根据玩家名得到玩家
                    if (Nplayer) then
                        Nplayer:SendBroadcastMessage("已经到达 " .. map)
                        Nplayer:ModifyMoney(-sender) --扣费
                    end
                else
                    print(">>Eluna Error: Super Stone : Teleport To " .. mapid)
                end
            end
        end
    end
end

RegisterItemGossipEvent(itemEntry, 1, Stone.ShowGossip)
RegisterItemGossipEvent(itemEntry, 2, Stone.SelectGossip)
print(">>Script: wzSuperStone loaded.")
