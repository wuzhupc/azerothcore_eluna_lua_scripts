--[[
Author: wuzhu
Date: 2024-11-01 14:29:13
LastEditTime: 2024-11-01 14:38:46
FilePath: \lua\wzProfessions.lua
Description:
Copyright (c) 2024 by lawyee, All Rights Reserved.
--]]
print(">>Srcipt wzProfessions loading...")
local wzCommon = require("wzCommon")
local Professionser = {
    entry = 922002,
    --NPC [ID] = {"名字", mapID, X, Y, Z}
    --SELECT id1,l.`Name`, map,position_x,position_y,position_z from creature a LEFT JOIN creature_template_locale l on a.id1=l.entry and l.locale='zhTW'  WHERE id1 in (28702,28694,28700,28703, 33630,28704,28705,28698,28699,28697,28693, 33633,28742,28696,28701,28702)
    npcs = {
        [908] = { "弗洛拉·希沃温德", 0, -14481.1, 451.732, 30.6957 },
        [2627] = { "格拉尼克·古斯提", -14437.8, 384.766, 32.398 },
        [2834] = { "麦依兹·拉齐卡", 0, -14449.2, 468.424, 15.3565 },
        [2836] = { "布里克·基克拉夫", 0, -14383, 370.766, 24.006 },
        [2837] = { "加克森", 0, -14486.7, 431.513, 34.6682 },
        [8128] = { "皮库尔", 1, -7167.72, -3743.08, 8.78314 },
        [8736] = { "巴兹克·布拉斯温", 1, -7150.31, -3830.19, 8.5924 },
        [19184] = { "米尔蕾·弗莱彻尔", 530, -1592.02, 5263.72, -13.9117 },
        [28693] = { "附魔師奈爾桑尼斯", 571, 5846.42, 728.394, 642.08 },
        [28694] = { "艾拉得·席彌德", 571, 5913.41, 676.299, 643.579 },
        [28696] = { "戴里克·馬克思", 571, 5910.78, 763.743, 641.18 },
        [28697] = { "提摩菲·歐杉科", 571, 5923.3, 733.456, 642.212 },
        [28698] = { "捷帝迪亞·漢德斯", 571, 5924.54, 708.256, 642.621 },
        [28699] = { "查理斯·沃斯", 571, 5881.01, 752.591, 640.486 },
        [28700] = { "黛安·坎寧斯", 571, 5908.16, 764.413, 641.169 },
        [28701] = { "提摩西·瓊斯", 571, 5871.05, 714.891, 643.176 },
        [28702] = { "帕林教授", 571, 5860.99, 707.239, 643.355 },
        [28703] = { "琳西·黑栓", 571, 5889.27, 698.529, 643.266 },
        [28704] = { "桃樂西·伊根", 571, 5878.11, 696.354, 645.094 },
        [28705] = { "凱薩琳·李", 571, 5707.61, 715.535, 642.573 },
        [28706] = { "仁慈的歐莉珊拉", 571, 5860.29, 749.055, 640.669 },
        [28742] = { "瑪西亞·切斯", 571, 5707.31, 612.214, 646.791 },
        [33630] = { "艾爾辛", 530, -2091.98, 5634.98, 50.3112 },
        [33633] = { "女附魔師安狄雅菈", 530, -2124.96, 5410.95, 54.8625 },
        [33642] = { "博学者斯克希里斯", 530, -2254.97, 5560.91, 67.1006 },
    },
    skills = {
        {
            skill = 129,
            name = "急救",
            name_en = "First Aid",
            spells = { 3273, 3274, 7924, 10846, 27028, 45542 },
            npcids = { 19184, 33642, 28706 },
        },
        {
            skill = 164,
            name = "锻造",
            name_en = "Blacksmithing",
            spells = { 2018, 3100, 3538, 9785, 29844, 51300 },
            npcids = { 2836, 33642, 28694 },
        },
        {
            skill = 165,
            name = "制皮",
            name_en = "Leatherworking",
            spells = { 2108, 3104, 3811, 10662, 32549, 51302 },
            npcids = { 33642, 28700 },
        },
        {
            skill = 171,
            name = "炼金",
            name_en = "Alchemy",
            spells = { 2259, 3101, 3464, 11611, 28596, 51304 },
            npcids = { 2837, 33642, 28703, 33630 },
        },
        {
            skill = 182,
            name = "草药",
            name_en = "Herbalism",
            spells = { 2366, 2368, 3570, 11993, 28695, 50300 },
            npcids = { 908, 33642, 28704 },
        },
        {
            skill = 185,
            name = "烹饪",
            name_en = "Cooking",
            spells = { 2550, 3102, 3413, 18260, 33359, 51296 },
            npcids = { 33642, 28705 },
        },
        {
            skill = 186,
            name = "采矿",
            name_en = "Mining",
            spells = { 2575, 2576, 3564, 10248, 29354, 50310 },
            npcids = { 8128, 33642, 28698 },
        },
        {
            skill = 197,
            name = "裁缝",
            name_en = "Tailoring",
            spells = { 3908, 3909, 3910, 12180, 26790, 51309 },
            npcids = { 2627, 33642, 28699 },
        },
        {
            skill = 202,
            name = "工程",
            name_en = "Engineering",
            spells = { 4036, 4037, 4038, 12656, 30350, 51306 },
            npcids = { 8736, 33642, 28697 },
        },
        {
            skill = 333,
            name = "附魔",
            name_en = "Enchanting",
            spells = { 7411, 7412, 7413, 13920, 28029, 51313 },
            npcids = { 33642, 28693, 33633 },
        },
        {
            skill = 356,
            name = "钓鱼",
            name_en = "Fishing",
            spells = { 7620, 7731, 7732, 18248, 33095, 51294 },
            npcids = { 2834, 33642, 28742 },
        },
        {
            skill = 393,
            name = "剥皮",
            name_en = "Skinning",
            spells = { 8613, 8617, 8618, 10768, 32678, 50305 },
            npcids = { 33642, 28696 },
        },
        {
            skill = 755,
            name = "珠宝",
            name_en = "Jewelcrafting",
            spells = { 25229, 25230, 28894, 28895, 28897, 51311 },
            npcids = { 33642, 28701 },
        },
        {
            skill = 773,
            name = "铭文",
            name_en = "Inscription",
            spells = { 45357, 45358, 45359, 45360, 45361, 45363 },
            npcids = { 33642, 28702 },
        },
    },
    money_base = 20,                                          --基础价格，具体为点数*基础价格*级别最大点数值
    skills_level_names = { '初级', '中级', '高级', '专家', '大师', '宗师' },
    skills_level_maxvalues = { 75, 150, 225, 300, 375, 450 }, --每一级最大点数值
    skills_level_allowup = { 0, 50, 125, 200, 275, 350 },     --允许学习下一级的要求
    menuid_home = 0,                                          --返回首页
    menuid_back = 1,                                          --返回上一级
    menuid_complete = 2,                                      --完成

    menuid_advance_1 = 3,                                     --进阶10
    menuid_advance_5 = 4,                                     --进阶50
    menuid_advance_10 = 5,                                    --进阶100
    menuid_advance_nowlevelmax = 6,                           --进阶当前级别满级
    menuid_learn = 7,                                         --学习
    menuid_npc = 8,                                           --NPC
}

