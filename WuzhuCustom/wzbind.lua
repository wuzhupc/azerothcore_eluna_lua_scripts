--[[
Author: wuzhu
Date: 2024-10-23 14:24:47
LastEditTime: 2024-10-23 16:44:29
FilePath: \Scripts\Custom\WuzhuCustom\wzbind.lua
Description:
Copyright (c) 2024 by WUZHUPC, All Rights Reserved.
--]]
print(">>Script: wzBind loading...")
local wzCommon = require("wzCommon")

local ItemWzBind = {
    bindEntry = 922001,      --绑定物品ID
    teleportEntry = 922002,  --传送物品ID
    inputBindEntry = 922004, --绑定物品ID（弹出输入）
    pageCount = 5,           --页数
    pageSize = 16,           --每页显示数量
    menuidHome = 0,          --返回首页
    menuidPageBase = 10000,  --页基数，具体值为此基数+页码
}

--根据intid取得当前页码，如果不在页码范围内，则返回第1页,intid为页基数+页码
function ItemWzBind.GetNowPage(intid)
    if (intid <= ItemWzBind.menuidPageBase or intid > ItemWzBind.menuidPageBase + ItemWzBind.pageCount) then
        return 1
    end
    return intid - ItemWzBind.menuidPageBase
end

--获取某一页的绑定数据
function ItemWzBind.GetPageBindDatas(player, nowPage)
    local accountId = player:GetGUIDLow()
    local startnum = (nowPage - 1) * ItemWzBind.pageSize + 1
    local endnum = nowPage * ItemWzBind.pageSize
    local datas = {}
    for i = startnum, endnum, 1 do
        datas[i] = ItemWzBind[accountId][i]
    end
    return datas
end

--生成绑定菜单
function ItemWzBind.AddBindGossip(player, item, nowpage)
    player:GossipClearMenu() --清除菜单
    if (nowpage > 1) then
        player:GossipMenuAddItem(0, "<上一页>", 0, ItemWzBind.menuidPageBase + nowpage - 1)
    end
    local datas = ItemWzBind.GetPageBindDatas(player, nowpage)
    for k, v in pairs(datas) do
        -- icon, msg, sender, intid, code, popup, money
        player:GossipMenuAddItem(3, "<绑定>" .. v.name, 0, v.index, true)
    end
    if (nowpage < ItemWzBind.pageCount) then
        player:GossipMenuAddItem(0, "<下一页>", 0, ItemWzBind.menuidPageBase + nowpage + 1)
    end
    if (nowpage ~= 1) then
        player:GossipMenuAddItem(0, "<返回首页>", 0, ItemWzBind.menuidHome)
    end
    player:GossipSendMenu(1, item)
end

--物品使用事件(绑定菜单-弹出输入模式)
function ItemWzBind.OnInputBindUse(event, player, item)
    if (player:IsInCombat()) then
        player:SendAreaTriggerMessage("不能在战斗中使用。")
        return false
    end
    player:GossipClearMenu()
    ItemWzBind.LoadCache(player)
    player:SendAreaTriggerMessage("输入0=标识绑定位置,1=使用原来名称,2=使用系统名称")
    player:SendBroadcastMessage("输入0=标识绑定位置,1=使用原来名称,2=使用系统名称")
    ItemWzBind.AddBindGossip(player, item, 1)
    return false
end

--菜单点击处理(绑定菜单-弹出输入模式)
function ItemWzBind.OnInputBindSelect(event, player, item, sender, intid, code, menuid)
    if (player:IsInCombat()) then
        player:SendAreaTriggerMessage("不能在战斗中使用。")
        player:GossipComplete()
        return
    end

    if (intid == ItemWzBind.menuidHome) then
        ItemWzBind.AddBindGossip(player, item, 1)
        return
    end
    if (intid > ItemWzBind.menuidPageBase) then
        --跳转到第几页
        local nowPage = ItemWzBind.GetNowPage(intid)
        ItemWzBind.AddBindGossip(player, item, nowPage)
        return
    end
    local accountId = player:GetGUIDLow()
    local w = ItemWzBind[accountId][intid]
    -- 获取当前玩家坐标
    local x, y, z, o = player:GetLocation()
    local map = player:GetMap()
    local mapId = map:GetMapId()

    local areaId = map:GetAreaId(x, y, z)
    local areaName, mapName = wzCommon.GetAreaInfo(areaId, map:GetName())
    if code == "0" then
        -- 0=标识绑定位置,1=使用原来名称,2=使用系统名称
        if (w.type == 1) then
            wzCommon.SendPOI(player, w.posX, w.posY, w.name)
        else
            wzCommon.SendPOI(player, x, y, areaName)
        end
        player:SendBroadcastMessage("已经在地图上标记绑定位置")
        player:GossipComplete()
        return
    end
    if code == "1" and w and w.name then
        -- 1时使用原来名称，原来名称没有使用新的
        areaName = w.name
    elseif code ~= "2" then
        areaName = code
    end
    if (map:IsArena() or map:IsBattleground() or map:IsRaid()) then
        player:SendBroadcastMessage("战场及副本不能绑定位置")
    else
        -- 判断是否已经绑定,如果已经绑定则更新,否则插入
        if (w.type == 1) then
            local sql = "UPDATE `eluna_wzbind` SET `name` = '" ..
                areaName ..
                "(" ..
                mapName ..
                ")', `mapId` = " ..
                mapId ..
                ", `posX` = " ..
                x ..
                ", `posY` = " ..
                y ..
                ", `posZ` = " ..
                z .. ", `orientation` = " .. o .. " WHERE `guid` = " .. accountId .. " AND `index` = " .. w.index .. ";"
            print("[E-SQL WZBind]:" .. sql)
            CharDBExecute(sql)
        else
            local insertSql =
                "INSERT INTO `eluna_wzbind` ( `guid`, `index`, `name`, `mapId`, `posX`, `posY`, `posZ`, `orientation` ) VALUES (" ..
                accountId ..
                ", " ..
                w.index ..
                ", '" ..
                areaName .. "(" .. mapName .. ")', " .. mapId .. ", " .. x .. ", " .. y .. ", " .. z .. ", " .. o .. ");"
            print("[E-SQL WZBind]:" .. insertSql)
            CharDBExecute(insertSql)
        end
        --更新记录信息
        ItemWzBind[accountId][intid] = {
            type = 1,
            index = intid,
            name = areaName .. "(" .. mapName .. ")",
            guid = accountId,
            mapId = mapId,
            posX = x,
            posY = y,
            posZ = z,
            orientation = o
        }
        player:SendBroadcastMessage("绑定位置--" .. areaName .. "(" .. mapName .. ")--成功")
    end
    player:GossipComplete()
