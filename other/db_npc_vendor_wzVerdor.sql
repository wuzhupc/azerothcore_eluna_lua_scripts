
/**
922006
922700

7	0	Trade Goods	 贸易货物
7	1	Parts	零件
7	2	Explosives	爆炸物
7	3	Devices	装置
7	4	Jewelcrafting	珠宝加工
7	5	Cloth	布甲
7	6	Leather	皮甲
7	7	Metal & Stone	金属和矿石
7	8	Meat	肉类
7	9	Herb	草药
7	10	Elemental	元素
7	11	Other	其他
7	12	Enchanting	附魔
7	13	Materials	原料
7	14	Armor Enchantment	护甲附魔
7	15	Weapon Enchantment	武器附魔
**/

SELECT
	entry,class,subclass,item_template.name, il.`Name` AS twName,FlagsExtra, Quality,BuyCount,BuyPrice,SellPrice
FROM
	item_template
	LEFT JOIN item_template_locale AS il ON il.ID = entry 
	AND il.locale = 'zhTw' 
WHERE
	class = 7 
	AND subclass = 9 and Quality!=0 and BuyPrice>0 and item_template.`name` not like '%Deprecated%' and FlagsExtra!=8192;
	
	SELECT 922707 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 7 and subclass = 7 and Quality!=0 and BuyPrice>0 and `name` not like '%Deprecated%';


    DELETE from npc_vendor where entry = 922701;
	INSERT INTO npc_vendor(entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) SELECT 922701 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 7 and subclass = 1 and Quality!=0 and BuyPrice>0;
	
	DELETE from npc_vendor where entry = 922705;
	INSERT INTO npc_vendor(entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) SELECT 922705 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 7 and subclass = 5 and Quality!=0 and BuyPrice>0;

    DELETE from npc_vendor where entry = 922706;
	INSERT INTO npc_vendor(entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) SELECT 922706 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 7 and subclass = 6 and Quality!=0 and BuyPrice>0;

    DELETE from npc_vendor where entry = 922707;
	INSERT INTO npc_vendor(entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) SELECT 922707 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 7 and subclass = 7 and Quality!=0 and BuyPrice>0 and `name` not like '%Deprecated%';

    DELETE from npc_vendor where entry = 922708;
	INSERT INTO npc_vendor(entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) SELECT 922708 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 7 and subclass = 8 and Quality!=0 and BuyPrice>0 and `name` not like '%Deprecated%' and FlagsExtra!=8192;

    DELETE from npc_vendor where entry = 922709;
	INSERT INTO npc_vendor(entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) SELECT 922709 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 7 and subclass = 9 and Quality!=0 and BuyPrice>0 and `name` not like '%Deprecated%' and FlagsExtra!=8192;

    DELETE from npc_vendor where entry = 922710;
	INSERT INTO npc_vendor(entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) SELECT 922710 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 7 and subclass = 10 and Quality!=0 and BuyPrice>0 and `name` not like '%Deprecated%' and FlagsExtra!=8192;

    DELETE from npc_vendor where entry = 922711;
	INSERT INTO npc_vendor(entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) SELECT 922711 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 7 and subclass = 11 and Quality!=0 and BuyPrice>0 and `name` not like '%Deprecated%' and FlagsExtra!=8192;

    DELETE from npc_vendor where entry = 922712;
	INSERT INTO npc_vendor(entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) SELECT 922712 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 7 and subclass = 12 and Quality!=0 and BuyPrice>0 and `name` not like '%Deprecated%' and FlagsExtra!=8192;

--钥匙
    DELETE from npc_vendor where entry = 923300;
	INSERT INTO npc_vendor(entry,slot,item,maxcount,incrtime,ExtendedCost,VerifiedBuild) SELECT 923300 as entry, 0 as slot, entry as item,0 as maxcount,0 as incrtime,0 as ExtendedCost,0 as VerifiedBuild from item_template where class = 13 and Quality!=0 and  `name` not like '%Deprecated%';

