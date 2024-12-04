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

 Date: 04/12/2024 19:07:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eluna_teleporter
-- ----------------------------
DROP TABLE IF EXISTS `eluna_teleporter`;
CREATE TABLE `eluna_teleporter`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent` int NOT NULL DEFAULT 0,
  `type` int NOT NULL DEFAULT 1,
  `faction` int NOT NULL DEFAULT -1,
  `icon` int NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `map` int NULL DEFAULT NULL,
  `x` decimal(10, 3) NULL DEFAULT NULL,
  `y` decimal(10, 3) NULL DEFAULT NULL,
  `z` decimal(10, 3) NULL DEFAULT NULL,
  `o` decimal(10, 3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5038 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eluna_teleporter
-- ----------------------------
INSERT INTO `eluna_teleporter` VALUES (1, 0, 1, 1, 0, '部落主城', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (2, 0, 1, 0, 0, '联盟主城', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (4, 0, 1, -1, 0, '东部王国（一）', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (5, 0, 1, -1, 0, '东部王国（二）', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (6, 0, 1, -1, 0, '卡利姆多（一）', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (7, 0, 1, -1, 0, '卡利姆多（二）', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (8, 0, 1, -1, 0, '外域地图', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (9, 0, 1, -1, 0, '诺森德地图', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (11, 0, 1, -1, 0, '经典旧世副本（一）', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (12, 0, 1, -1, 0, '经典旧世副本（二）', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (13, 0, 1, -1, 0, '燃烧的远征副本（一）', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (14, 0, 1, -1, 0, '燃烧的远征副本（二）', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (15, 0, 1, -1, 0, '巫妖王之怒副本（一）', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (16, 0, 1, -1, 0, '巫妖王之怒副本（二）', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (50, 0, 1, -1, 0, 'PvP地图', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `eluna_teleporter` VALUES (106, 1, 2, 1, 2, '奥格瑞玛', 1, 1497.100, -4415.200, 22.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (107, 1, 2, 1, 2, '幽暗城', 0, 1631.300, 239.900, 63.700, 0.000);
INSERT INTO `eluna_teleporter` VALUES (108, 1, 2, 1, 2, '雷霆崖', 1, -1284.500, 140.200, 130.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (109, 1, 2, 1, 2, '银月城', 530, 9371.500, -7277.700, 14.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (110, 1, 1, 1, 2, '沙塔斯城', 530, -1834.000, 5303.000, -12.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (111, 1, 1, 1, 2, '达拉然', 571, 5813.000, 448.000, 658.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (112, 1, 1, 1, 2, '黑锋要塞', 0, 2352.000, -5666.000, 382.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (210, 2, 2, 0, 2, '暴风城', 0, -9003.800, 481.600, 96.600, 0.660);
INSERT INTO `eluna_teleporter` VALUES (211, 2, 2, 0, 2, '铁炉堡', 0, -5048.700, -800.800, 495.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (212, 2, 2, 0, 2, '达纳苏斯', 1, 9945.100, 2616.900, 1316.500, 1.600);
INSERT INTO `eluna_teleporter` VALUES (213, 2, 2, 0, 2, '埃索达', 530, -3995.200, -11864.600, 0.300, 2.000);
INSERT INTO `eluna_teleporter` VALUES (222, 2, 2, 0, 2, '沙塔斯城', 530, -1834.000, 5303.000, -12.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (223, 2, 2, 0, 2, '达拉然', 571, 5813.000, 448.000, 658.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (224, 2, 2, 0, 2, '黑锋要塞', 0, 2352.000, -5666.000, 382.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (400, 4, 2, -1, 2, '艾尔文森林(石碑湖 1-10)', 0, -9118.400, -982.400, 78.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (405, 4, 2, -1, 2, '西部荒野(西部荒野灯塔 10-20)', 0, -10629.000, 1037.000, 34.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (410, 4, 2, -1, 2, '丹莫罗(古博拉采掘场1-10)', 0, -5690.500, -1594.600, 383.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (415, 4, 2, -1, 2, '洛克莫丹(洛克湖10-20)', 0, -4940.400, -3512.300, 299.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (420, 4, 2, -1, 2, '提瑞斯法林地(血色修道院1-10)', 0, 2656.900, -674.000, 112.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (425, 4, 2, -1, 2, '银松森林(芬里斯岛10-20)', 0, 737.000, 755.400, 36.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (430, 4, 2, -1, 2, '永歌森林(托尔瓦萨艾伦1-10)', 530, 8402.400, -7878.900, 164.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (435, 4, 2, -1, 2, '幽魂之地(战斧岭10-20)', 530, 6791.000, -7748.000, 126.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (440, 4, 2, -1, 2, '赤脊山(止水湖 15-25)', 0, -9367.500, -2472.400, 16.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (445, 4, 2, -1, 2, '暮色森林(黎明森林 15-30)', 0, -10560.000, -446.000, 58.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (450, 4, 2, -1, 2, '湿地(失落的舰队20-30)', 0, -2962.900, -995.600, 5.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (455, 4, 2, -1, 2, '希尔斯布莱德丘陵(裂玉矿洞20-30)', 0, -876.900, 126.600, 32.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (500, 5, 2, -1, 2, '阿拉希高地(避难谷地30-40)', 0, -1239.200, -2518.600, 21.700, 0.000);
INSERT INTO `eluna_teleporter` VALUES (505, 5, 2, -1, 2, '奥特兰克山脉(斯坦恩布莱德30-40)', 0, 602.200, -923.000, 166.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (510, 5, 2, -1, 2, '荆棘谷(藏宝海湾30-45)', 0, -14286.100, 554.500, 8.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (515, 5, 2, -1, 2, '荒芜之地(阿戈莫德的营地35-45)', 0, -7164.000, -3360.700, 245.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (520, 5, 2, -1, 2, '悲伤沼泽(农田避难所35-45)', 0, -10050.800, -3697.400, 19.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (525, 5, 2, -1, 2, '辛特兰(隐匿石40-50)', 0, 471.100, -3769.300, 122.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (530, 5, 2, -1, 2, '灼热峡谷(瑟银兄弟会45-50)', 0, -6491.000, -1167.000, 325.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (535, 5, 2, -1, 2, '诅咒之地(污染者高地45-55)', 0, -10886.900, -2935.300, 12.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (540, 5, 2, -1, 2, '西瘟疫之地(索多里尔河51-58)', 0, 1941.000, -2560.000, 61.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (545, 5, 2, -1, 2, '东瘟疫之地(病木林53-60)', 0, 3149.000, -3400.000, 140.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (550, 5, 2, -1, 2, '燃烧平原(灰烬之柱50-58)', 0, -8012.300, -1675.300, 142.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (555, 5, 2, -1, 2, '逆风小径(罪恶谷55-60)', 0, -10811.700, -2047.500, 121.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (600, 6, 2, -1, 2, '杜隆塔尔(回音群岛1-10)', 1, -1067.400, -5341.500, 1.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (605, 6, 2, -1, 2, '莫高雷(刺刃峡谷1-10)', 1, -2947.800, -1247.600, 70.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (610, 6, 2, -1, 2, '贫瘠之地(棘齿城10-20)', 1, -977.000, -3788.000, 5.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (615, 6, 2, -1, 2, '泰拉希尔(神谕林地1-10)', 1, 10664.200, 1930.800, 1334.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (620, 6, 2, -1, 2, '黑海岸(古树之林10-20)', 1, 4829.000, 218.000, 49.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (625, 6, 2, -1, 2, '秘蓝岛(止松要塞1-10)', 530, -3399.900, -12404.400, 18.700, 0.000);
INSERT INTO `eluna_teleporter` VALUES (630, 6, 2, -1, 2, '秘血岛(秘血岗哨10-20)', 530, -1933.000, -11952.000, 57.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (635, 6, 2, -1, 2, '石爪山脉(狂风峭壁15-27)', 1, 1335.600, -148.100, 13.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (640, 6, 2, -1, 2, '灰谷(林中树居18-30)', 1, 2713.600, -1796.400, 207.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (645, 6, 2, -1, 2, '千针石林(沙漠赛道25-35)', 1, -6218.000, -3903.000, -60.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (700, 7, 2, -1, 2, '凄凉之地(科多兽坟场30-40)', 1, -1199.000, 2017.000, 60.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (705, 7, 2, -1, 2, '尘泥沼泽(泥链营地35-45)', 1, -4566.000, -3226.000, 34.700, 0.000);
INSERT INTO `eluna_teleporter` VALUES (710, 7, 2, -1, 2, '塔纳利斯(加基森40-50)', 1, -7182.000, -3776.000, 8.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (715, 7, 2, -1, 2, '菲拉斯(高原荒野40-50)', 1, -5342.500, 1409.700, 31.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (720, 7, 2, -1, 2, '艾萨拉(埃达拉斯废墟45-55)', 1, 3510.600, -5168.800, 98.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (725, 7, 2, -1, 2, '费伍德森林(加德纳尔48-55)', 1, 4925.600, -680.300, 308.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (730, 7, 2, -1, 2, '月光林地(永夜港55-60)', 1, 7790.700, -2402.400, 489.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (735, 7, 2, -1, 2, '冬泉谷(永望镇53-60)', 1, 6724.000, -4650.000, 721.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (740, 7, 2, -1, 2, '安戈洛环形山(马绍尔营地48-55)', 1, -6113.000, -1142.000, -187.700, 0.000);
INSERT INTO `eluna_teleporter` VALUES (745, 7, 2, -1, 2, '希利苏斯(塞纳里奥城堡55-60)', 1, -6811.000, 836.000, 50.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (800, 8, 2, -1, 2, '地狱火半岛(荣耀堡-联盟58-63)', 530, -668.000, 2717.000, 94.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (805, 8, 2, -1, 2, '地狱火半岛(萨尔玛-部落 58-63)', 530, 230.000, 2632.000, 87.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (810, 8, 2, -1, 2, '赞加沼泽(毒蛇湖 60-64)', 530, 500.300, 6952.300, 22.700, 0.000);
INSERT INTO `eluna_teleporter` VALUES (815, 8, 2, -1, 2, '泰罗卡森林(难民商队 62-65)', 530, -2842.800, 5049.900, -17.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (820, 8, 2, -1, 2, '纳格兰(奈辛瓦里狩猎队营地 64-67)', 530, -1458.000, 6342.000, 37.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (825, 8, 2, -1, 2, '刀锋山(卢安荒野 65-68)', 530, 2974.000, 5505.000, 143.700, 0.000);
INSERT INTO `eluna_teleporter` VALUES (830, 8, 2, -1, 2, '虚空风暴(52区 67-70)', 530, 3057.000, 3668.000, 142.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (835, 8, 2, -1, 2, '影月谷(沙塔尔祭坛 67-70)', 530, -3060.000, 744.000, -10.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (840, 8, 2, -1, 2, '奎尔丹纳斯岛(阳湾港70+)', 530, 13012.000, -6908.000, 10.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (900, 9, 2, -1, 2, '北风苔原(琥珀崖68-72)', 571, 3587.000, 5973.000, 136.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (905, 9, 2, -1, 2, '嚎风峡湾(卡玛古68-72)', 571, 785.000, -2887.000, 5.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (910, 9, 2, -1, 2, '龙骨荒野(龙眠神殿71-75)', 571, 3650.000, 247.000, 52.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (915, 9, 2, -1, 2, '灰熊丘陵(蓝天伐木场73-75)', 571, 3991.000, -3178.000, 280.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (920, 9, 2, -1, 2, '祖达克(圣光据点74-76)', 571, 5521.000, -2672.000, 303.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (925, 9, 2, -1, 2, '索拉查盆地(雨声树屋76-78)', 571, 5657.000, 4555.000, -135.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (930, 9, 2, -1, 2, '晶歌森林(风行者观察站-部落77-80)', 571, 5035.000, -519.000, 225.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (935, 9, 2, -1, 2, '晶歌森林(夺日者指挥站-联盟77-80)', 571, 5588.000, -694.000, 206.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (940, 9, 2, -1, 2, '风暴峭壁(布伦希尔达村77-80)', 571, 6923.800, -1537.300, 835.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (945, 9, 2, -1, 2, '冰冠冰川(银色前线基地77-80)', 571, 6164.000, -61.000, 388.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (950, 9, 2, -1, 2, '洛斯加尔登陆点(登陆点)', 571, 10140.400, 953.600, 58.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (955, 9, 2, -1, 2, '冬拥湖(联盟营地77-80)', 571, 5099.000, 2184.000, 365.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (960, 9, 2, -1, 2, '冬拥湖(部落营地77-80)', 571, 5024.000, 3681.000, 362.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1100, 11, 2, -1, 2, '怒焰裂谷(12+)', 1, 1813.500, -4418.600, -18.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1105, 11, 2, -1, 2, '死亡矿井(17+)', 0, -11208.300, 1672.500, 24.700, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1110, 11, 2, -1, 2, '哀嚎洞穴(18+)', 1, -740.600, -2214.200, 16.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1115, 11, 2, -1, 2, '影牙城堡(22+)', 0, -232.800, 1568.300, 76.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1120, 11, 2, -1, 2, '暴风城监狱(23+)', 0, -8764.800, 846.000, 87.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1125, 11, 2, -1, 2, '黑暗深渊(24+)', 1, 4247.700, 745.900, -24.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1130, 11, 2, -1, 2, '剃刀沼泽(29+)', 1, -4464.900, -1666.200, 81.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1135, 11, 2, -1, 2, '诺莫瑞根(30+)', 0, -5163.300, 927.600, 257.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1140, 11, 2, -1, 2, '血色修道院(墓30+,图33+,武36+,教38+)', 0, 2659.900, -676.400, 112.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1145, 11, 2, -1, 2, '剃刀高地(37+)', 1, -4658.100, -2526.300, 81.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1150, 11, 2, -1, 2, '奥达曼(43+)', 0, -6066.000, -2955.000, 209.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1155, 11, 2, -1, 2, '祖尔法拉克(44+)', 1, -6796.000, -2890.000, 8.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1160, 11, 2, -1, 2, '玛拉顿(47+)', 1, -1413.100, 2816.400, 112.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1165, 11, 2, -1, 2, '沉没的神庙(51+)', 0, -10175.000, -3995.000, -112.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1200, 12, 2, -1, 2, '黑石深渊(55+)', 0, -7588.000, -1139.100, 261.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1205, 12, 2, -1, 2, '厄运之槌(东54+,西/北57+)', 1, -4430.400, 1410.900, 132.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1210, 12, 2, -1, 2, '通灵学院(58+)', 0, 1275.000, -2552.000, 89.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1215, 12, 2, -1, 2, '斯坦索姆(58+)', 0, 3391.200, -3404.700, 142.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1220, 12, 2, -1, 2, '黑石塔(60+)', 0, -7622.700, -1224.400, 232.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1222, 12, 2, -1, 2, '祖尔格拉布(团20,物61-68)', 0, -11916.700, -1215.720, 92.289, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1225, 12, 2, -1, 2, '安其拉废墟(团20,物65-70)', 1, -8418.500, 1505.900, 31.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1230, 12, 2, -1, 2, '熔火之心(团40,物66-76)', 0, -7509.800, -1037.300, 180.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1235, 12, 2, -1, 2, '黑翼之巢(团40,物76)', 0, -7664.500, -1217.800, 287.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1245, 12, 2, -1, 2, '安其拉神殿(团40,物78-88)', 1, -8242.700, 1992.000, 129.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1300, 13, 2, -1, 2, '地狱火城墙(59~67)', 530, -361.000, 3073.000, -15.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1305, 13, 2, -1, 2, '鲜血熔炉(60~68)', 530, -295.000, 3151.000, 31.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1310, 13, 2, -1, 2, '破碎大厅(69~70)', 530, -310.100, 3083.300, -3.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1315, 13, 2, -1, 2, '奴隶围栏(61~69)', 530, 728.000, 7015.000, -71.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1320, 13, 2, -1, 2, '幽暗沼泽(62~70)', 530, 780.000, 6760.000, -72.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1325, 13, 2, -1, 2, '蒸汽地窟(69~70)', 530, 817.000, 6931.000, -80.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1330, 13, 2, -1, 2, '法力陵墓(63~70)', 530, -3103.000, 4945.000, -101.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1335, 13, 2, -1, 2, '奥金尼地穴(64~70)', 530, -3362.000, 5186.000, -101.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1340, 13, 2, -1, 2, '赛泰克大厅(66~70)', 530, -3362.000, 4700.000, -101.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1345, 13, 2, -1, 2, '暗影迷宫(69~70)', 530, -3601.000, 4940.000, -101.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1350, 13, 2, -1, 2, '旧希尔斯布莱德丘陵(66~70)', 1, -8350.000, -4059.000, -208.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1355, 13, 2, -1, 2, '黑色沼泽(68~70)', 1, -8763.000, -4187.000, -209.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1360, 13, 2, -1, 2, '能源舰(68~70)', 530, 2870.000, 1553.000, 252.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1400, 14, 2, -1, 2, '禁魔监狱(69~70)', 530, 3311.700, 1333.100, 505.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1405, 14, 2, -1, 2, '生态船(69~70)', 530, 3405.600, 1488.800, 182.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1410, 14, 2, -1, 2, '魔导师平台(70+)', 530, 12891.000, -7323.000, 65.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1415, 14, 2, -1, 2, '卡拉赞(团10,物115)', 0, -11120.000, -2011.000, 47.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1420, 14, 2, -1, 2, '祖阿曼(团10,物128)', 530, 6851.000, -7983.000, 185.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1425, 14, 2, -1, 2, '格鲁尔的巢穴(团25,物125)', 530, 3548.000, 5087.000, 2.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1430, 14, 2, -1, 2, '玛瑟里顿的巢穴(团25,物125)', 530, -316.400, 3093.600, -116.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1435, 14, 2, -1, 2, '毒蛇神殿(团25,物128)', 530, 788.500, 6865.300, -65.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1440, 14, 2, -1, 2, '风暴要塞(团25,物128)', 530, 3087.300, 1373.800, 184.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1445, 14, 2, -1, 2, '海加尔峰(团25,物141)', 1, -8173.800, -4179.900, -166.900, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1450, 14, 2, -1, 2, '黑暗神殿(团25,物141)', 530, -3652.000, 317.400, 36.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1455, 14, 2, -1, 2, '太阳之井高地(团25,物154)', 530, 12560.800, -6774.600, 15.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1500, 15, 2, -1, 2, '乌特加德城堡(68~75)', 571, 1219.000, -4863.000, 41.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1505, 15, 2, -1, 2, '乌特加德之巅(78~80)', 571, 1244.000, -4857.000, 217.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1510, 15, 2, -1, 2, '魔枢(70~75)', 571, 3893.800, 6984.900, 69.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1515, 15, 2, -1, 2, '魔环(78~80)', 571, 3879.000, 6984.000, 106.400, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1520, 15, 2, -1, 2, '艾卓尼鲁布(70~77)', 571, 3678.000, 2166.000, 35.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1525, 15, 2, -1, 2, '安卡雷古代王国(71~78)', 571, 3641.000, 2031.000, 2.600, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1530, 15, 2, -1, 2, '达克萨隆要塞(72~78)', 571, 4775.000, -2033.000, 229.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1535, 15, 2, -1, 2, '古达克(76~80)', 571, 6969.400, -4402.700, 442.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1540, 15, 2, -1, 2, '紫罗兰监狱(73~79)', 571, 5727.000, 545.000, 652.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1545, 15, 2, -1, 2, '岩石大厅(75~80)', 571, 8921.900, -981.800, 1039.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1550, 15, 2, -1, 2, '闪电大厅(78~80)', 571, 9184.400, -1386.400, 1110.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1555, 15, 2, -1, 2, '净化斯坦索姆(78~80)', 1, -8753.000, -4446.000, -199.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1600, 16, 2, -1, 2, '冠军的试炼(79+)', 571, 8585.000, 791.000, 558.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1605, 16, 2, -1, 2, '灵魂洪炉(79+)', 571, 5667.600, 2007.200, 798.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1610, 16, 2, -1, 2, '萨隆矿坑(79+)', 571, 5594.700, 2012.200, 798.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1615, 16, 2, -1, 2, '映像大厅(80+)', 571, 5628.800, 1975.700, 803.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1620, 16, 2, -1, 2, '黑曜石圣殿(团10/25物200)', 571, 3453.000, 262.000, -112.700, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1625, 16, 2, -1, 2, '纳克萨玛斯(团10/25物200)', 571, 3673.900, -1264.600, 243.500, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1630, 16, 2, -1, 2, '永恒之眼(团10/25物213)', 571, 3878.000, 6980.000, 152.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1635, 16, 2, -1, 2, '奥杜尔(团10/25物219)', 571, 9338.200, -1115.600, 1245.200, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1640, 16, 2, -1, 2, '奥妮克希亚的巢穴(团10/25物232)', 1, -4747.200, -3753.300, 49.800, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1645, 16, 2, -1, 2, '十字军的试炼(团10/25物232)', 571, 8515.000, 721.000, 558.300, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1650, 16, 2, -1, 2, '冰冠堡垒(团10/25物251)', 571, 5784.600, 2068.800, 636.100, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1655, 16, 2, -1, 2, '红玉圣殿(团10/25物258)', 571, 3604.000, 192.500, -111.000, 0.000);
INSERT INTO `eluna_teleporter` VALUES (1660, 16, 2, -1, 2, '阿尔卡冯的宝库(团10/25物251)', 571, 5465.000, 2843.000, 418.700, 0.000);
INSERT INTO `eluna_teleporter` VALUES (5033, 50, 2, -1, 2, '古拉巴什竞技场', 0, -13229.000, 226.000, 33.000, 1.000);
INSERT INTO `eluna_teleporter` VALUES (5034, 50, 2, -1, 2, '厄运之槌竞技场', 1, -3669.000, 1094.000, 160.000, 3.000);
INSERT INTO `eluna_teleporter` VALUES (5035, 50, 2, -1, 2, '纳格兰竞技场', 530, -1983.000, 6562.000, 12.000, 2.000);
INSERT INTO `eluna_teleporter` VALUES (5036, 50, 2, -1, 2, '刀锋竞技场', 530, 2910.000, 5976.000, 2.000, 4.000);

SET FOREIGN_KEY_CHECKS = 1;