function Professionser.OnUse(event, player, unit)
    --icon, msg, sender, intid, code, popup, money
    for k, v in pairs(Professionser.skills) do
        player:GossipMenuAddItem(3, v.name .. v.name_en, 0, v.skill)
    end
    player:GossipSendMenu(1, unit)
end

--传送到NPC
function TeleportToNPC(player, npcid)
    --查询NPC位置
    local npc = Professionser.npcs[npcid]
    if (not npc) then
        player:SendNotification("没有找到相应的技能训练师")
        return
    end
    --传送到NPC位置
    local m, x, y, z = npc[2], npc[3], npc[4], npc[5]
    -- print("传送到NPC位置",npcid, m, x, y, z)
    player:Teleport(m, x, y, z, 0)
end

--生成功能性菜单id为 menuid_[功能]*100000 + skill
function GetMenuidAdvance(skill, menuid)
    return menuid * 100000 + skill
end

--解析功能性菜单，返回{skill,menuid}
function ParseMenuidAdvance(intid)
    return intid % 100000, math.floor(intid / 100000)
end

--判断是否在技能列表中
function IsInSkillList(skill)
    for k, v in pairs(Professionser.skills) do
        if (v.skill == skill) then
            return true
        end
    end
    return false
end

--取得当前技能信息
function GetSkillInfo(skill)
    for k, v in pairs(Professionser.skills) do
        if (v.skill == skill) then
            return v
        end
    end
    return nil
