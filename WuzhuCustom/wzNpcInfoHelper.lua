print(">>Script: wzNpcInfoHelper loading...")

local wzCommon = require("wzCommon")

local NpcInfoHelper = {
    itemEntry = 922005,
    creatureList = {},       --查询到的creature列表
    entryList = {},          --查询到的creatureTemplate列表
    objectList = {},         --查询到的gameobject列表
    objectTemplateList = {}, --查询到的gameobjectTemplate列表
    queryInfo = {
        ids = {},
        names = {},
        guids = {},
        objectNames = {},
        objectIds = {},
    },                            --最后输入查询的内容，包括：id,name,guid
    npcList = {},
    lastOper = {},                --最后操作记录lastOper[accountId] = {prevId=1,lastId=4,value="123"}
    queryLimit = 20,              --查询限制
    history = {},                 --历史记录,type,title,query
    historyLimit = 10,            --历史记录限制
    midHome = 0,
    midBack = 1001,               --返回上一页,必须比queryLimit大
    midHistryQueryStart = 2000,   --历史记录查询开始ID
    midNpcQueryId = 4,            --id查询
    midNpcQueryName = 5,          --name查询
    midNpcCreatureListSelect = 6, --creature列表选中
    midNpcEntryListSelect = 7,    --entry列表选中
    midNpcInfo = 10,              --选中的NPC信息
    midObjectQueryName = 13,      --object名称查询
    midObjectQueryId = 14,        --object id查询
}

function NpcInfoHelper.GetNowSelectNPCInfo(player)
    local unit = player:GetSelection()
    if (not unit) then
        return nil
    end
    return unit:ToCreature()
end

function NpcInfoHelper.GetNameStr(twName, cnName, enName)
    if (twName and twName ~= "") then
        return twName
    end
    if (cnName and cnName ~= "") then
        return cnName
    end
    return enName
end

function NpcInfoHelper.GetCreatureNameStr(createure)
    return NpcInfoHelper.GetNameStr(createure.twName, createure.cnName, createure.enName)
end

--记录历史信息
--type:即相应的操作mid
--query:查询的值
--title:标题
function NpcInfoHelper.addHistory(player, type, title, query)
    local accountId = player:GetGUIDLow()
    if not NpcInfoHelper.history[accountId] then
        NpcInfoHelper.history[accountId] = {}
    end
    local history = NpcInfoHelper.history[accountId]
    --判断type和key是否已经存在，存在就不添加
    for i, v in pairs(history) do
        if v.type == type and v.key == key then
            return
        end
    end
    if #history >= NpcInfoHelper.historyLimit then
        table.remove(history, 1)
    end
    table.insert(history, { type = type, title = title, query = query })
end

