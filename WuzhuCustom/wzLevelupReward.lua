--[[
Author: wuzhu
Date: 2024-11-04 19:54:46
LastEditTime: 2024-11-06 14:54:05
FilePath: \Azerothcore\lua_scripts\WuzhuCustom\wzLevelupReward.lua
Description: 
Copyright (c) 2024 by WUZHUPC, All Rights Reserved. 
--]]
--[[
Author: wuzhu
Date: 2024-11-04 10:31:59
LastEditTime: 2024-11-04 10:37:07
FilePath: \lua\wzLevelupReward.lua
Description: 
Copyright (c) 2024 by lawyee, All Rights Reserved. 
--]]
print(">>Script: wzLevelupReward loading...")
local wzCommon = require("wzCommon")
local Rewards = {
    rewardlist = {
        [2] = {
            items ={
                {itemid = "23162", count = 1, name="弗洛尔的无尽抗性宝箱"},
            },
            money = 10000,
        },
        [5] = {
            items ={
                {itemid = "922004", count = 1, name="绑定石"},
                {itemid = "922002", count = 1, name="传送石"},
            },
            money = 50000,
        },
        [10] = {
            items ={
                {itemid = "23162", count = 1, name="弗洛尔的无尽抗性宝箱"},
                {itemid = "922003", count = 1, name="坐骑石"},
            },
            money = 100000,
        },
        [20] = {
            items ={
                {itemid = "23162", count = 1, name="弗洛尔的无尽抗性宝箱"},
            },
            money = 200000,
        },
        [30] = {
            items ={
                {itemid = "23162", count = 1, name="弗洛尔的无尽抗性宝箱"},
            },
            money = 300000,
        },
        [40] = {
            items ={
                {itemid = "23162", count = 1, name="弗洛尔的无尽抗性宝箱"},
            },
            money = 400000,
        },
        [50] = {
            items ={
                {itemid = "23162", count = 1, name="弗洛尔的无尽抗性宝箱"},
            },
            money = 500000,
        },
        [60] = {
            items ={
                {itemid = "23162", count = 1, name="弗洛尔的无尽抗性宝箱"},
            },
            money = 600000,
        },
        [70] = {
            items ={
                {itemid = "23162", count = 1, name="弗洛尔的无尽抗性宝箱"},
            },
            money =700000,
        },
        [80] = {
            items ={
                {itemid = "23162", count = 2, name="弗洛尔的无尽抗性宝箱"},
            },
            money = 800000,
        }
    }
}

function Rewards.levelup(event, player, oldLevel)
    local nowLevel = player:GetLevel()
    local accountName = player:GetAccountName()
    --accountName开头为RNDBOT不发送奖励
    if string.sub(accountName, 1, 6) == "RNDBOT" then
        print(">>Script: wzLevelupReward "..accountName.." is RNDBOT, no reward. level:"..nowLevel)
        return
    end
    local name = player:GetName()
    local reward = Rewards.rewardlist[nowLevel]
    if reward then        
        for _, item in ipairs(reward.items) do
            player:AddItem(item.itemid, item.count)
            SendWorldMessage("恭喜玩家"..name.."升到"..nowLevel.."级，获得升级奖励物品：|cFF0000FF"..item.name.." x "..item.count.."|r")
        end
        if(reward.money and reward.money>0) then
            player:ModifyMoney(reward.money)
            SendWorldMessage("恭喜玩家"..name.."升到"..nowLevel.."级，获得升级奖励金币："..wzCommon.MoneyToString(reward.money,true))
        end
    end
end

--cancel = RegisterPlayerEvent( event, function, shots )
-- event Player event Id, refer to PlayerEvents above.
-- function Function to register.
-- shots The number of times the function will be called, 0 means "always call this function".
RegisterPlayerEvent(13, Rewards.levelup) --PLAYER_EVENT_ON_LEVEL_CHANGE            =     13,       // (event, player, oldLevel)

print(">>Script: wzLevelupReward loaded.")