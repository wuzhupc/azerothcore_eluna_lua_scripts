--[[
Author: wuzhu
Date: 2024-10-30 16:46:45
LastEditTime: 2024-11-14 18:22:34
FilePath: \Azerothcore\lua_scripts\WuzhuCustom\wzNpcInfoHelper.lua
Description:坐骑(物品-922003)脚本-可以随时随地使用各种坐骑和召唤小伙伴
Copyright (c) 2024 by WUZHUPC, All Rights Reserved.
--]]
print(">>Script: wzmounts loading...")
local ItemWzMounts = {
    entry = 922003
}

--取得ItemWzMounts["Options"] 中parent字段值为parentId的数据
function ItemWzMounts.GetOptions(parentId, faction)
    local t = ItemWzMounts["Options"]
    local ret = {}
    for k, v in pairs(t) do
        if (v["parent"] == parentId and (v["faction"] == -1 or faction == v["faction"])) then
            table.insert(ret, v)
        end
    end
    return ret
end

--从table中取随机的N个值，如果table的值小于等于N，则返回table的所有值
function ItemWzMounts.GetRandomOptions(parentId, N, faction)
    local t = ItemWzMounts.GetOptions(parentId, faction)
    if (#t <= N) then
        return t
    end
    local ret = {}
    for i = 1, N do
        local index = math.random(1, #t)
        table.insert(ret, t[index])
        table.remove(t, index)
    end
    return ret
end

function ItemWzMounts.OnUse(event, player, item)
    player:GossipClearMenu()
    local t = ItemWzMounts.GetOptions(0, player:GetTeam())
    table.sort(t, function(a, b) return a["id"] < b["id"] end)
    -- print("[ItemWzMounts]: "..player:GetName().."["..player:IsAlliance().."]".." used "..item:GetName().." ("..item:GetEntry()..")")
    for k, v in pairs(t) do
        if (v["faction"] == -1 or player:GetTeam() == v["faction"]) then
            -- icon, msg, sender, intid, code, popup, money
            player:GossipMenuAddItem(v["icon"], v["name"], 0, v["id"])
        end
    end
    player:GossipSendMenu(1, item)
    return false
end

function ItemWzMounts.OnSelect(event, player, item, sender, intid, code)
    local t = ItemWzMounts["Options"]
    if intid == 0 then
        ItemWzMounts.OnUse(event, player, item)
    elseif (t[intid]["type"] == 1) then
        local subItems = ItemWzMounts.GetRandomOptions(intid, 14)
        -- print("[ItemWzMounts]: "..#subItems)
        for k, v in pairs(subItems) do
            player:GossipMenuAddItem(v["icon"], v["name"], 0, v["id"])
        end
        -- print("[ItemWzMounts]: 22222")
        player:GossipMenuAddItem(7, "[返回]", 0, t[intid]["parent"])
        player:GossipSendMenu(1, item)
    elseif (t[intid]["type"] == 2) then
        player:AddAura(t[intid]["spell"], player)
        player:GossipComplete()
    elseif (t[intid]["type"] == 3) then
        player:CastSpell(nil, t[intid]["spell"])
        player:GossipComplete()
    else
        --随机取一个对应类型的坐骑
        local rselitems = ItemWzMounts.GetRandomOptions(t[intid]["type"], 1)
        print("[ItemWzMounts]: " .. #rselitems .. ' intid:' .. intid .. ' type:' .. t[intid]["type"])
        if (#rselitems > 0) then
            for k, v in pairs(rselitems) do
                if (v["type"] == 3) then
                    player:CastSpell(nil, v["spell"])
                else
                    player:AddAura(v["spell"], player)
                end
                break
            end
        end
        player:GossipComplete()
    end
end

function ItemWzMounts.LoadCache()
    ItemWzMounts["Options"] = {}
    if not (WorldDBQuery("SHOW TABLES LIKE 'eluna_wzmounts';")) then
        print("[E-SQL ItemWzMounts]: eluna_wzmounts table missing from world database.")
        return
    end

    local Query = WorldDBQuery("select * from eluna_wzmounts;")
    if not (Query) then
        print("[E-SQL ItemWzMounts]: eluna_wzmounts table No results found.")
        return
    end

    repeat
        local row = Query:GetRow()
        ItemWzMounts["Options"][row["id"]] = {
            id = row["id"],
            parent = row["parent"],
            type = row["type"],
            faction = row["faction"],
            icon = row["icon"],
            name = row["name"],
            speed = row["speed"],
            scope = row["scope"],
            level = row["level"],
            item = row["item"],
            spell = row["spell"],
            quality = row["quality"],
            itemlevel = row["itemlevel"],
        }
    until not Query:NextRow()
    print("[E-SQL ItemWzMounts]: Cache initialized. Loaded " .. Query:GetRowCount() .. " results.")
end

ItemWzMounts.LoadCache()
RegisterItemGossipEvent(ItemWzMounts.entry, 1, ItemWzMounts.OnUse)
RegisterItemGossipEvent(ItemWzMounts.entry, 2, ItemWzMounts.OnSelect)
print(">>Script: wzmounts loaded.")