--GameObjectce通过name查询
function NpcInfoHelper.AddObjectNameGossip(player, item, name)
    player:GossipClearMenu()
    local accountId = player:GetGUIDLow()
    local lastNames = NpcInfoHelper.queryInfo.objectNames[accountId]
    if not lastNames or lastNames.name ~= name then
        --未查过或查过但名字不同则重新查
        --SELECT ct.entry, zhtw.name as twName,zhcn.name as cnName,ct.name as enName from gameobject_template as ct left join gameobject_template_locale as zhtw on ct.entry=zhtw.entry and zhtw.locale='zhTw' LEFT JOIN gameobject_template_locale as zhcn on ct.entry=zhcn.entry and zhcn.locale='zhCn'  where ct.`name` like '%巴尔洛%' or ct.entry in (SELECT entry from gameobject_template_locale where `Name` LIKE '%巴尔洛%' and  (locale='zhCn' or locale='zhTw' )) ORDER BY ct.entry
        local sql =
            "SELECT ct.entry, zhtw.name as twName,zhcn.name as cnName,ct.name as enName from gameobject_template as ct left join gameobject_template_locale as zhtw on ct.entry=zhtw.entry and zhtw.locale='zhTw' LEFT JOIN gameobject_template_locale as zhcn on ct.entry=zhcn.entry and zhcn.locale='zhCn'  where ct.`name` like '%" ..
            name ..
            "%' or ct.entry in (SELECT entry from gameobject_template_locale where `Name` LIKE '%" ..
            name .. "%' and  (locale='zhCn' or locale='zhTw' )) ORDER BY ct.entry;"
        local Query = WorldDBQuery(sql)
        if not Query or Query:GetRowCount() == 0 then
            player:SendAreaTriggerMessage("查询的名称'" .. name .. "'不存在")
            player:GossipComplete()
            return
        end
        NpcInfoHelper.queryInfo.objectNames[accountId] = { name = name, count = Query:GetRowCount() }
        lastNames = NpcInfoHelper.queryInfo.objectNames[accountId]
        NpcInfoHelper.objectTemplateList[accountId] = {}
        local index = 1
        repeat
            local row = Query:GetRow()
            NpcInfoHelper.objectTemplateList[accountId][index] = {
                entry = row["entry"], twName = row["twName"], cnName = row["cnName"], enName = row["enName"]
            }
            index = index + 1
        until not Query:NextRow() or index > NpcInfoHelper.queryLimit
    end
    local resultCount = lastNames.count
    player:GossipMenuAddItem(0, "名字含'" .. name .. "'gameobject数:" .. resultCount, 0, NpcInfoHelper.midHome)
    for k, v in pairs(NpcInfoHelper.objectTemplateList[accountId]) do
        player:GossipMenuAddItem(3, v.entry .. NpcInfoHelper.GetNameStr(v.twName, v.cnName, v.enName), 0, k)
    end
    NpcInfoHelper.addHistory(player, NpcInfoHelper.midObjectQueryName, "[历史]GameObjet-Name:" .. name, name)
    player:GossipSendMenu(1, item)
end

--通过entry方式查询Object
function NpcInfoHelper.AddObjectGossip(player, item, entry)
    player:GossipClearMenu()
    local accountId = player:GetGUIDLow()
    local lastIds = NpcInfoHelper.queryInfo.objectIds[accountId]
    if not lastIds or lastIds.entry ~= entry then
        --未查过或查过但entry不同则重新查
        --SELECT guid,id,map,position_x,position_y,position_z,zhtw.name as twName,zhcn.name as cnName,ct.name as enName from gameobject left join gameobject_template_locale as zhtw on id=zhtw.entry and zhtw.locale='zhTw' LEFT JOIN gameobject_template_locale as zhcn on id=zhcn.entry and zhcn.locale='zhCn'LEFT JOIN gameobject_template as ct on id=ct.entry where id=3217
        local sql =
            "SELECT guid,id,map,position_x,position_y,position_z,zhtw.name as twName,zhcn.name as cnName,ct.name as enName from gameobject left join gameobject_template_locale as zhtw on id=zhtw.entry and zhtw.locale='zhTw' LEFT JOIN gameobject_template_locale as zhcn on id=zhcn.entry and zhcn.locale='zhCn'LEFT JOIN gameobject_template as ct on id=ct.entry where id=" ..
            entry;
        local Query = WorldDBQuery(sql)
        if not Query then
            player:SendAreaTriggerMessage("查询的ID:" .. entry .. "不存在object记录")
            --不存在就自动返回到查询名称
            local lastNames = NpcInfoHelper.queryInfo.objectNames[accountId]
            if (lastNames) then
                NpcInfoHelper.lastOper[accountId].lastId = NpcInfoHelper.midObjectQueryName
                NpcInfoHelper.AddObjectNameGossip(player, item, lastNames.name)
                return
            end
            player:GossipComplete()
            return
        end
        NpcInfoHelper.queryInfo.objectIds[accountId] = { entry = entry, count = Query:GetRowCount() }
        lastIds = NpcInfoHelper.queryInfo.objectIds[accountId]
        NpcInfoHelper.objectList[accountId] = {}

        local index = 1
        repeat
            local row = Query:GetRow()
            NpcInfoHelper.objectList[accountId][index] = {
                guid = row["guid"],
                entry = row["id"],
                map = row["map"],
                x = row["position_x"],
                y = row["position_y"],
                z =
                    row["position_z"],
                twName = row["twName"],
                cnName = row["cnName"],
                enName = row["enName"]
            }
            index = index + 1
        until not Query:NextRow() or index > NpcInfoHelper.queryLimit
    end

    local resultCount = lastIds.count
    local creature = NpcInfoHelper.objectList[accountId][1]
    player:GossipMenuAddItem(0, NpcInfoHelper.GetCreatureNameStr(creature) ..
        "(" .. creature.entry .. ",共" .. resultCount .. "个)", 0, NpcInfoHelper.midHome, false)
    for k, v in pairs(NpcInfoHelper.objectList[accountId]) do
        local areaName, mapName = wzCommon.getAreaInfoByMapInfo(v.map, v.x, v.y, v.z)
        player:GossipMenuAddItem(3, v.guid .. "(" .. areaName .. "，" .. mapName .. ")", 0, k, true)
    end
    player:GossipMenuAddItem(0, "返回", 0, NpcInfoHelper.midBack)
    player:SendAreaTriggerMessage("选中输入0=标识Object位置,1=直接传送到此Object")
    player:SendBroadcastMessage("选中输入0=标识Object位置,1=直接传送到此Object")
    player:GossipSendMenu(1, item)
