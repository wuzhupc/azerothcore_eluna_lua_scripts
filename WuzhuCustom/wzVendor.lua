print(">>Script: wzVendor loading...")
--2024年11月20日
--重新修改
--目的：方便60级之前的采集类物品销售
--包括：60级 采矿类，草药类，皮革类，布匹类
--包括：60级 宝石类
--包括  60级 药水、合剂等
--包括  菜单：职业雕文，钥匙（常用类），普通宝石，高级宝石，物资（矿石、皮革、草药、布匹），药水类物资；

local wzVendor_DW = 1
local wzVendor_OT = 2
local wzVendor    = {
	NPCID              = 922006,
	NPCNAME            = "物资商人",
	--GOSSIP_ICON 菜单图标
	GOSSIP_ICON_CHAT   = 0, -- 对话
	GOSSIP_ICON_VENDOR = 1, -- 货物
	GOODS              = { --货物id号
		[0] = {          --菜单
			{ "职业雕文", 1 },
			{ "|cff660000常用钥匙|r", wzVendor_OT + 0x10 },
			{ "|cff660000常用药剂|r", wzVendor_OT + 0x20 },
			{ "|cff0909FF烹饪食品|r", wzVendor_OT + 0xb0 },
			{ "|cffFFFFFF其它辅助类|r", wzVendor_OT + 0x30 },
			{ "|cff008000普通宝石|r", wzVendor_OT + 0x40 },
			{ "|cff0000FF高级宝石|r", wzVendor_OT + 0x50 },
			{ "|cff0000FF特殊宝石|r", wzVendor_OT + 0x55 },
			{ "|cff990000材料物品1 [60级矿石类]|r", wzVendor_OT + 0x60 },
			{ "|cff990000材料物品2 [60级草药类]|r", wzVendor_OT + 0x70 },
			{ "|cff990000材料物品3 [60级皮革类]|r", wzVendor_OT + 0x80 },
			{ "|cff990000材料物品4 [60级布匹类]|r", wzVendor_OT + 0xa0 },
			{ "|cff0909FF传家宝装备|r", wzVendor_OT + 0x90 },
		},

		[wzVendor_OT + 0xb0] = { --烹饪食品
			21537,
			34767,         --爆炒鲑鱼
			42994,
			34769,
			34758,
			43000,
			34754,
			42998,
			34756,
			43015, --鱼肉筵席,需要300烹饪才能使用
			43478, --丰盛筵席,big需要300烹饪才能使用
			43480, --小型筵席需要300烹饪才能使用
		},

		[1] = { --雕文
			{ "盗贼雕文", wzVendor_DW + 0x10 },
			{ "德鲁伊雕文", wzVendor_DW + 0x20 },
			{ "法师雕文", wzVendor_DW + 0x30 },
			{ "猎人雕文", wzVendor_DW + 0x40 },
			{ "牧师雕文", wzVendor_DW + 0x50 },
			{ "骑士雕文", wzVendor_DW + 0x60 },
			{ "萨满雕文", wzVendor_DW + 0x70 },
			{ "术士雕文", wzVendor_DW + 0x80 },
			{ "死骑雕文", wzVendor_DW + 0x90 },
			{ "战士雕文", wzVendor_DW + 0xa0 },
		},
		[wzVendor_OT + 0x90] = { --传家宝
			42943, 42944, 42945, 42946, 42947, 42948, 42949, 42950, 42951, 42952, 42984, 42985, 42991, 42992, 44091,
			44092, 44093, 44094, 44095, 44096, 44097, 44098, 44099, 44100, 44101, 44102, 44103, 44105, 44107, 48677, 48683,
			48685, 48687, 48689, 48691, 48716, 48718, 50255,
			49177, --寒冷天气飞行宝典
			--21537,--春节饺子
			--6265, --灵魂碎片
			--23162, --36格背包
		},

		[wzVendor_OT + 0x60] = {                                              --材料1 矿石类
			2770, 2771, 2775, 2776, 2772, 7911, 3858, 10620, 11370,           --矿石
			2835, 2836, 2838, 7912, 12365,                                    --石头
			2840, 3576, 2841, 2842, 3577, 3575, 3859, 3860, 6037, 11371, 12359, 12655, --矿石锭
			3470, 3478, 3486, 7966, 12644,                                    --砂轮
			9262,                                                             --黑色硫酸盐
		},

		[wzVendor_OT + 0x70] = { --材料2 草药类
			765, 2447, 22710, 785, 2449, 2450, 2452, 2453, 3820, 3355, 3369, 3356, 3357, 3818, 3821, 3358, 3819, 8153, 4625,
			8831, 8836, 8838, 8839, 8845, 8846, 13464, 13463, 13465, 13466, 13467, 13468,
		},

		[wzVendor_OT + 0x80] = {                               --材料3 皮革类
			2318, 2319, 4234, 4304, 8170,                      --轻中重厚皮,硬甲皮
			783, 4232, 4235, 8169, 8171, 4231, 4233, 4236, 8172, 15407, --毛皮，熟化
			6470, 6471, 7286, 7392, 2934, 5082, 5784, 4461, 5785, 8167, 8150, 8154, 8165, 15409, 15412, 15415, 15417, 15419, 12810, 15408,
			15416, 20498, 20500, 20501, 15414, 17012, 19767, 19768,
			15410, 17967, --奥妮克希亚鳞片，精制
			25707, 25708, 25700, 29548, 25699,
		},

		[wzVendor_OT + 0xa0] = {    --材料4 布匹类
			2589, 2996,             --亚麻 布  21877,--灵纹布--布卷  21840,--灵纹布卷
			2592, 2997,             --毛料
			4306, 4305,             --丝绸
			4338, 4339,
			14047, 14048,           --布 / 卷
			3182, 4337, 10285, 14227, 21881, --蛛丝
			21842,                  --魔化灵纹布卷
			14342,                  --月布
		},

		[wzVendor_OT + 0x10] = { --常用钥匙
			7146,          --血色十字军钥匙
			11000,         --暗炉钥匙
			11602,         --黑铁酒吧钥匙
			12382,         --城市大门钥匙
			13704,         --骷髅钥匙
			18249,         --月牙钥匙
			--18266,--戈多克庭院钥匙
			--18268,--戈多克内门钥匙
			24490, --麦迪文的钥匙
			27991, --暗影迷宫钥匙
			28395, --破碎大厅钥匙
			30623, --水库钥匙
			30633, --奥金尼钥匙
			30634, --星船钥匙
			30622, --荣耀堡焰铸钥匙
			30637, --萨尔玛焰铸钥匙
			30635, --时光之钥
		},

		[wzVendor_OT + 0x20] = { --2 常用药剂
			--药水
			929, 1710, 3928, 13446, 5634, 3823, 9172, 3386, 13455, 13462, 20008,
			28100, 28101, 22829, 22832,
			6657, --美味风蛇
			8529, --诺格弗格药剂
			12820, --冬泉火酒
			3387, --有限无敌药水
			13506, --化石药水
			22522, --巫师之油 +42法伤
			36889, --恶魔治疗石 3500
			36895, --恶魔灵魂石
		},

		[wzVendor_OT + 0x30] = { --3 其他辅助类
			21537,         --春节饺子
			--34062,--魔法点心
			49040,         --基维斯
			6265,          --灵魂碎片
			22461,         --符文魔铁棒
			--附魔卷轴(武器不需要等级)
			38840, 38848, 38838, 38868, 38879, 38880, 38872, 38870, 38877, 38878, 38873,
			38871, 38883, 38917, 38884,
			49703, --永久紫色焰火(重置团本用！)
			38682, --附魔羊皮纸
			--36895,--恶魔灵魂石
		},

		[wzVendor_OT + 0x40] = { --宝石
			774,           --孔雀石
			818,           --虎眼石
			1210,          --暗影石
			1529,          --翡翠
			1705,          --次级月亮石
			3864,          --黄水晶
			5498,          --有光泽的小珍珠
			5500,          --彩色珍珠
			7909,          --青绿石
			7910,          --红宝石
			7971,          --黑珍珠
			11382,         --山脉之血
			12361,         --蓝宝石
			12363,         --秘法水晶
			12364,         --巨型绿宝石
			12799,         --大猫眼石
			12800,         --艾泽拉斯钻石
			13926,         --金珍珠
			23117,         --蓝月石
			21929,         --火石榴石
			23077,         --血石榴石
			23079,         --翠绿橄榄石
			23107,         --暗影卓奈石
			23112,         --黄金卓奈石
			23436,         --生命红宝石
			23437,         --泰拉宝石
			23438,         --伊露恩之星
			23439,         --皇家黄宝石
			23440,         --黎明石
			23441,         --夜眼石
			24478,         --锯齿珍珠
			24479,         --暗影珍珠
			25867,         --大地风暴钻石
			25868,         --天火钻石
			--天火钻石23234,	--Blue Bryanite of Agility
			--23364,	--zzDEPRECATEDHeart of the Sky
			--27864,	--Brian's Bryanite of Extended Cost Copying
			32227, --深红尖晶石
			32249, --海泉绿宝石
			32230, --影歌紫水晶
			32229, --狮眼石
			32231, --焚石
			32228, --天蓝宝石
		},

		[wzVendor_OT + 0x50] = { --高级宝石
			22459,         --虚空之球。所有抗性+4
			22460,         --棱石之球。所有抗性+3
			25890,         --毁灭的天火钻石。+14法术暴击 1%法术反射
			25893,         --神秘的天火钻石。5%机率下次施法时间减半
			25894,         --迅捷的天火钻石。+24攻强 提高奔跑速度
			25895,         --谜般的天火钻石。+12暴击 5%抵抗诱捕定身
			25896,         --强力的大地风暴钻石。+18耐力 5%抵抗昏迷
			25897,         --振奋的大地风暴钻石。+26治疗 威胁减2%
			25898,         --坚韧的大地风暴钻石。+12防御 命中回血
			25899,         --粗暴的大地风暴钻石。+3近战伤害 击中昏迷
			25901,         --洞察的大地风暴钻石。+12智力 施法回法
			28556,         --迅捷风火钻石。+20攻强 提高奔跑速度
			28557,         --迅捷星火钻石。+12法伤 提高奔跑速度
			32195,         --泪珠深红尖晶石。+22治疗
			32196,         --符文深红尖晶石。+12法伤
			32197,         --明亮的深红尖晶石。+20攻强
			32198,         --精巧的深红尖晶石。+10躲闪
			32199,         --Flashing Crimson Spinel。+10招架
			32200,         --坚固的苍穹蓝宝石。+15耐力
			32201,         --发光的苍穹蓝宝石。+10精神
			32202,         --光亮的苍穹蓝宝石。每5秒回法+4
			32203,         --狂暴的苍穹蓝宝石。+13法术穿透
			32204,         --明亮的狮眼石。+10智力
			32205,         --光滑的狮眼石。+10暴击
			32206,         --坚硬的狮眼石。+10命中
			32207,         --闪烁的狮眼石。+10法术暴击
			32208,         --有厚度的狮眼石。+10防御
			32209,         --神秘的狮眼石。+10韧性
			32210,         --极佳的狮眼石。+10法术命中
			32211,         --至尊影歌紫水晶。+5力量 +7耐力
			32212,         --移形影歌紫水晶。+5敏捷 +7耐力
			32213,         --平衡影歌紫水晶。+10攻强 +7耐力
			32214,         --能量影歌紫水晶。+10攻强 每5秒回法+2
			32215,         --鲜艳影歌紫水晶。+6法伤 +7耐力
			32216,         --皇家影歌紫水晶。+11治疗 每5秒回法+2
			32217,         --雕刻焚石。+5暴击 +5力量
			32218,         --高效焚石。+5法术暴击 +5法伤
			32219,         --光辉焚石。+11治疗 +5智力
			32220,         --闪烁焚石。+5命中 +5敏捷
			32221,         --Veiled Pyrestone。+5法术命中 +5法伤
			32222,         --邪恶焚石。+5暴击 +10攻强
			32223,         --持久的海泉绿宝石。+5防御 +7耐力
			32224,         --发光的海泉绿宝石。+5法术暴击 +5法术穿透
			32225,         --灿烂的海泉绿宝石。+5智力 每5秒回法+2
			32226,         --尖突的海泉绿宝石。+5暴击 +7耐力
			32409,         --不懈的大地风暴钻石。+12敏捷 +5%暴击伤害
			32410,         --惊人的天火钻石。一定几率提高攻速
			32640,         --高效的易变钻石。+24攻强 5%抵抗昏迷
			32641,         --灌魔的易变钻石。+14法伤 5%抵抗昏迷
			34220,         ----混乱之天火钻石 +12 爆击等级，+3% 爆击伤害
		},

		[wzVendor_OT + 0x55] = { --特殊宝石
			42225,         --龙眼石 200G一个
		},

		[wzVendor_DW + 0x10] = { --盗贼
			42954,         --冲动雕文
			42955,         --伏击雕文
			42956,         --背刺雕文
			42957,         --剑刃乱舞雕文
			42958,         --减速药膏雕文
			42959,         --致命投掷雕文
			42960,         --闪避雕文
			42961,         --刺骨雕文
			42962,         --破甲雕文
			42963,         --佯攻雕文
			42964,         --锁喉雕文
			42965,         --鬼魅攻击雕文
			42966,         --凿击雕文
			42967,         --出血雕文
			42968,         --伺机待发雕文
			42969,         --割裂雕文
			42970,         --闷棍雕文
			42971,         --精力雕文
			42972,         --影袭雕文
			42973,         --切割雕文
			42974,         --疾跑雕文
			43343,         --妙手空空雕文
			43376,         --扰乱雕文
			43377,         --开锁雕文
			43378,         --安全降落雕文
			43379,         --水上漂雕文
			43380,         --消失雕文
			45761,         --血之饥渴雕文
			45762,         --杀戮盛筵雕文
			45764,         --暗影之舞雕文
			45766,         --刀扇雕文
			45767,         --嫁祸诀窍雕文
			45768,         --毁伤雕文
			45769,         --暗影斗篷雕文
			45908,         --毒伤雕文
		},

		[wzVendor_DW + 0x20] = { --德鲁伊
			40896,         --狂暴回复雕文
			40897,         --重殴雕文
			40899,         --低吼雕文
			40900,         --裂伤雕文
			40901,         --撕碎雕文
			40902,         --割裂雕文
			40903,         --斜掠雕文
			40906,         --迅捷治愈雕文
			40908,         --激活雕文
			40909,         --复生雕文
			40912,         --愈合雕文
			40913,         --回春雕文
			40914,         --治疗之触雕文
			40915,         --生命绽放雕文
			40916,         --星火雕文
			40919,         --虫群雕文
			40920,         --飓风雕文
			40921,         --星辰坠落雕文
			40922,         --愤怒雕文
			40923,         --月火雕文
			40924,         --纠缠根须雕文
			43316,         --水栖形态雕文
			43331,         --无忧复生雕文
			43332,         --荆棘雕文
			43334,         --挑战咆哮雕文
			43335,         --野性雕文
			43674,         --急奔雕文
			44922,         --台风雕文
			44928,         --专注雕文
			45601,         --狂暴雕文
			45602,         --野性成长雕文
			45603,         --滋养雕文
			45604,         --野蛮咆哮雕文
			45622,         --季风雕文
			45623,         --树皮雕文
			46372,         --生存本能雕文
		},

		[wzVendor_DW + 0x30] = { --法师
			42734,         --魔爆雕文
			42735,         --奥术飞弹雕文
			42736,         --奥术强化雕文
			42737,         --闪现雕文
			42738,         --唤醒雕文
			42739,         --火球雕文
			42740,         --火焰冲击雕文
			42741,         --冰霜新星雕文
			42742,         --寒冰箭雕文
			42743,         --冰甲雕文
			42744,         --寒冰屏障雕文
			42745,         --冰枪雕文
			42746,         --冰冷血脉雕文
			42747,         --强化灼烧雕文
			42748,         --隐形雕文
			42749,         --法师护甲雕文
			42750,         --法力宝石雕文
			42751,         --熔岩护甲雕文
			42752,         --变形雕文
			42753,         --解除诅咒雕文
			42754,         --水元素雕文
			43339,         --奥术智慧雕文
			43357,         --防护火焰结界雕文
			43359,         --霜甲雕文
			43360,         --防护冰霜结界雕文
			43361,         --企鹅雕文
			43362,         --小熊雕文
			43364,         --缓落雕文
			44684,         --霜火雕文
			44920,         --冲击波雕文
			44955,         --奥术冲击雕文
			45736,         --深度冻结雕文
			45737,         --活动炸弹雕文
			45738,         --奥术弹幕雕文
			45739,         --镜像雕文
			45740,         --寒冰护体雕文
		},

		[wzVendor_DW + 0x40] = { --猎人
			42897,         --瞄准射击雕文
			42898,         --奥术射击雕文
			42899,         --野兽雕文
			42900,         --治愈雕文
			42901,         --蝰蛇守护雕文
			42902,         --狂野怒火雕文
			42903,         --威慑雕文
			42904,         --逃脱雕文
			42905,         --冰冻陷阱雕文
			42906,         --冰霜陷阱雕文
			42907,         --猎人印记雕文
			42908,         --献祭陷阱雕文
			42909,         --雄鹰雕文
			42910,         --多重射击雕文
			42911,         --急速射击雕文
			42912,         --毒蛇钉刺雕文
			42913,         --毒蛇陷阱雕文
			42914,         --稳固射击雕文
			42915,         --强击光环雕文
			42917,         --翼龙钉刺雕文
			43338,         --复活宠物雕文
			43350,         --治疗宠物雕文
			43351,         --假死雕文
			43354,         --支配之力雕文
			43355,         --豹群雕文
			43356,         --恐吓野兽雕文
			45625,         --奇美拉射击雕文
			45731,         --爆炸射击雕文
			45732,         --杀戮射击雕文
			45733,         --爆炸陷阱雕文
			45734,         --驱散射击雕文
			45735,         --猛禽一击雕文
		},

		[wzVendor_DW + 0x50] = { --牧师
			42396,         --治疗之环雕文
			42397,         --驱散魔法雕文
			42398,         --渐隐雕文
			42399,         --防护恐惧结界雕文
			42400,         --快速治疗雕文
			42401,         --神圣新星雕文
			42402,         --心灵之火雕文
			42403,         --光明之泉雕文
			42404,         --群体驱散雕文
			42405,         --精神控制雕文
			42406,         --精神鞭笞雕文
			42407,         --暗影雕文
			42408,         --真言术：盾雕文
			42409,         --治疗祷言雕文
			42410,         --心灵尖啸雕文
			42411,         --恢复雕文
			42412,         --天谴禁锢雕文
			42414,         --暗言术：灭雕文
			42415,         --暗言术：痛雕文
			42416,         --惩击雕文
			42417,         --拯救之魂雕文
			43342,         --渐隐雕文
			43370,         --漂浮雕文
			43371,         --坚韧雕文
			43372,         --防护暗影雕文
			43373,         --束缚亡灵雕文
			43374,         --暗影魔雕文
			45753,         --消散雕文
			45755,         --守护之魂雕文
			45756,         --苦修雕文
			45757,         --精神灼烧雕文
			45758,         --希望圣歌雕文
			45760,         --痛苦压制雕文
		},

		[wzVendor_DW + 0x60] = { --骑士
			41092,         --审判雕文
			41094,         --命令圣印雕文
			41095,         --制裁之锤雕文
			41096,         --灵魂协调雕文
			41097,         --愤怒之锤雕文
			41098,         --十字军打击雕文
			41099,         --奉献雕文
			41100,         --正义防御雕文
			41101,         --复仇者之盾雕文
			41102,         --超度邪恶雕文
			41103,         --驱邪雕文
			41104,         --清洁雕文
			41105,         --圣光闪现雕文
			41106,         --圣光雕文
			41107,         --复仇之怒雕文
			41108,         --圣洁雕文
			41109,         --智慧圣印雕文
			41110,         --光明圣印雕文
			43340,         --力量祝福雕文
			43365,         --王者祝福雕文
			43366,         --智慧祝福雕文
			43367,         --圣疗雕文
			43368,         --感知亡灵雕文
			43369,         --智者雕文
			43867,         --鲜血圣印雕文
			43868,         --正义圣印雕文
			43869,         --复仇圣印雕文
			45741,         --圣光道标雕文
			45742,         --正义之锤雕文
			45743,         --神圣风暴雕文
			45744,         --正义盾击雕文
			45745,         --神圣恳求雕文
			45746,         --神圣震击雕文
			45747,         --拯救雕文
		},

		[wzVendor_DW + 0x70] = { --萨满
			41517,         --治疗链雕文	
			41518,         --闪电链雕文
			41524,         --熔岩雕文
			41526,         --震击雕文
			41527,         --大地生命武器雕文
			41529,         --火焰元素图腾雕文
			41530,         --火焰新星图腾雕文
			41531,         --烈焰震击雕文
			41532,         --火舌武器雕文
			41533,         --治疗之泉图腾雕文
			41534,         --治疗波雕文
			41535,         --次级治疗波雕文
			41536,         --闪电箭雕文
			41537,         --闪电之盾雕文
			41538,         --法力潮汐图腾雕文
			41539,         --风暴打击雕文
			41540,         --熔岩猛击雕文
			41541,         --水之掌握雕文
			41542,         --风怒武器雕文
			41547,         --冰霜震击雕文
			41552,         --元素掌握雕文
			43344,         --水下呼吸雕文
			43381,         --星界传送雕文
			43385,         --新生雕文
			43386,         --水之护盾雕文
			43388,         --水上行走雕文
			43725,         --幽灵狼雕文
			44923,         --雷霆风暴雕文
			45770,         --雷霆雕文
			45771,         --野性狼魂雕文
			45772,         --激流雕文
			45775,         --大地之盾雕文
			45776,         --天怒图腾雕文
			45777,         --妖术雕文
			45778,         --石爪图腾雕文
		},

		[wzVendor_DW + 0x80] = { --术士
			42453,         --烧尽雕文	
			42454,         --燃烧雕文
			42455,         --腐蚀雕文
			42456,         --痛苦诅咒雕文
			42457,         --死亡缠绕雕文
			42458,         --恐惧雕文
			42459,         --恶魔卫士雕文
			42460,         --地狱猎犬雕文
			42461,         --生命通道雕文
			42462,         --治疗石雕文
			42463,         --恐惧嚎叫雕文
			42464,         --献祭雕文
			42465,         --小鬼雕文
			42466,         --灼热之痛雕文
			42467,         --暗影箭雕文
			42468,         --暗影灼烧雕文
			42469,         --生命虹吸雕文
			42470,         --灵魂石雕文
			42471,         --魅魔雕文
			42472,         --痛苦无常雕文
			42473,         --虚空行者雕文
			43389,         --水下呼吸雕文
			43390,         --吸取灵魂雕文
			43391,         --基尔罗格雕文
			43392,         --疲劳诅咒雕文
			43393,         --奴役恶魔雕文
			43394,         --灵魂雕文
			45779,         --鬼影缠身雕文
			45780,         --恶魔变形雕文
			45781,         --混乱之箭雕文
			45782,         --恶魔法阵雕文
			45783,         --暗影烈焰雕文
			45785,         --生命分流雕文
			45789,         --灵魂链接雕文
		},

		[wzVendor_DW + 0x90] = { --死骑
			43533,         --反魔法护罩雕文	
			43534,         --心脏打击雕文
			43535,         --鲜血分流雕文
			43536,         --白骨之盾雕文
			43537,         --寒冰锁链雕文
			43538,         --黑暗命令雕文
			43539,         --死亡之拥雕文
			43541,         --死亡之握雕文
			43542,         --死亡凋零雕文
			43543,         --冰霜打击雕文
			43544,         --寒冬号角雕文
			43545,         --冰封之韧雕文
			43546,         --冰冷触摸雕文
			43547,         --湮没雕文
			43548,         --瘟疫打击雕文
			43549,         --食尸鬼雕文
			43550,         --符文打击雕文
			43551,         --天谴打击雕文
			43552,         --绞杀雕文
			43553,         --铜墙铁壁雕文
			43554,         --吸血鬼之血雕文
			43671,         --邪爆雕文
			43672,         --传染雕文
			43673,         --亡者复生雕文
			43825,         --符文分流雕文
			43826,         --鲜血打击雕文
			43827,         --死亡打击雕文
			45799,         --符文刃舞雕文
			45800,         --饥饿之寒雕文
			45803,         --邪恶虫群雕文
			45804,         --黑暗死亡雕文
			45805,         --疾病雕文
			45806,         --凛风冲击雕文
		},

		[wzVendor_DW + 0xa0] = { --战士
			43395,         --战斗雕文	
			43396,         --血性狂暴雕文
			43397,         --冲锋雕文
			43398,         --惩戒痛击雕文
			43399,         --雷霆一击雕文
			43400,         --持久追击雕文
			43412,         --嗜血雕文
			43413,         --疾速冲锋雕文
			43414,         --顺劈斩雕文
			43415,         --毁灭打击雕文
			43416,         --斩杀雕文
			43417,         --断筋雕文
			43418,         --英勇打击雕文
			43419,         --援护雕文
			43420,         --野蛮侵犯雕文
			43421,         --致死打击雕文
			43422,         --压制雕文
			43423,         --撕裂雕文
			43424,         --复仇雕文
			43425,         --格挡雕文
			43426,         --破釜沉舟雕文
			43427,         --破甲雕文
			43428,         --横扫攻击雕文
			43429,         --嘲讽雕文
			43430,         --共鸣雕文
			43431,         --乘胜追击雕文
			43432,         --旋风斩雕文
			45790,         --利刃风暴雕文
			45792,         --震荡波雕文
			45793,         --警戒雕文
			45794,         --狂怒回复雕文
			45797,         --盾墙雕文
		},
	},
	Says               = { --随机的话
		"我的货物不打折的哦",
		"慢慢看，我的货物在其他地方买不到。",
		"我有的是时间，你可以慢慢挑选。",
		"我这里有很多高级宝石。",
		"你不买点材料做生意吗？",
		"要来点高级宝石，给装备强化吗？",
		"你应该需要更换你的雕文。",
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

math.randomseed(os.time())

function wzVendor.OnSelect(event, player, unit, sender, intid, code, menu_id) --添加货物
	local text = wzVendor.Says[math.random(1, #wzVendor.Says)] or nil
	if (text) then
		unit:SendUnitSay(text, 0)
	end
	player:GossipComplete() --关闭菜单
	if (intid < 0x10) then
		wzVendor.AddMenu(player, unit, intid)
	else
		local entry = unit:GetEntry()
		VendorRemoveAllItems(entry)
		local goods = wzVendor.GOODS[intid] or {}
		for k, v in pairs(goods) do
			--AddVendorItem(entry, item, maxcount, incrtime, extendedcost )
			--incrtime Combined with maxcount, incrtime tells how often (in seconds) the vendor list is refreshed and the limited Item copies are restocked.
			--extendedcost:Unique cost of an Item, such as conquest points for example.
			AddVendorItem(entry, v, 0, 0, 0)
		end
		player:SendListInventory(unit)
	end
end

RegisterCreatureGossipEvent(wzVendor.NPCID, 1, wzVendor.OnHello)
RegisterCreatureGossipEvent(wzVendor.NPCID, 2, wzVendor.OnSelect)

print(">>Script: wzVendor loaded.")
