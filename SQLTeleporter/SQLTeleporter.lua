--[[
Author: wuzhu
Date: 2024-10-22 11:19:18
LastEditTime: 2024-10-22 11:23:28
FilePath: \Scripts\Custom\SQL Teleporter\Eluna SQL Teleporter.lua
Description: 传送脚本(NPC:922001)修改版本
Copyright (c) 2024 by WUZHUPC, All Rights Reserved. 
--]]
print(">>Script: SQLTeleporter loading...")

local wzCommon = require("wzCommon")

local Teleporter = {
    entry = 922001 -- Unit entry
}

-- Do not edit anything below this line.

function Teleporter.OnHello(event, player, unit)
    for k, v in pairs(Teleporter["Options"]) do
        if(player:GetTeam() == v["faction"] or v["faction"] == -1) and ( v["parent"] == 0) then
            player:GossipMenuAddItem(v["icon"], v["name"], 0, k)
        end
    end
    player:GossipSendMenu(1, unit)
end

function Teleporter.OnSelect(event, player, unit, sender, intid, code)
    local t = Teleporter["Options"]
    
    if(intid == 0) then -- Special handling for "Back" option in case parent is 0
        Teleporter.OnHello(event, player, unit)
    elseif(t[intid]["type"] == 1) then
        local datas = {}
        -- Hacky loops, but I want the results to be sorted damnit
        for i = 1, 2 do
            for k, v in pairs(t) do
                if(v["parent"] == intid and v["type"] == i and (player:GetTeam() == v["faction"] or v["faction"] == -1)) then
                    table.insert(datas, v)
                end
            end
        end
        table.sort(datas, function(a, b) return a["id"] < b["id"] end)
        for k, v in pairs(datas) do
            player:GossipMenuAddItem(v["icon"], v["name"], 0, v["id"])
        end
        player:GossipMenuAddItem(wzCommon.GOSSIP_ICON_TALK, "[返回]", 0, t[intid]["parent"])
        player:GossipSendMenu(1, unit)
    elseif(t[intid]["type"] == 2) then
        player:Teleport(t[intid]["map"], t[intid]["x"], t[intid]["y"], t[intid]["z"], t[intid]["o"])
    end
end

function Teleporter.LoadCache()
    Teleporter["Options"] = {}

    if not(WorldDBQuery("SHOW TABLES LIKE 'eluna_teleporter';")) then
        print("[E-SQL Teleporter]: eluna_teleporter table missing from world database.")
        print("[E-SQL Teleporter]: Inserting table structure, initializing cache.")
        WorldDBQuery("CREATE TABLE `eluna_teleporter` (`id` int(5) NOT NULL AUTO_INCREMENT,`parent` int(5) NOT NULL DEFAULT '0',`type` int(1) NOT NULL DEFAULT '1',`faction` int(2) NOT NULL DEFAULT '-1',`icon` int(2) NOT NULL DEFAULT '0',`name` char(20) NOT NULL DEFAULT '',`map` int(5) DEFAULT NULL,`x` decimal(10,3) DEFAULT NULL,`y` decimal(10,3) DEFAULT NULL,`z` decimal(10,3) DEFAULT NULL,`o` decimal(10,3) DEFAULT NULL,PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;")
        return;
    end
    
    local Query = WorldDBQuery("SELECT * FROM eluna_teleporter;")
    if(Query) then
        repeat
            Teleporter["Options"][Query:GetUInt32(0)] = {
                id = Query:GetUInt32(0),
                parent = Query:GetUInt32(1),
                type = Query:GetUInt32(2),
                faction = Query:GetInt32(3),
                icon = Query:GetInt32(4),
                name = Query:GetString(5),
                map = Query:GetUInt32(6),
                x = Query:GetFloat(7),
                y = Query:GetFloat(8),
                z = Query:GetFloat(9),
                o = Query:GetFloat(10),
            };
        until not Query:NextRow()
        print("[E-SQL Teleporter]: Cache initialized. Loaded "..Query:GetRowCount().." results.")
    else
        print("[E-SQL Teleporter]: Cache initialized. No results found.")
    end
end

Teleporter.LoadCache()
RegisterCreatureGossipEvent(Teleporter.entry, 1, Teleporter.OnHello)
RegisterCreatureGossipEvent(Teleporter.entry, 2, Teleporter.OnSelect)
print(">>Script: SQLTeleporter loaded.")