end

--通过name方式查询
function NpcInfoHelper.AddNameGossip(player, item, name)
    player:GossipClearMenu()
    local accountId = player:GetGUIDLow()
    local lastNames = NpcInfoHelper.queryInfo.names[accountId]
    if not lastNames or lastNames.name ~= name then
        --未查过或查过但名字不同则重新查
        --SELECT ct.entry, zhtw.name as twName,zhcn.name as cnName,ct.name as enName from creature_template as ct left join creature_template_locale as zhtw on ct.entry=zhtw.entry and zhtw.locale='zhTw' LEFT JOIN creature_template_locale as zhcn on ct.entry=zhcn.entry and zhcn.locale='zhCn'  where ct.`name` like '%巴尔洛%' or ct.entry in (SELECT entry from creature_template_locale where `Name` LIKE '%巴尔洛%' and  (locale='zhCn' or locale='zhTw' )) ORDER BY ct.entry
        local sql =
            "SELECT ct.entry, zhtw.name as twName,zhcn.name as cnName,ct.name as enName from creature_template as ct left join creature_template_locale as zhtw on ct.entry=zhtw.entry and zhtw.locale='zhTw' LEFT JOIN creature_template_locale as zhcn on ct.entry=zhcn.entry and zhcn.locale='zhCn'  where ct.`name` like '%" ..
            name ..
            "%' or ct.entry in (SELECT entry from creature_template_locale where `Name` LIKE '%" ..
            name .. "%' and  (locale='zhCn' or locale='zhTw' )) ORDER BY ct.entry;"
        local Query = WorldDBQuery(sql)
        if not Query or Query:GetRowCount() == 0 then
            player:SendAreaTriggerMessage("查询的名称'" .. name .. "'不存在")
            player:GossipComplete()
            return
        end

        NpcInfoHelper.queryInfo.names[accountId] = { name = name, count = Query:GetRowCount() }
        lastNames = NpcInfoHelper.queryInfo.names[accountId]
        NpcInfoHelper.entryList[accountId] = {}
        local index = 1
        repeat
            local row = Query:GetRow()
            NpcInfoHelper.entryList[accountId][index] = {
                entry = row["entry"], twName = row["twName"], cnName = row["cnName"], enName = row["enName"]
            }
            index = index + 1
        until not Query:NextRow() or index > NpcInfoHelper.queryLimit
    end

    local resultCount = lastNames.count
    player:GossipMenuAddItem(0, "名字含'" .. name .. "'NPC数:" .. resultCount, 0, NpcInfoHelper.midHome)
    for k, v in pairs(NpcInfoHelper.entryList[accountId]) do
        player:GossipMenuAddItem(3, v.entry .. NpcInfoHelper.GetNameStr(v.twName, v.cnName, v.enName), 0, k)
    end
    NpcInfoHelper.addHistory(player, NpcInfoHelper.midNpcQueryName, "[历史]NPC-Name:" .. name, name)
    player:GossipSendMenu(1, item)
