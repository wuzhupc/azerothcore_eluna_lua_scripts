--[[
Author: wuzhu
Date: 2024-10-30 16:46:45
LastEditTime: 2024-11-14 18:22:34
FilePath: \Azerothcore\lua_scripts\WuzhuCustom\wzSpecialSpell.lua
Description:特殊技能学习(NPC-922003)脚本
Copyright (c) 2024 by WUZHUPC, All Rights Reserved.
--]]
print(">>Script: wzSpecialSpell loading...")
local wzCommon = require("wzCommon")
local Speller = {
    entry = 922003 -- Unit entry
}

function Speller.GetDescStr(money, desc)
    local tmpStr = wzCommon.MoneyToString(money, true)
    if desc ~= "" then
        if tmpStr ~= "" then
            tmpStr = tmpStr .. "，" .. desc
        else
            tmpStr = desc
        end
    end
    if tmpStr ~= "" then
        tmpStr = "(" .. tmpStr .. ")"
    end
    return tmpStr
end

--检测是否已经拥有spell
function Speller.CheckSpell(player, spellStr)
    local spells = wzCommon.SplitString(spellStr, ",")
    local result = true --默认已经拥有
    for _, spell in pairs(spells) do
        if not player:HasSpell(spell) then
            result = false --只要一个未拥有，就认为未拥有
        end
    end
    return result
end

--检测是否已经拥有aura
function Speller.CheckAura(player, spellStr)
    local spells = wzCommon.SplitString(spellStr, ",")
    local result = true --默认已经拥有
    for _, spell in pairs(spells) do
        if not player:HasAura(spell) then
            result = false --只要一个未拥有，就认为未拥有
        end
    end
    return result
end

function Speller.OnHello(event, player, unit)
    player:GossipClearMenu()
    for k, v in pairs(Speller["Options"]) do
        if (player:GetTeam() == v["faction"] or v["faction"] == -1) and (v["parent"] == 0) then
            if v["level"] <= player:GetGMRank() then
                player:GossipMenuAddItem(v["icon"], v["name"] .. Speller.GetDescStr(v["money"], v["desc"]), 0, v["id"])
            end
        end
    end
    player:GossipSendMenu(1, unit)
end

function Speller.OnSelect(event, player, unit, sender, intid, code)
    local t = Speller["Options"]
    if (intid == 0) then -- Special handling for "Back" option in case parent is 0
        Speller.OnHello(event, player, unit)
    elseif (t[intid]["type"] == 1) then
        local datas = {}
        for k, v in pairs(t) do
            if (v["parent"] == intid and (player:GetTeam() == v["faction"] or v["faction"] == -1)) then
                if v["level"] <= player:GetGMRank() then
                    -- print("[Speller]: id: " .. v["id"] .. " money: " .. v["money"])
                    table.insert(datas, v)
                end
            end
        end
        table.sort(datas, function(a, b) return a["id"] < b["id"] end)
        for k, v in pairs(datas) do
            local tmpStr = ""
            if v["money"] ~= 0 then
                tmpStr = "您将花费"
            end
            local desc = v["desc"]
            if (v["aura"] == 1 and Speller.CheckAura(player, v["spells"])) then
                desc = "已拥有"
            end
            if (v["aura"] == 0 and Speller.CheckSpell(player, v["spells"])) then
                desc = "已学"
            end
            -- icon, msg, sender, intid, code, popup, money
            player:GossipMenuAddItem(v["icon"], v["name"] .. Speller.GetDescStr(v["money"], desc), 0, v["id"],
                false,
                tmpStr, v["money"])
        end
        player:GossipMenuAddItem(7, "[返回]", 0, t[intid]["parent"])
        player:GossipSendMenu(1, unit)
    elseif (t[intid]["type"] == 2) then
        if (player:GetCoinage() < t[intid]["money"]) then
            player:SendBroadcastMessage("金币不足")
        else
            local spells = wzCommon.SplitString(t[intid]["spells"], ",")
            local hasLearn = false
            local msg = ""
            -- print("[Speller]: spells: " .. t[intid]["spells"] .. " isAura: " .. t[intid]["aura"])
            for k, v in pairs(spells) do
                local spell = v
                -- print("[Speller]: spells: " .. t[intid]["spells"] .. " HasAura: " .. tostring(player:HasAura(spell)) .. " HasSpell: " .. tostring(player:HasSpell(spell)))
                if t[intid]["aura"] == 1 and not player:HasAura(spell) then
                    player:AddAura(spell, player)
                    hasLearn = true
                    msg = "BUFF添加成功"
                end
                if t[intid]["aura"] == 0 and not player:HasSpell(spell) then
                    player:LearnSpell(spell)
                    hasLearn = true
                    msg = "技能学习成功"
                end
            end
            if (hasLearn) then
                player:ModifyMoney(-t[intid]["money"])
                player:SendBroadcastMessage(msg)
            else
                player:SendBroadcastMessage("您已经学习或拥有过此技能")
            end
        end
        player:GossipComplete()
    end
end

function Speller.LoadCache()
    Speller["Options"] = {}

    if not (WorldDBQuery("SHOW TABLES LIKE 'eluna_wzspell';")) then
        print("[E-SQL Speller]: eluna_wzspell table missing from world database.")
        return
    end

    local Query = WorldDBQuery("SELECT * FROM eluna_wzspell;")
    if (Query) then
        repeat
            local row = Query:GetRow()
            Speller["Options"][row["id"]] = {
                id = row["id"],
                parent = row["parent"],
                type = row["type"],
                faction = row["faction"],
                icon = row["icon"],
                name = row["name"],
                desc = row["desc"],
                level = row["level"],
                spells = row["spells"],
                money = row["money"],
                aura = row["aura"],
            };
        until not Query:NextRow()
        print("[E-SQL Speller]: Cache initialized. Loaded " .. Query:GetRowCount() .. " results.")
    else
        print("[E-SQL Speller]: Cache initialized. No results found.")
    end
end

Speller.LoadCache()
RegisterCreatureGossipEvent(Speller.entry, 1, Speller.OnHello)
RegisterCreatureGossipEvent(Speller.entry, 2, Speller.OnSelect)
print(">>Script: wzSpecialSpell loaded.")