end

function ItemWzBind.OnTeleportGoosip(player, item, nowpage)
    player:GossipClearMenu() --清除菜单
    if (nowpage > 1) then
        player:GossipMenuAddItem(0, "<上一页>", 0, ItemWzBind.menuidPageBase + nowpage - 1)
    end
    local datas = ItemWzBind.GetPageBindDatas(player, nowpage)
    for k, v in pairs(datas) do
        -- icon, msg, sender, intid, code, popup, money
        player:GossipMenuAddItem(2, "<传送>" .. v.name, 0, v.index, false, "确定要传送到" .. v.name .. "吗？")
    end
    if (nowpage < ItemWzBind.pageCount) then
        player:GossipMenuAddItem(0, "<下一页>", 0, ItemWzBind.menuidPageBase + nowpage + 1)
    end
    if (nowpage ~= 1) then
        player:GossipMenuAddItem(0, "<返回首页>", 0, ItemWzBind.menuidHome)
    end
    player:GossipSendMenu(1, item)
end

function ItemWzBind.OnTeleportUse(event, player, item)
    if (player:IsInCombat()) then
        player:SendAreaTriggerMessage("不能在战斗中使用。")
        return false
    end
    player:GossipClearMenu()
    ItemWzBind.LoadCache(player)
    ItemWzBind.OnTeleportGoosip(player, item, 1)
    return false
end

function ItemWzBind.OnTeleportSelect(event, player, item, sender, intid, code, menuid)
    if (player:IsInCombat()) then
        player:SendAreaTriggerMessage("不能在战斗中使用。")
        player:GossipComplete()
        return
    end
    if (intid == ItemWzBind.menuidHome) then
        ItemWzBind.OnTeleportGoosip(player, item, 1)
        return
    end
    if (intid > ItemWzBind.menuidPageBase) then
        --跳转到第几页
        local nowPage = ItemWzBind.GetNowPage(intid)
        ItemWzBind.OnTeleportGoosip(player, item, nowPage)
        return
    end
    local accountId = player:GetGUIDLow()
    local w = ItemWzBind[accountId][intid]
    if (w and w.type == 1) then
        player:Teleport(w.mapId, w.posX, w.posY, w.posZ, w.orientation)
    else
        player:SendBroadcastMessage("该传送点未绑定")
    end
    player:GossipComplete()
end

function ItemWzBind.LoadCache(player)
    local accountId = player:GetGUIDLow()
    if (ItemWzBind[accountId]) then
        --不重复加载
        return
    end
    ItemWzBind[accountId] = {}
    local total = ItemWzBind.pageCount * ItemWzBind.pageSize
    for i = 1, total do
        ItemWzBind[accountId][i] = {
            type = 0,
            index = i,
            name = "<未绑定>",
        };
    end
    if not (CharDBQuery("SHOW TABLES LIKE 'eluna_wzbind';")) then
        print("[E-SQL WZBind]: eluna_wzbind table missing from char database.")
    else
        local result = CharDBQuery("SELECT * FROM eluna_wzbind WHERE guid = " .. accountId .. ";")
        if result then
            repeat
                local row = result:GetRow()
                ItemWzBind[accountId][row["index"]] = {
                    type = 1,
                    index = row["index"],
                    name = row["name"],
                    guid = row["guid"],
                    mapId = row["mapId"],
                    orientation = row["orientation"],
                    posX = row["posX"],
                    posY = row["posY"],
                    posZ = row["posZ"],
                };
            until not result:NextRow()
        end
    end
end

RegisterItemGossipEvent(ItemWzBind.inputBindEntry, 1, ItemWzBind.OnInputBindUse)
RegisterItemGossipEvent(ItemWzBind.inputBindEntry, 2, ItemWzBind.OnInputBindSelect)

RegisterItemGossipEvent(ItemWzBind.teleportEntry, 1, ItemWzBind.OnTeleportUse)
RegisterItemGossipEvent(ItemWzBind.teleportEntry, 2, ItemWzBind.OnTeleportSelect)
print(">>Script: wzBind loaded.")