end

--通过entry方式查询,guid空表示从查询name过来，0表示查询id过来，其他表示从选中过来
function NpcInfoHelper.AddIdGossip(player, item, entry, guid)
    player:GossipClearMenu()
    local accountId = player:GetGUIDLow()
    local lastIds = NpcInfoHelper.queryInfo.ids[accountId]
    if not lastIds or lastIds.entry ~= entry then
        --未查过或查过但entry不同则重新查
        --SELECT guid,id1,map,position_x,position_y,position_z,zhtw.name as twName,zhcn.name as cnName,ct.name as enName from creature left join creature_template_locale as zhtw on id1=zhtw.entry and zhtw.locale='zhTw' LEFT JOIN creature_template_locale as zhcn on id1=zhcn.entry and zhcn.locale='zhCn'LEFT JOIN creature_template as ct on id1=ct.entry where id1=6 ORDER BY case when guid=80000 then 0 else 1 end LIMIT 20
        local sql =
            "SELECT guid,id1,map,position_x,position_y,position_z,zhtw.name as twName,zhcn.name as cnName,ct.name as enName from creature left join creature_template_locale as zhtw on id1=zhtw.entry and zhtw.locale='zhTw' LEFT JOIN creature_template_locale as zhcn on id1=zhcn.entry and zhcn.locale='zhCn' LEFT JOIN creature_template as ct on id1=ct.entry where id1=" ..
            entry;
        if (guid and guid > 0) then
            sql = sql .. " ORDER BY case when guid=" .. guid .. " then 0 else 1 end"
        end

        -- sql = sql.." LIMIT "..NpcInfoHelper.queryLimit..";"
        local Query = WorldDBQuery(sql)
        if not Query then
            player:SendAreaTriggerMessage("查询的ID:" .. entry .. "不存在creature记录")
            if not guid then
                --不存在就自动返回到查询名称
                local lastNames = NpcInfoHelper.queryInfo.names[accountId]
                if (lastNames) then
                    NpcInfoHelper.lastOper[accountId].lastId = NpcInfoHelper.midNpcQueryName
                    NpcInfoHelper.AddNameGossip(player, item, lastNames.name)
                    return
                end
            end
            player:GossipComplete()
            return
        end
        NpcInfoHelper.queryInfo.ids[accountId] = { entry = entry, count = Query:GetRowCount() }
        lastIds = NpcInfoHelper.queryInfo.ids[accountId]
        NpcInfoHelper.creatureList[accountId] = {}

        local index = 1
        repeat
            local row = Query:GetRow()
            NpcInfoHelper.creatureList[accountId][index] = {
                guid = row["guid"],
                entry = row["id1"],
                map = row["map"],
                x = row["position_x"],
                y = row["position_y"],
                z =
                    row["position_z"],
                twName = row["twName"],
                cnName = row["cnName"],
                enName = row["enName"]
            }
            index = index + 1
        until not Query:NextRow() or index > NpcInfoHelper.queryLimit
    end

    local resultCount = lastIds.count
    local creature = NpcInfoHelper.creatureList[accountId][1]
    player:GossipMenuAddItem(0, NpcInfoHelper.GetCreatureNameStr(creature) ..
        "(" .. creature.entry .. ",共" .. resultCount .. "个)", 0, NpcInfoHelper.midHome, false)
    for k, v in pairs(NpcInfoHelper.creatureList[accountId]) do
        local areaName, mapName = wzCommon.getAreaInfoByMapInfo(v.map, v.x, v.y, v.z)
        player:GossipMenuAddItem(3, v.guid .. "(" .. areaName .. "，" .. mapName .. ")", 0, k, true)
    end
    if not guid then
        player:GossipMenuAddItem(0, "返回", 0, NpcInfoHelper.midBack)
    else
        NpcInfoHelper.addHistory(player, NpcInfoHelper.midNpcQueryId, "[历史]NPC-Id:" .. creature.entry, creature.entry)
    end
    player:SendAreaTriggerMessage("选中输入0=标识NPC位置,1=直接传送到此NPC")
    player:SendBroadcastMessage("选中输入0=标识NPC位置,1=直接传送到此NPC")
    player:GossipSendMenu(1, item)