end

--取得当前所属技能等级索引 0表示未学习，1->6表示初级->宗师
function GetSkillLevelIndex(player, skill)
    if not player:HasSkill(skill) then
        return 0
    end
    local skill = GetSkillInfo(skill)
    if (not skill) then
        return 0
    end
    local spells = skill.spells
    for i = #spells, 1, -1 do
        if (player:HasSpell(spells[i])) then
            return i
        end
    end
    return 0
end

function Professionser.OnGossipSelect(event, player, unit, sender, intid, code)
    if (intid == Professionser.menuid_home) then
        Professionser.OnUse(event, player, unit)
    elseif (intid == Professionser.menuid_complete) then
        player:GossipComplete()
    elseif (IsInSkillList(intid)) then
        --是技能菜单处理显示相关菜单
        local skill = GetSkillInfo(intid)
        if (skill) then
            local level = GetSkillLevelIndex(player, intid) --当前技能等级，0->6 0未学习，1->6表示初级->宗师
            local nowSkillValue = player:GetSkillValue(intid)
            if (level == 0) then
                --未学习，显示技能名称：未学习
                player:GossipMenuAddItem(0, skill.name .. "[未学习]", 0, Professionser.menuid_complete)
            else
                --已经学习显示技能名称：当前等级，当前技能点数
                player:GossipMenuAddItem(0,
                    skill.name ..
                    "|cFF0000FF当前:" .. Professionser.skills_level_names[level] .. "(" .. nowSkillValue .. ")|r", 0,
                    Professionser.menuid_complete)
            end
            if (level < #Professionser.skills_level_maxvalues) then
                player:GossipMenuAddItem(3,
                    "学习" ..
                    Professionser.skills_level_names[level + 1] ..
                    wzCommon.MoneyToString(Professionser.skills_level_maxvalues[level + 1] * Professionser.money_base,
                        true), 0,
                    GetMenuidAdvance(intid, Professionser.menuid_learn), false, '需要花费的铜币',
                    Professionser.skills_level_maxvalues[level + 1] * Professionser.money_base)
            end
            if (level > 0) then
                local nextLevelValue = Professionser.skills_level_maxvalues[level] - nowSkillValue
                if (nextLevelValue >= Professionser.menuid_advance_1) then
                    player:GossipMenuAddItem(3,
                        "技能点数+10" ..
                        wzCommon.MoneyToString(10 * Professionser.skills_level_maxvalues[level] * Professionser.money_base,
                            true), 0,
                        GetMenuidAdvance(intid, Professionser.menuid_advance_1), false, '需要花费的铜币',
                        10 * Professionser.skills_level_maxvalues[level] * Professionser.money_base)
                end
                if (nextLevelValue >= Professionser.menuid_advance_5) then
                    player:GossipMenuAddItem(3,
                        "技能点数+50" ..
                        wzCommon.MoneyToString(
                        50 * Professionser.skills_level_maxvalues[level] * Professionser.money_base, true),
                        0,
                        GetMenuidAdvance(intid, Professionser.menuid_advance_5), false, '需要花费的铜币',
                        50 * Professionser.skills_level_maxvalues[level] * Professionser.money_base)
                end
                if (nextLevelValue >= Professionser.menuid_advance_10) then
                    player:GossipMenuAddItem(3,
                        "技能点数+100" ..
                        wzCommon.MoneyToString(
                        100 * Professionser.skills_level_maxvalues[level] * Professionser.money_base, true), 0,
                        GetMenuidAdvance(intid, Professionser.menuid_advance_10), false, '需要花费的铜币',
                        100 * Professionser.skills_level_maxvalues[level] * Professionser.money_base)
                end
                if (nextLevelValue > 0) then
                    --icon, msg, sender, intid, code, popup, money
                    player:GossipMenuAddItem(3,
                        "本级技能点数加满+" ..
                        nextLevelValue ..
                        wzCommon.MoneyToString(nextLevelValue * Professionser.skills_level_maxvalues[level] *
                            Professionser.money_base, true), 0,
                        GetMenuidAdvance(intid, Professionser.menuid_advance_nowlevelmax), false, '需要花费的铜币',
                        nextLevelValue * Professionser.skills_level_maxvalues[level] * Professionser.money_base)
                end
            end
            if skill.npcids and #skill.npcids > 0 then
                for i, npc in ipairs(skill.npcids) do
                    local n = Professionser.npcs[npc]
                    if n then
                        player:GossipMenuAddItem(2, "【传送到训练师】" .. n[1], 0,
                            GetMenuidAdvance(npc, Professionser.menuid_npc), false, "确定要传送吗？")
                    end
                end
            end
        end
        player:GossipMenuAddItem(7, "[返回]", 0, Professionser.menuid_home)
        player:GossipSendMenu(1, unit)
    elseif intid > 100000 then
        local skillid, menuid = ParseMenuidAdvance(intid)
        --先判断是否是NPC
        if (menuid == Professionser.menuid_npc) then
            TeleportToNPC(player, skillid)
            player:GossipComplete()
            return
        end
        local skill = GetSkillInfo(skillid)
        if not skill then
            player:SendNotification("未找到相应技能")
            player:GossipComplete()
            return
        end
        local level = GetSkillLevelIndex(player, skillid)
        local nowSkillValue = player:GetSkillValue(skillid)
        --学习技能
        if (menuid == Professionser.menuid_learn) then
            local needmoney = Professionser.skills_level_maxvalues[level + 1] * Professionser.money_base
            --判断铜币是否足够
            if (player:GetCoinage() < needmoney) then
                player:SendNotification("你的金币不足")
                player:GossipComplete()
                return
            end
            if level >= #Professionser.skills_level_maxvalues then
                player:SendNotification("你已学习这个专业最高等级")
                player:GossipComplete()
                return
            end
            --判断是否符合技能升级最小值
            if (nowSkillValue < Professionser.skills_level_allowup[level + 1]) then
                player:SendNotification("你的技能点数:" ..
                    nowSkillValue .. "，未达到升级要求，需要点数:" .. Professionser.skills_level_allowup[level + 1] .. "")
                player:GossipComplete()
                return
            else
                local spellid = skill.spells[level + 1]
                player:LearnSpell(spellid)
                player:ModifyMoney(-needmoney)
                player:GossipComplete()
                return
            end
        end
        --增加技能点数
        local nextLevelValue = Professionser.skills_level_maxvalues[level] - nowSkillValue
        local advance = 0
        if (menuid == Professionser.menuid_advance_1) then
            advance = 1
        elseif (menuid == Professionser.menuid_advance_5) then
            advance = 5
        elseif (menuid == Professionser.menuid_advance_10) then
            advance = 10
        elseif (menuid == Professionser.menuid_advance_nowlevelmax) then
            advance = nextLevelValue
        end
        if (advance > 0) then
            --如果增加的技能点超过当前最大级，则只能增加到最大级
            if (advance > nextLevelValue) then
                advance = nextLevelValue
            end
            local needmoney = advance * Professionser.skills_level_maxvalues[level] * Professionser.money_base
            if (player:GetCoinage() < needmoney) then
                player:SendNotification("你的金币不足")
                player:GossipComplete()
                return
            end
            player:AdvanceSkill(skillid, advance)
            player:ModifyMoney(-needmoney)
            unit:SendUnitWhisper(skill.name .. "技能点提升" .. advance .. "", 0, player)
        end
        player:GossipComplete()
    else
        player:GossipComplete()
    end
end

RegisterCreatureGossipEvent(Professionser.entry, 1, Professionser.OnUse)
RegisterCreatureGossipEvent(Professionser.entry, 2, Professionser.OnGossipSelect)

print(">>Srcipt wzProfessions loaded.")