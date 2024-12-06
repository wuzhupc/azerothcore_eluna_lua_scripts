--[[
Author: wuzhu
Date: 2024-10-30 16:46:45
LastEditTime: 2024-11-14 18:22:34
FilePath: \Azerothcore\lua_scripts\WuzhuCustom\wzVendor.lua
Description:超级商人(NPC-922006)脚本-修改版本，直接使用npc_vendor中数据，npc:922701->924000
Copyright (c) 2024 by WUZHUPC, All Rights Reserved.
--]]
print(">>Script: wzVendor loading...")

-- local wzVendor_DW = 1
-- local wzVendor_OT = 2
local wzVendor    = {
	NPCID              = 922006,
	NPCNAME            = "物资商人",
	--GOSSIP_ICON 菜单图标
	GOSSIP_ICON_CHAT   = 0, -- 对话
	GOSSIP_ICON_VENDOR = 1, -- 货物
	VENDOR_ENTRY_START = 922700, --商人entry起始
	GOODS              = { --货物id号
		[0] = {          --菜单
			{ "|cff001100零件商品|r", 922701 },
			{ "|cff001500布匹材料|r", 922705 },
			{ "|cff001900皮革材料|r", 922706 },
			{ "|cff001D00矿石材料|r", 922707 },
			{ "|cff002200肉类材料|r", 922708 },
			{ "|cff002600草药材料|r", 922709 },
			{ "|cff002A00元素材料|r", 922710 },
			{ "|cff002E00其他商品|r", 922711 },
			{ "|cff003300附魔材料|r", 922712 },
			{ "|cff003700钥    匙|r", 923300 },
			{ "|cff003700特殊物品|r", 923301 },
			-- {"职业雕文",1},
			-- {"|cff660000常用钥匙|r",OT+0x10},
			-- {"|cff0909FF传家宝装备|r",OT+0x90},
		},

		-- [1] = { --雕文
		-- 	{ "盗贼雕文", wzVendor_DW + 0x10 },
		-- 	{ "德鲁伊雕文", wzVendor_DW + 0x20 },
		-- 	{ "法师雕文", wzVendor_DW + 0x30 },
		-- 	{ "猎人雕文", wzVendor_DW + 0x40 },
		-- 	{ "牧师雕文", wzVendor_DW + 0x50 },
		-- 	{ "骑士雕文", wzVendor_DW + 0x60 },
		-- 	{ "萨满雕文", wzVendor_DW + 0x70 },
		-- 	{ "术士雕文", wzVendor_DW + 0x80 },
		-- 	{ "死骑雕文", wzVendor_DW + 0x90 },
		-- 	{ "战士雕文", wzVendor_DW + 0xa0 },
		-- },
		-- [wzVendor_OT + 0x90] = { --传家宝
		-- 	42943, 42944, 42945, 42946, 42947, 42948, 42949, 42950, 42951, 42952, 42984, 42985, 42991, 42992, 44091,
		-- 	44092, 44093, 44094, 44095, 44096, 44097, 44098, 44099, 44100, 44101, 44102, 44103, 44105, 44107, 48677, 48683,
		-- 	48685, 48687, 48689, 48691, 48716, 48718, 50255,
		-- 	49177, --寒冷天气飞行宝典
		-- 	--21537,--春节饺子
		-- 	--6265, --灵魂碎片
		-- 	--23162, --36格背包
		-- },

		-- [wzVendor_DW + 0x10] = { --盗贼
		-- 	42954,         --冲动雕文
		-- },
	},
	Says               = { --随机的话
		"我的货物不打折的哦",
		"慢慢看，我的货物在其他地方买不到。",
		"我有的是时间，你可以慢慢挑选。",
		"我这里有很多基础材料。",
		"你不买点材料做生意吗？",
		"要来点材料弄点高级宝石，给装备强化吗？",
		"你应该需要些材料制作更换你的雕文。",
		"当年我可是第一盗贼，留下很多钥匙。",
		"种族不代表荣耀，希望你能愉快畅玩！",
	},
}
function wzVendor.AddMenu(player, unit, id)
	player:GossipClearMenu() --清除菜单
	local menus = wzVendor.GOODS[id]
	for k, v in pairs(menus) do
		player:GossipMenuAddItem(v[3] or wzVendor.GOSSIP_ICON_VENDOR, v[1] or "???", 0, (v[2] or k))
	end
	player:GossipSendMenu(1, unit) --发送菜单
end

function wzVendor.OnHello(event, player, unit) --显示菜单
	wzVendor.AddMenu(player, unit, 0)
end

-- math.randomseed(os.time()) 已经在_Misc.ext中统一

function wzVendor.OnSelect(event, player, unit, sender, intid, code, menu_id) --添加货物
	local text = wzVendor.Says[math.random(1, #wzVendor.Says)] or nil
	if (text) then
		unit:SendUnitSay(text, 0)
	end
	if (intid < 0x10) then
		wzVendor.AddMenu(player, unit, intid)
	elseif(intid>wzVendor.VENDOR_ENTRY_START) then
		player:SendListInventory(unit,intid)
	else
		player:GossipComplete() --关闭菜单
		local entry = unit:GetEntry()
		--https://github.com/azerothcore/mod-eluna/issues/199
		-- VendorRemoveAllItems(entry) --目前此方法会导致crash
		local goods = {}--wzVendor.GOODS[intid] or {}
		print(#goods)
		for k, v in pairs(goods) do
			--AddVendorItem(entry, item, maxcount, incrtime, extendedcost )
			--incrtime Combined with maxcount, incrtime tells how often (in seconds) the vendor list is refreshed and the limited Item copies are restocked.
			--extendedcost:Unique cost of an Item, such as conquest points for example.
			-- print(entry..'   goods:'..v)
			AddVendorItem(entry, v, 0, 0, 0)
		end
		player:SendListInventory(unit)
	end
end

RegisterCreatureGossipEvent(wzVendor.NPCID, 1, wzVendor.OnHello)
RegisterCreatureGossipEvent(wzVendor.NPCID, 2, wzVendor.OnSelect)

print(">>Script: wzVendor loaded.")
