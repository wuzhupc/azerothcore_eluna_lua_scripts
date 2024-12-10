/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : acore_world

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 10/12/2024 19:02:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eluna_wzspell
-- ----------------------------
DROP TABLE IF EXISTS `eluna_wzspell`;
CREATE TABLE `eluna_wzspell`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent` int NOT NULL DEFAULT 0,
  `type` int NOT NULL DEFAULT 1 COMMENT '1下一级 2使用 0返回',
  `faction` int NOT NULL DEFAULT -1 COMMENT '-1无限制 0 联盟 1部落',
  `icon` int NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '说明',
  `level` int NULL DEFAULT 0 COMMENT '等级要求',
  `spells` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'spell串，多个用,隔开',
  `money` int NOT NULL DEFAULT 0 COMMENT '花费的金额',
  `aura` int NOT NULL DEFAULT 0 COMMENT '0 学习，1 Buff',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7061 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eluna_wzspell
-- ----------------------------
INSERT INTO `eluna_wzspell` VALUES (1, 0, 1, -1, 0, '追踪类', '', 0, NULL, 0, 0);
INSERT INTO `eluna_wzspell` VALUES (2, 0, 1, -1, 0, '被动天赋', '', 0, NULL, 0, 0);
INSERT INTO `eluna_wzspell` VALUES (3, 0, 1, -1, 0, '抗性', '', 0, NULL, 0, 0);
INSERT INTO `eluna_wzspell` VALUES (4, 0, 1, -1, 0, 'BUFF', '', 0, NULL, 0, 0);
INSERT INTO `eluna_wzspell` VALUES (5, 0, 1, -1, 0, '武器技能', '', 0, NULL, 0, 0);
INSERT INTO `eluna_wzspell` VALUES (6, 0, 1, -1, 0, '防具技能等', '', 0, NULL, 0, 0);
INSERT INTO `eluna_wzspell` VALUES (7, 0, 1, -1, 0, '提高致命一击', '', 0, '', 0, 0);
INSERT INTO `eluna_wzspell` VALUES (8, 0, 1, -1, 0, '提高格挡', '', 0, NULL, 0, 0);
INSERT INTO `eluna_wzspell` VALUES (9, 0, 1, -1, 0, '速度&加速&命中', '', 0, NULL, 0, 0);
INSERT INTO `eluna_wzspell` VALUES (10, 0, 1, -1, 0, '特殊技能', '', 0, NULL, 0, 0);
INSERT INTO `eluna_wzspell` VALUES (11, 999, 1, -1, 0, '专业技能', '', 0, NULL, 0, 0);
INSERT INTO `eluna_wzspell` VALUES (101, 1, 2, -1, 2, '跟踪恶魔', '猎人生存技能', 0, '19878', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (102, 1, 2, -1, 2, '跟踪巨人', '猎人生存技能', 0, '19882', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (103, 1, 2, -1, 2, '跟踪龙族', '猎人生存技能', 0, '19879', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (104, 1, 2, -1, 2, '跟踪不死族', '猎人生存技能', 0, '19884', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (105, 1, 2, -1, 2, '跟踪人型生物', '猎人生存技能', 0, '19883', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (106, 1, 2, -1, 2, '元素跟踪', '猎人生存技能', 0, '19880', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (107, 1, 2, -1, 2, '隐身跟踪', '猎人生存技能', 0, '19885', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (108, 1, 2, -1, 2, '追踪野兽', '猎人生存技能', 0, '1494', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (201, 2, 2, -1, 2, '英勇風采', '使你和半徑30碼範圍內所有隊友的命中機率提高1%', 1, '6562', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (202, 2, 2, -1, 2, '耐久', '生命力上限提高5%', 1, '20550', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (203, 2, 2, -1, 2, '再生', '使生命力恢復速度提高10%', 1, '20555', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (204, 2, 2, -1, 2, '野獸殺手', '對野獸的傷害提高5%', 1, '20557', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (206, 2, 2, -1, 2, '堅韌', '抵抗昏迷效果的機率額外提高15%', 1, '20573', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (208, 2, 2, -1, 2, '命令', '獵人和術士寵物的傷害提高5%', 1, '20575', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (209, 2, 2, -1, 2, '迅捷', '閃躲機率提高1%', 1, '20582', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (210, 2, 2, -1, 2, '幽光之魂', '死後變成幽光，移動速度提高50%', 0, '20585', 50000, 0);
INSERT INTO `eluna_wzspell` VALUES (211, 2, 2, -1, 2, '開闊思維', '智力提高5%', 1, '20591', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (213, 2, 2, -1, 2, '人類精魂', '精神提高10%', 1, '20598', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (214, 2, 2, -1, 2, '激靈風采', '使你和半徑30碼範圍內所有小隊隊員的法術命中機率提高1%', 1, '28878', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (215, 2, 2, -1, 2, '寻找财宝', '矮人天赋', 0, '2481', 10000, 0);
INSERT INTO `eluna_wzspell` VALUES (301, 3, 2, -1, 2, '+46五类抗性', '5个组合-被动', 1, '14970,14976,14982,14989,14995', 450000, 0);
INSERT INTO `eluna_wzspell` VALUES (302, 3, 2, -1, 2, '+55所有魔法抗性', '10个组合-被动', 1, '18672,18673,18674,18675,18676,18677,18678,18679,18680,18681', 550000, 0);
INSERT INTO `eluna_wzspell` VALUES (303, 3, 2, -1, 2, '+155所有魔法抗性', '10个组合-被动', 1, '18682,18683,18684,18685,18686,18687,18688,18689,18690,18691', 15500000, 0);
INSERT INTO `eluna_wzspell` VALUES (304, 3, 2, -1, 2, '+104所有魔法抗性', '13个组合-被动', 1, '41668,41666,41662,41664,41721,41728,41822,41819,41843,41839,41880,41883,41893', 10500000, 0);
INSERT INTO `eluna_wzspell` VALUES (305, 3, 2, -1, 2, '+60所有魔法抗性', '4个组合-被动', 1, '41680,41673,41724,41826', 6000000, 0);
INSERT INTO `eluna_wzspell` VALUES (401, 4, 2, -1, 2, '炫彩惊奇', '魔抗+35点，全属性+18点，持续2H', 0, '42735', 10000, 1);
INSERT INTO `eluna_wzspell` VALUES (402, 4, 2, -1, 2, '赞札之速', '奔跑速度+20%，持续2H', 0, '24383', 20000, 1);
INSERT INTO `eluna_wzspell` VALUES (403, 4, 2, -1, 2, '赞达拉之灵', '全属性提高+50，持续2H', 0, '24425', 20000, 1);
INSERT INTO `eluna_wzspell` VALUES (404, 4, 2, -1, 2, '稻草人的祈祷', '经验值和声望+10%，持续2H', 0, '24705', 100000, 1);
INSERT INTO `eluna_wzspell` VALUES (405, 4, 2, -1, 2, '屠龙者的咆哮', '致命等级+140, 攻强+140, 持续2H', 0, '22888', 100000, 1);
INSERT INTO `eluna_wzspell` VALUES (406, 4, 2, -1, 2, '风歌夜曲', '暴击+70, 全属性+15, 持续1H', 0, '15366', 10000, 1);
INSERT INTO `eluna_wzspell` VALUES (445, 4, 2, -1, 2, '心灵防护力场', '对昏迷、沉默和迷惑效果免疫,持续15M', 0, '36480', 1000000, 1);
INSERT INTO `eluna_wzspell` VALUES (501, 5, 2, -1, 2, '单手斧', '', 0, '196', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (502, 5, 2, -1, 2, '双手斧', '', 0, '197', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (503, 5, 2, -1, 2, '单手锤', '', 0, '198', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (504, 5, 2, -1, 2, '双手锤', '', 0, '199', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (505, 5, 2, -1, 2, '长柄武器', '', 0, '200', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (506, 5, 2, -1, 2, '单手剑', '', 0, '201', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (507, 5, 2, -1, 2, '双手剑', '', 0, '202', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (508, 5, 2, -1, 2, '法杖', '', 0, '227', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (509, 5, 2, -1, 2, '弓', '', 0, '264', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (512, 5, 2, -1, 2, '枪', '', 0, '266', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (513, 5, 2, -1, 2, '弩', '', 0, '501', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (514, 5, 2, -1, 2, '匕首', '', 0, '1180', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (515, 5, 2, -1, 2, '投掷武器', '', 0, '2567', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (517, 5, 2, -1, 2, '拳套武器', '', 0, '15590', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (518, 5, 2, -1, 2, '双武器', '', 0, '674', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (519, 5, 2, -1, 2, '泰坦之握', '', 0, '46917', 2000000, 0);
INSERT INTO `eluna_wzspell` VALUES (602, 6, 2, -1, 2, '格档', '', 0, '107', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (603, 6, 2, -1, 2, '徒手攻击', '', 0, '203', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (604, 6, 2, -1, 2, '防御', '', 0, '204', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (606, 6, 2, -1, 2, '板甲', '', 0, '750', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (607, 6, 2, -1, 2, '招架', '', 0, '3127', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (608, 6, 2, -1, 2, '锁甲', '', 0, '8737', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (609, 6, 2, -1, 2, '皮甲', '', 0, '9077', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (612, 6, 2, -1, 2, '布甲', '', 0, '9078', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (613, 6, 2, -1, 2, '盾牌', '', 0, '9116', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (701, 7, 2, -1, 2, '提高致命一击45', '3个组合-被动', 0, '35787,41877,41748', 450000, 0);
INSERT INTO `eluna_wzspell` VALUES (702, 7, 2, -1, 2, '提高致命一击70', '被动', 1, '9405', 700000, 0);
INSERT INTO `eluna_wzspell` VALUES (703, 7, 2, -1, 2, '提高致命一击100', '被动', 0, '17713', 2000000, 0);
INSERT INTO `eluna_wzspell` VALUES (704, 7, 2, -1, 2, '提高致命一击130', '4个组合-被动', 1, '7597,7598,7599,7600', 2500000, 0);
INSERT INTO `eluna_wzspell` VALUES (705, 7, 2, -1, 2, '提高致命一击126', '8个组合-被动', 1, '39418,39433,39509,39545,39548,41862,41787,41772', 5000000, 0);
INSERT INTO `eluna_wzspell` VALUES (706, 7, 2, -1, 2, '提高致命一击伤害3%', '被动', 0, '44797', 3000000, 0);
INSERT INTO `eluna_wzspell` VALUES (707, 7, 2, -1, 2, '提高法术致命一击50%', '被动', 1, '23433', 10000000, 0);
INSERT INTO `eluna_wzspell` VALUES (708, 7, 2, -1, 2, '提高法术致命一击50%', '另一个50%-被动', 1, '23434', 50000000, 0);
INSERT INTO `eluna_wzspell` VALUES (709, 7, 2, -1, 2, '提高法术致命一击42', '被动', 0, '23570', 400000, 0);
INSERT INTO `eluna_wzspell` VALUES (710, 7, 2, -1, 2, '提高法术致命一击45', '3个组合-被动', 1, '41833,41748,35789', 450000, 0);
INSERT INTO `eluna_wzspell` VALUES (711, 7, 2, -1, 2, '提高法术致命一击84', '6个组合-被动', 1, '18384,41854,41850,41041,39420,39422', 1500000, 0);
INSERT INTO `eluna_wzspell` VALUES (713, 7, 2, -1, 2, '提高法术致命一击84', '3个组合-被动', 0, '18382,41676,39881', 10000000, 0);
INSERT INTO `eluna_wzspell` VALUES (803, 8, 2, -1, 2, '提高格挡100', '被动', 0, '18064', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (804, 8, 2, -1, 2, '提高格挡125', '5个组合-被动', 1, '21482,21483,21484,21485,21486', 1250000, 0);
INSERT INTO `eluna_wzspell` VALUES (805, 8, 2, -1, 2, '提高格挡145', '5个组合-被动', 1, '21487,21488,21489,21490,21491', 12000000, 0);
INSERT INTO `eluna_wzspell` VALUES (806, 8, 2, -1, 2, '提高格挡245', '7个组合-被动', 1, '21492,21493,21494,21495,21496,,21497,21498', 25000000, 0);
INSERT INTO `eluna_wzspell` VALUES (807, 8, 2, -1, 2, '提高盾牌格挡值106', '3个组合-被动', 0, '34593,35074,35075', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (808, 8, 2, -1, 2, '提高盾牌格挡值131', '3个组合-被动', 1, '39987,40443,34592', 1500000, 0);
INSERT INTO `eluna_wzspell` VALUES (809, 8, 2, -1, 2, '提高盾牌格挡值105', '2个组合-被动', 1, '35168,39100', 10000000, 0);
INSERT INTO `eluna_wzspell` VALUES (810, 8, 2, -1, 2, '提高盾牌格挡值115', '2个组合-被动', 0, '42038,42106', 20000000, 0);
INSERT INTO `eluna_wzspell` VALUES (903, 9, 2, -1, 2, '游泳速度提高23%', '2个组合-被动', 0, '8747,40513', 200000, 0);
INSERT INTO `eluna_wzspell` VALUES (904, 9, 2, -1, 2, '坐骑速度提高13%', '2个组合-被动', 0, '48402,48383', 500000, 0);
INSERT INTO `eluna_wzspell` VALUES (905, 9, 2, -1, 2, '坐骑速度提高200%', '被动', 1, '27879', 10000000, 0);
INSERT INTO `eluna_wzspell` VALUES (906, 9, 2, -1, 2, '提高命中等级100', '被动', 0, '18066', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (907, 9, 2, -1, 2, '提高命中等级100', '5个组合-被动', 0, '15464,15465,15466,15467,15468', 10000000, 0);
INSERT INTO `eluna_wzspell` VALUES (908, 9, 2, -1, 2, '招架等级提高100', '被动', 0, '18063', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (909, 9, 2, -1, 2, '闪躲等级提高96', '被动', 0, '18062', 1000000, 0);
INSERT INTO `eluna_wzspell` VALUES (910, 9, 2, -1, 2, '远程攻击速度提高20%', '2个组合-被动', 0, '14824,29428', 200000, 0);
INSERT INTO `eluna_wzspell` VALUES (911, 9, 2, -1, 2, '远程攻击速度提高60%', '5个组合-被动', 1, '14825,14826,14827,14828,14829', 3000000, 0);
INSERT INTO `eluna_wzspell` VALUES (912, 9, 2, -1, 2, '远程攻击速度提高60%', '5个组合-被动', 1, '29413,29414,29415,29416,29417', 60000000, 0);
INSERT INTO `eluna_wzspell` VALUES (913, 9, 2, -1, 2, '提高法术穿透力188', '5个组合-被动', 1, '26175,28799,35834,35837,44001', 2000000, 0);
INSERT INTO `eluna_wzspell` VALUES (914, 9, 2, -1, 2, '护甲穿透493', '无视护甲,4个组合-被动', 0, '39927,39925,40258,40555', 500000, 0);
INSERT INTO `eluna_wzspell` VALUES (915, 9, 2, -1, 2, '护甲穿透1400', '无视护甲-被动', 1, '43926', 5000000, 0);
INSERT INTO `eluna_wzspell` VALUES (916, 9, 2, -1, 2, '护甲穿透1342', '无视护甲5个组合-被动', 1, '40679,40226,40230,42061,42157', 10000000, 0);
INSERT INTO `eluna_wzspell` VALUES (1002, 10, 2, -1, 2, '水上行走', '水上行走，持续10M', 0, '11319', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (1004, 10, 2, -1, 2, '潮湿毛巾', '去除一不利法术效果', 0, '7108', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (1006, 10, 2, -1, 2, '元素护甲', '魔抗+200，持续2M', 0, '29718', 2000000, 0);
INSERT INTO `eluna_wzspell` VALUES (1011, 10, 2, -1, 2, '假死', '需要法力', 0, '5384', 200000, 0);
INSERT INTO `eluna_wzspell` VALUES (1013, 10, 2, -1, 2, '潜行', '', 1, '42943', 200000, 0);
INSERT INTO `eluna_wzspell` VALUES (1014, 10, 2, -1, 2, '灵魂石复活', '15分钟内立刻复活', 0, '47883', 100000, 0);
INSERT INTO `eluna_wzspell` VALUES (1015, 10, 2, -1, 2, '变成小鸡！', '不能施法，伤害能力降低66%', 0, '30501', 20000000, 0);
INSERT INTO `eluna_wzspell` VALUES (1020, 10, 2, -1, 2, '重拳先生践踏', '击晕45码范围内所有敌人，持续10S', 1, '6432', 29990000, 0);
INSERT INTO `eluna_wzspell` VALUES (1022, 10, 2, -1, 2, '狂暴', '伤害+900%, 攻速+150%, 持续30M', 1, '47008', 29990000, 0);
INSERT INTO `eluna_wzspell` VALUES (1024, 10, 2, -1, 2, '狂暴', '伤害+500%, 攻速+150%, 持续10M', 1, '62555', 15000000, 0);
INSERT INTO `eluna_wzspell` VALUES (1026, 10, 2, -1, 2, '狂暴', '使目标伤害+500%, 攻速+150%, 持续5M', 1, '46587', 19990000, 0);
INSERT INTO `eluna_wzspell` VALUES (1028, 10, 2, -1, 2, '狂暴', '伤害+100%, 攻速+100%, 持续5M', 1, '41924', 5000000, 0);
INSERT INTO `eluna_wzspell` VALUES (1032, 10, 2, -1, 2, '莫格莱尼之力', '150码友军伤害+2000%, 生命+30,000点, 恢复20%/S HP', 1, '53642', 99990000, 0);
INSERT INTO `eluna_wzspell` VALUES (1036, 10, 2, -1, 2, '防御矩阵', '7码内所有队友受到的伤害降低90% 持续15S, 施法时间1.5S', 1, '65070', 10000000, 0);
INSERT INTO `eluna_wzspell` VALUES (1040, 10, 2, -1, 2, '保护结界', '使得30码内所有队友免疫所有攻击, 持续30S', 1, '42478', 19990000, 0);
INSERT INTO `eluna_wzspell` VALUES (1050, 10, 2, -1, 2, '心灵防护力场', '对昏迷、沉默和迷惑效果免疫,持续15M', 1, '36480', 10000000, 0);
INSERT INTO `eluna_wzspell` VALUES (1055, 10, 2, -1, 2, '奥术屏障', '吸收1W点伤害，恐惧和诱捕免疫，持续4S', 1, '36481', 10000000, 0);

SET FOREIGN_KEY_CHECKS = 1;