end

--(event, player, object) - Object is the Creature/GameObject/Item. Can return false to do default action. For item gossip can return false to stop spell casting.
function NpcInfoHelper.OnUse(event, player, item)
    player:GossipClearMenu()
    local accountId = player:GetGUIDLow()
    NpcInfoHelper.lastOper[accountId] = {}
    player:GossipMenuAddItem(8, "NPC查询-ID方式", 0, NpcInfoHelper.midNpcQueryId, true)
    player:GossipMenuAddItem(8, "NPC查询-Name方式", 0, NpcInfoHelper.midNpcQueryName, true)
    player:GossipMenuAddItem(2, "NPC信息-当前选中", 0, NpcInfoHelper.midNpcInfo, false)
    player:GossipMenuAddItem(3, "GameObject-Name方式", 0, NpcInfoHelper.midObjectQueryName, true)
    if (NpcInfoHelper.history[accountId]) then
        local h = NpcInfoHelper.history[accountId]
        for i = #h, 1, -1 do
            player:GossipMenuAddItem(4, h[i].title, 0, NpcInfoHelper.midHistryQueryStart + i, false)
        end
    end
    -- player:GossipMenuAddItem(3, "任务查询-ID方式", 0, NpcInfoHelper.midQuestQueryID, true)
    player:GossipSendMenu(1, item)
    return false
end

