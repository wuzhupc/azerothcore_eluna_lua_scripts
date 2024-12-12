--[[
Author: wuzhu
Date: 2024-11-04 19:54:46
LastEditTime: 2024-11-06 14:54:05
FilePath: \Azerothcore\lua_scripts\WuzhuCustom\wzXpLock.lua
Description: 玩家经验锁脚本
Copyright (c) 2024 by WUZHUPC, All Rights Reserved.
--]]
print(">>Script: wzXpLockzLevelupReward loading...")
local wzCommon = require("wzCommon")
local XpLock = {
    lockAccounts = { 201 }, --需要锁经验的账号ID
    lockBaseXp = 1,         --锁级时给的经验值(受全局经验系统数影响)
    lockBaseMoney = 10,     --锁级时给的钱的基数，即原给的经验*此基数
    lockInfo = {
        --多少等级在map时才能给经验，否则经验+lockBaseXp
        --60级后只能到外域才能获得正常经验
        [60] = {
            530
        },
        --60级后只能到诺森德才能获得正常经验
        [70] = {
            571
        }
    }
}

function XpLock.checkAccount(player)
    local accountId = player:GetAccountId()
    for k, v in pairs(XpLock.lockAccounts) do
        if (accountId == v) then
            return true
        end
    end
    return false
end

function XpLock.checkXp(event, player, amount, victim, source)
    if (not XpLock.checkAccount(player) or amount <= 0) then
        return
    end
    -- print(">>Script: wzXpLock checkXp: amount-"..amount..";source-"..source)
    local nowLevel = player:GetLevel()
    local info = XpLock.lockInfo[nowLevel]
    if (not info) then
        return
    end
    local map = player:GetMap()
    local mapId = map:GetMapId()
    for k, v in pairs(info) do
        if (mapId == v) then
            return amount
        end
    end
    player:ModifyMoney(amount * XpLock.lockBaseMoney)
    player:SendBroadcastMessage("锁经验中，请到新地图升级解锁，补偿金币：" .. wzCommon.MoneyToString(amount * XpLock.lockBaseMoney, true))
    return XpLock.lockBaseXp
end

--PLAYER_EVENT_ON_GIVE_XP                 =     12,       // (event, player, amount, victim, source) - Can return new XP amount
RegisterPlayerEvent(12, XpLock.checkXp)

print(">>Script: wzXpLock loaded.")
