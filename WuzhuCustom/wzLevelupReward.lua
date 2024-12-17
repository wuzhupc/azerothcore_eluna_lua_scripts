--[[
Author: wuzhu
Date: 2024-11-04 19:54:46
LastEditTime: 2024-11-06 14:54:05
FilePath: \Azerothcore\lua_scripts\WuzhuCustom\wzLevelupReward.lua
Description: 玩家升级奖励脚本
Copyright (c) 2024 by WUZHUPC, All Rights Reserved.
--]]
print(">>Script: wzLevelupReward loading...")
local wzCommon = require("wzCommon")
local Rewards = {
    rewardlist = {
        [2] = {
            items = {
                { itemid = "23162", count = 1, name = "弗洛尔的无尽抗性宝箱" },
                { itemId = "922005", count = 1, name = "查询石" }
            },
            money = 10000,
        },
        [5] = {
            items = {
                { itemid = "922004", count = 1, name = "绑定石" },
                { itemid = "922002", count = 1, name = "传送石" },
            },
            money = 50000,
        },
        [10] = {
            items = {
                { itemid = "23162", count = 1, name = "弗洛尔的无尽抗性宝箱" },
                { itemid = "922003", count = 1, name = "坐骑石" },
            },
            money = 200000,
        },
        [20] = {
            items = {
                { itemid = "23162", count = 1, name = "弗洛尔的无尽抗性宝箱" },
            },
            money = 400000,
        },
        [30] = {
            items = {
                { itemid = "23162", count = 1, name = "弗洛尔的无尽抗性宝箱" },
            },
            money = 600000,
        },
        [40] = {
            items = {
                { itemid = "23162", count = 1, name = "弗洛尔的无尽抗性宝箱" },
            },
            money = 1000000,
        },
        [50] = {
            items = {
                { itemid = "23162", count = 1, name = "弗洛尔的无尽抗性宝箱" },
            },
            money = 3000000,
        },
        [60] = {
            items = {
                { itemid = "23162", count = 1, name = "弗洛尔的无尽抗性宝箱" },
            },
            money = 6000000,
        },
        [70] = {
            items = {
                { itemid = "23162", count = 1, name = "弗洛尔的无尽抗性宝箱" },
            },
            money = 10000000,
        },
        [80] = {
            items = {
                { itemid = "23162", count = 2, name = "弗洛尔的无尽抗性宝箱" },
            },
            money = 16000000,
        }
    },
    LMGuildName = "wuzhu", --LM公会名称
    LMGuildRankId = 1, --加入LM公会后所属等级
    BLGuildName = "部落仓库", --BL公会名称
    BLGuildRankId = 1, --加入BL公会后所属等级
}

--检测并自动加入公会
function Rewards.AutoAddToGuild(player)
    --已经加入公会则不处理
    if (player:GetGuild()) then
        return
    end
    --10级前也不处理
    if (player:GetLevel() < 10) then
        return
    end
    --判断是联盟还是部落
    local guild = nil
    local rankid = 1
    if (player:IsHorde()) then
        guild = GetGuildByName(Rewards.BLGuildName)
        rankid = Rewards.BLGuildRankId
    elseif (player:IsAlliance()) then
        guild = GetGuildByName(Rewards.LMGuildName)
        rankid = Rewards.LMGuildRankId
    end
    if (not guild) then
        return
    end
    local memberCount = guild:GetMemberCount()
    if (memberCount > 300) then
        --公会人数超过300则不处理
        SendWorldMessage("公会'" .. guild:GetName() .. "'人数超过300，玩家'" .. player:GetName() .. "'无法自动加入此公会")
        return
    end
    --加入公会
    guild:AddMember(player, rankid)
    SendWorldMessage("恭喜玩家'" .. player:GetName() .. "'自动加入公会'" .. guild:GetName() .. "'！")
end

function Rewards.levelup(event, player, oldLevel)
    local nowLevel = player:GetLevel()
    local accountName = player:GetAccountName()
    --添加升级检查自动加入公会
    Rewards.AutoAddToGuild(player)
    --accountName开头为RNDBOT不发送奖励
    if string.sub(accountName, 1, 6) == "RNDBOT" then
        print(">>Script: wzLevelupReward " .. accountName .. " is RNDBOT, no reward. level:" .. nowLevel)
        return
    end
    local name = player:GetName()
    local reward = Rewards.rewardlist[nowLevel]
    if reward then
        for _, item in ipairs(reward.items) do
            player:AddItem(item.itemid, item.count)
            SendWorldMessage("恭喜玩家" .. name ..
                "升到" .. nowLevel .. "级，获得升级奖励物品：|cFF0000FF" .. item.name .. " x " .. item.count .. "|r")
        end
        if (reward.money and reward.money > 0) then
            player:ModifyMoney(reward.money)
            SendWorldMessage("恭喜玩家" .. name .. "升到" .. nowLevel ..
                "级，获得升级奖励金币：" .. wzCommon.MoneyToString(reward.money, true))
        end
    end
end

--cancel = RegisterPlayerEvent( event, function, shots )
-- event Player event Id, refer to PlayerEvents above.
-- function Function to register.
-- shots The number of times the function will be called, 0 means "always call this function".
RegisterPlayerEvent(13, Rewards.levelup) --PLAYER_EVENT_ON_LEVEL_CHANGE            =     13,       // (event, player, oldLevel)

print(">>Script: wzLevelupReward loaded.")