--(event, player, object, sender, intid, code, menu_id) - Object is the Creature/GameObject/Item/Player, menu_id is only for player gossip. Can return false to do default action.
function NpcInfoHelper.OnSelect(event, player, item, sender, intid, code, menuid)
    if (intid == NpcInfoHelper.midHome) then
        NpcInfoHelper.OnUse(event, player, item)
        return
    end
    local accountId = player:GetGUIDLow()
    if (intid > NpcInfoHelper.midHistryQueryStart and intid <= NpcInfoHelper.midHistryQueryStart + NpcInfoHelper.historyLimit) then
        --历史记录点击处理
        local history = NpcInfoHelper.history[accountId]
        if (not history) then
            player:SendAreaTriggerMessage("无历史记录")
            return
        end
        local index = intid - NpcInfoHelper.midHistryQueryStart
        if (index <= 0 or index > #history) then
            player:SendAreaTriggerMessage("未找到相应的历史记录")
            return
        end
        NpcInfoHelper.OnSelect(event, player, item, sender, history[index].type, history[index].query)
        return
    end
    local lastOperId = NpcInfoHelper.lastOper[accountId].lastId
    if (not lastOperId) then
        NpcInfoHelper.lastOper[accountId].lastId = intid
        -- print(">>NpcInfoHelper: intid=" .. intid .. ",code=" .. code  .. ",lastOperId=nil")
    else
        -- print(">>NpcInfoHelper: intid=" .. intid .. ",code=" .. code .. ",lastOperId=" .. lastOperId)
    end

    if not lastOperId and intid == NpcInfoHelper.midNpcInfo then
        --选中的NPC信息
        local creature = NpcInfoHelper.GetNowSelectNPCInfo(player)
        if (not creature) then
            player:SendAreaTriggerMessage("请先选择一个NPC")
            NpcInfoHelper.OnUse(event, player, item)
            return
        end
        NpcInfoHelper.AddIdGossip(player, item, creature:GetEntry(), creature:GetGUIDLow())
        return
    end
    if not lastOperId and intid == NpcInfoHelper.midNpcQueryId then
        --查询id
        NpcInfoHelper.AddIdGossip(player, item, code, 0)
        return
    end
    if not lastOperId and intid == NpcInfoHelper.midNpcQueryName then
        --查询name
        NpcInfoHelper.AddNameGossip(player, item, code)
        return
    end
    if not lastOperId and intid == NpcInfoHelper.midObjectQueryName then
        --对象名称查询
        NpcInfoHelper.AddObjectNameGossip(player, item, code)
        return
    end
    if (lastOperId == NpcInfoHelper.midNpcQueryName) then
        local ct = NpcInfoHelper.entryList[accountId][intid]
        if (not ct) then
            player:SendAreaTriggerMessage("未能找到对应的NPC")
            player:GossipComplete()
            return
        end
        NpcInfoHelper.lastOper[accountId].lastId = NpcInfoHelper.midNpcQueryId
        NpcInfoHelper.AddIdGossip(player, item, ct.entry)
        return
    end
    if (lastOperId == NpcInfoHelper.midNpcQueryId or lastOperId == NpcInfoHelper.midNpcInfo) then
        if intid == NpcInfoHelper.midBack then
            local lastNames = NpcInfoHelper.queryInfo.names[accountId]
            if (not lastNames) then
                player:SendAreaTriggerMessage("未知返回操作")
                player:GossipComplete()
            end
            NpcInfoHelper.lastOper[accountId].lastId = NpcInfoHelper.midNpcQueryName
            NpcInfoHelper.AddNameGossip(player, item, lastNames.name)
            return
        end
        --最后是查询id列出后，initid为
        local creature = NpcInfoHelper.creatureList[accountId][intid]
        if (not creature) then
            player:SendAreaTriggerMessage("未能找到对应guid的NPC")
            player:GossipComplete()
            return
        end
        --选中输入0=标识NPC位置,1=直接传送到此NPC
        if code == "0" then
            wzCommon.SendPOI(player, creature.map, creature.x, creature.y, creature.z,
                NpcInfoHelper.GetCreatureNameStr(creature))
            player:GossipComplete()
            return
        elseif code == "1" then
            player:Teleport(creature.map, creature.x, creature.y, creature.z, 0)
            player:GossipComplete()
            return
        end
        player:GossipComplete()
    end
    if (lastOperId == NpcInfoHelper.midObjectQueryName) then
        local ot = NpcInfoHelper.objectTemplateList[accountId][intid]
        if (not ot) then
            player:SendAreaTriggerMessage("未能找到对应的gameobject_template")
            player:GossipComplete()
            return
        end
        NpcInfoHelper.lastOper[accountId].lastId = NpcInfoHelper.midObjectQueryId
        NpcInfoHelper.AddObjectGossip(player, item, ot.entry)
        return
    end
    if (lastOperId == NpcInfoHelper.midObjectQueryId) then
        if intid == NpcInfoHelper.midBack then
            local lastNames = NpcInfoHelper.queryInfo.objectNames[accountId]
            if (not lastNames) then
                player:SendAreaTriggerMessage("未知返回操作")
                player:GossipComplete()
            end
            NpcInfoHelper.lastOper[accountId].lastId = NpcInfoHelper.midObjectQueryName
            NpcInfoHelper.AddObjectNameGossip(player, item, lastNames.name)
            return
        end
        local obj = NpcInfoHelper.objectList[accountId][intid]
        if (not obj) then
            player:SendAreaTriggerMessage("未能找到对应guid的Object")
            player:GossipComplete()
            return
        end
        --选中输入0=标识Object位置,1=直接传送到此Object
        if code == "0" then
            wzCommon.SendPOI(player, obj.map, obj.x, obj.y, obj.z, NpcInfoHelper.GetCreatureNameStr(obj))
            player:GossipComplete()
            return
        elseif code == "1" then
            player:Teleport(obj.map, obj.x, obj.y, obj.z + 22.0, 0)
            -- print(">>NpcInfoHelper: Teleport to Object:", obj.map, obj.x, obj.y, obj.z+25.0)
            player:GossipComplete()
            return
        end
        player:GossipComplete()
    end
end

RegisterItemGossipEvent(NpcInfoHelper.itemEntry, 1, NpcInfoHelper.OnUse)
RegisterItemGossipEvent(NpcInfoHelper.itemEntry, 2, NpcInfoHelper.OnSelect)
print(">>Script: wzNpcInfoHelper loaded.")
