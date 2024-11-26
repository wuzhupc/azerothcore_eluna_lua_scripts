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

 Date: 25/11/2024 23:36:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for eluna_wzmounts
-- ----------------------------
DROP TABLE IF EXISTS `eluna_wzmounts`;
CREATE TABLE `eluna_wzmounts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent` int NOT NULL DEFAULT 0,
  `type` int NOT NULL DEFAULT 1 COMMENT '1下一级 2使用 0返回 其他值对应随机取相应type的坐骑',
  `faction` int NOT NULL DEFAULT -1 COMMENT '-1无限制 0 联盟 1部落',
  `icon` int NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `speed` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '速度描述',
  `scope` int NULL DEFAULT 0 COMMENT '适应地形 0陆地 1飞行 2水',
  `level` int NULL DEFAULT NULL COMMENT '等级要求',
  `item` int NULL DEFAULT NULL COMMENT '物品编号',
  `spell` int NULL DEFAULT NULL,
  `quality` int NULL DEFAULT 0 COMMENT '0精良 1史诗',
  `itemlevel` int NULL DEFAULT NULL,
  `order` int NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5037 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eluna_wzmounts
-- ----------------------------
INSERT INTO `eluna_wzmounts` VALUES (1, 0, 2, 1, 2, '迅捷幽灵虎', '100%', 0, 70, 49284, 42777, 1, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (2, 0, 2, 0, 2, '迅捷幽灵虎', '100%', 0, 70, 49284, 42777, 1, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (3, 0, 2, 1, 2, '致命角斗士的冰霜巨龙', '310%', 1, 40, 46171, 65439, 1, 70, 2);
INSERT INTO `eluna_wzmounts` VALUES (4, 0, 2, 0, 2, '奥的灰烬', '310%', 1, 20, 32458, 40192, 1, 70, 2);
INSERT INTO `eluna_wzmounts` VALUES (5, 0, 2, -1, 2, '海龟', '60%', 2, 80, 46109, 64731, 0, 80, 3);
INSERT INTO `eluna_wzmounts` VALUES (6, 0, 1, -1, 0, '陆地坐骑（60%）', NULL, 0, NULL, NULL, NULL, 0, NULL, 4);
INSERT INTO `eluna_wzmounts` VALUES (7, 0, 1, -1, 0, '陆地坐骑（100%）', NULL, 0, NULL, NULL, NULL, 0, NULL, 5);
INSERT INTO `eluna_wzmounts` VALUES (9, 0, 1, -1, 0, '飞行坐骑（150%）', NULL, 0, NULL, NULL, NULL, 0, NULL, 6);
INSERT INTO `eluna_wzmounts` VALUES (11, 0, 1, -1, 0, '飞行坐骑（280%）', NULL, 0, NULL, NULL, NULL, 0, NULL, 7);
INSERT INTO `eluna_wzmounts` VALUES (13, 0, 1, -1, 0, '飞行坐骑（310%）', NULL, 0, NULL, NULL, NULL, 0, NULL, 8);
INSERT INTO `eluna_wzmounts` VALUES (15, 0, 1, -1, 0, '载具', NULL, 0, NULL, NULL, NULL, 0, NULL, 9);
INSERT INTO `eluna_wzmounts` VALUES (17, 0, 7, -1, 2, '随机陆地坐骑', '100%', 0, NULL, NULL, NULL, 0, NULL, 1);
INSERT INTO `eluna_wzmounts` VALUES (18, 0, 13, -1, 2, '随机飞行坐骑', '310%', 0, NULL, NULL, NULL, 0, NULL, 2);
INSERT INTO `eluna_wzmounts` VALUES (600, 6, 2, -1, 2, '魔法鸡蛋', '0%', 0, 40, 46778, 65917, 1, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (601, 6, 2, -1, 2, '魔法猛鸡蛋', '0%', 0, 40, 49290, 65917, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (602, 6, 2, -1, 2, '绿色萤光机械陆行鸟', '60%', 0, 70, 13325, 17458, 0, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (603, 6, 2, -1, 2, '黑马缰绳', '60%', 0, 70, 2411, 470, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (604, 6, 2, -1, 2, '杂色马缰绳', '60%', 0, 70, 2414, 472, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (605, 6, 2, -1, 2, '栗色马缰绳', '60%', 0, 70, 5655, 6648, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (606, 6, 2, -1, 2, '棕马缰绳', '60%', 0, 70, 5656, 458, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (607, 6, 2, -1, 2, '绿色机械陆行鸟', '60%', 0, 70, 13321, 17453, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (608, 6, 2, -1, 2, '未涂色的机械陆行鸟', '60%', 0, 70, 13322, 17454, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (609, 6, 2, -1, 2, '红色机械陆行鸟', '60%', 0, 70, 8563, 10873, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (610, 6, 2, -1, 2, '蓝色机械陆行鸟', '60%', 0, 70, 8595, 10969, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (611, 6, 2, -1, 2, '棕色雷象', '60%', 0, 70, 28481, 34406, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (612, 6, 2, -1, 2, '紫色雷象', '60%', 0, 70, 29743, 35711, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (613, 6, 2, -1, 2, '灰色雷象', '60%', 0, 70, 29744, 35710, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (614, 6, 2, -1, 2, '条纹夜刃豹缰绳', '60%', 0, 70, 8629, 10793, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (615, 6, 2, -1, 2, '条纹霜刃豹缰绳', '60%', 0, 70, 8631, 8394, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (616, 6, 2, -1, 2, '斑点霜刃豹缰绳', '60%', 0, 70, 8632, 10789, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (617, 6, 2, -1, 2, '灰山羊', '60%', 0, 70, 5864, 6777, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (618, 6, 2, -1, 2, '棕山羊', '60%', 0, 70, 5872, 6899, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (619, 6, 2, -1, 2, '白山羊', '60%', 0, 70, 5873, 6898, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (620, 6, 2, -1, 2, '红色骸骨军马', '60%', 0, 70, 13331, 17462, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (621, 6, 2, -1, 2, '蓝色骸骨军马', '60%', 0, 70, 13332, 17463, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (622, 6, 2, -1, 2, '棕色骸骨军马', '60%', 0, 70, 13333, 17464, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (623, 6, 2, -1, 2, '黑色骷髅战马', '60%', 0, 70, 46308, 64977, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (624, 6, 2, -1, 2, '绿色迅猛龙之哨', '60%', 0, 70, 8588, 8395, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (625, 6, 2, -1, 2, '青色迅猛龙之哨', '60%', 0, 70, 8591, 10796, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (626, 6, 2, -1, 2, '紫色迅猛龙之哨', '60%', 0, 70, 8592, 10799, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (627, 6, 2, -1, 2, '灰色科多兽', '60%', 0, 70, 15277, 18989, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (628, 6, 2, -1, 2, '棕色科多兽', '60%', 0, 70, 15290, 18990, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (629, 6, 2, -1, 2, '白色科多兽', '60%', 0, 70, 46100, 64657, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (630, 6, 2, -1, 2, '红色陆行鸟', '60%', 0, 70, 28927, 34795, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (631, 6, 2, -1, 2, '蓝色陆行鸟', '60%', 0, 70, 29220, 35020, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (632, 6, 2, -1, 2, '黑色陆行鸟', '60%', 0, 70, 29221, 35022, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (633, 6, 2, -1, 2, '紫色陆行鸟', '60%', 0, 70, 29222, 35018, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (634, 6, 2, -1, 2, '幽灵虎缰绳', '60%', 0, 70, 33224, 42776, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (635, 6, 2, -1, 2, '棕狼号角', '60%', 0, 70, 1132, 580, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (636, 6, 2, -1, 2, '美酒节赛羊', '60%', 0, 70, 33976, 43899, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (637, 6, 2, -1, 2, '黑狼号角', '60%', 0, 70, 46099, 64658, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (638, 6, 2, -1, 2, '条纹晨刃豹的缰绳', '60%', 0, 70, 47100, 66847, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (639, 6, 2, -1, 2, '鬼灵之虎缰绳', '60%', 0, 70, 49283, 42776, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (640, 6, 2, -1, 2, '暗灰狼号角', '60%', 0, 70, 5665, 6653, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (641, 6, 2, -1, 2, '暗棕狼号角', '60%', 0, 70, 5668, 6654, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (642, 6, 2, -1, 2, '海龟', '60%', 2, 80, 46109, 64731, 0, 80, 0);
INSERT INTO `eluna_wzmounts` VALUES (700, 7, 2, -1, 2, '阿曼尼战熊', '100%', 0, 20, 33809, 43688, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (701, 7, 2, -1, 2, '暗色骑乘塔布羊缰绳', '100%', 0, 40, 28915, 39316, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (702, 7, 2, -1, 2, '蓝色作战塔布羊缰绳', '100%', 0, 40, 29102, 34896, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (703, 7, 2, -1, 2, '白色作战塔布羊缰绳', '100%', 0, 40, 29103, 34897, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (704, 7, 2, -1, 2, '银色作战塔布羊缰绳', '100%', 0, 40, 29104, 34898, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (705, 7, 2, -1, 2, '褐色作战塔布羊缰绳', '100%', 0, 40, 29105, 34899, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (706, 7, 2, -1, 2, '蓝色作战塔布羊缰绳', '100%', 0, 40, 29227, 34896, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (707, 7, 2, -1, 2, '暗色作战塔布羊缰绳', '100%', 0, 40, 29228, 34790, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (708, 7, 2, -1, 2, '银色作战塔布羊缰绳', '100%', 0, 40, 29229, 34898, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (709, 7, 2, -1, 2, '褐色作战塔布羊缰绳', '100%', 0, 40, 29230, 34899, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (710, 7, 2, -1, 2, '白色作战塔布羊缰绳', '100%', 0, 40, 29231, 34897, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (711, 7, 2, -1, 2, '黑色其拉共鸣水晶', '100%', 0, 40, 21176, 26656, 0, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (712, 7, 2, -1, 2, '炽热战马的缰绳', '100%', 0, 40, 30480, 36702, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (713, 7, 2, -1, 2, '迅捷联盟战马', '100%', 0, 40, 49044, 68057, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (714, 7, 2, -1, 2, '迅捷部落战狼', '100%', 0, 40, 49046, 68056, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (715, 7, 2, -1, 2, '冬泉霜刃豹缰绳', '100%', 0, 40, 13086, 17229, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (716, 7, 2, -1, 2, '蓝色骑乘塔布羊缰绳', '100%', 0, 40, 31829, 39315, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (717, 7, 2, -1, 2, '蓝色骑乘塔布羊缰绳', '100%', 0, 40, 31830, 39315, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (718, 7, 2, -1, 2, '银色骑乘塔布羊缰绳', '100%', 0, 40, 31831, 39317, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (719, 7, 2, -1, 2, '银色骑乘塔布羊缰绳', '100%', 0, 40, 31832, 39317, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (720, 7, 2, -1, 2, '褐色骑乘塔布羊缰绳', '100%', 0, 40, 31833, 39318, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (721, 7, 2, -1, 2, '褐色骑乘塔布羊缰绳', '100%', 0, 40, 31834, 39318, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (722, 7, 2, -1, 2, '白色骑乘塔布羊缰绳', '100%', 0, 40, 31835, 39319, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (723, 7, 2, -1, 2, '白色骑乘塔布羊缰绳', '100%', 0, 40, 31836, 39319, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (724, 7, 2, -1, 2, '冰雪猛犸象的缰绳', '100%', 0, 40, 43958, 59799, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (725, 7, 2, -1, 2, '冰雪猛犸象的缰绳', '100%', 0, 40, 44080, 59797, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (726, 7, 2, -1, 2, '毒皮暴掠龙哨', '100%', 0, 40, 46102, 64659, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (727, 7, 2, -1, 2, '蓝色其拉共鸣水晶', '100%', 0, 40, 21218, 25953, 0, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (728, 7, 2, -1, 2, '红色其拉共鸣水晶', '100%', 0, 40, 21321, 26054, 0, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (729, 7, 2, -1, 2, '绿色其拉共鸣水晶', '100%', 0, 40, 21323, 26056, 0, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (730, 7, 2, -1, 2, '黄色其拉共鸣水晶', '100%', 0, 40, 21324, 26055, 0, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (731, 7, 2, -1, 2, '死亡军马的缰绳', '100%', 0, 40, 13335, 17481, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (732, 7, 2, -1, 2, '乌鸦之神的缰绳', '100%', 0, 40, 32768, 41252, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (733, 7, 2, -1, 2, '迅捷白色陆行鸟', '100%', 0, 40, 35513, 46628, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (734, 7, 2, -1, 2, '黑色战熊的缰绳', '100%', 0, 40, 44223, 60118, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (735, 7, 2, -1, 2, '黑色战熊的缰绳', '100%', 0, 40, 44224, 60119, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (736, 7, 2, -1, 2, '白色北极熊的缰绳', '100%', 0, 40, 43962, 54753, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (737, 7, 2, -1, 2, '拉扎什迅猛龙', '100%', 0, 40, 19872, 24242, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (738, 7, 2, -1, 2, '迅捷祖利安猛虎', '100%', 0, 40, 19902, 24252, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (739, 7, 2, -1, 2, '黑色战驹缰绳', '100%', 0, 40, 18241, 22717, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (740, 7, 2, -1, 2, '黑色作战机械陆行鸟', '100%', 0, 40, 18243, 22719, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (741, 7, 2, -1, 2, '黑色战羊', '100%', 0, 40, 18244, 22720, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (742, 7, 2, -1, 2, '雷矛军用坐骑', '100%', 0, 40, 19030, 23510, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (743, 7, 2, -1, 2, '黑色作战雷象的缰绳', '100%', 0, 40, 35906, 48027, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (744, 7, 2, -1, 2, '迅捷褐色马', '100%', 0, 40, 18776, 23227, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (745, 7, 2, -1, 2, '迅捷棕马', '100%', 0, 40, 18777, 23229, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (746, 7, 2, -1, 2, '迅捷白马', '100%', 0, 40, 18778, 23228, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (747, 7, 2, -1, 2, '迅捷绿色机械陆行鸟', '100%', 0, 40, 18772, 23225, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (748, 7, 2, -1, 2, '迅捷白色机械陆行鸟', '100%', 0, 40, 18773, 23223, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (749, 7, 2, -1, 2, '迅捷黄色机械陆行鸟', '100%', 0, 40, 18774, 23222, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (750, 7, 2, -1, 2, '重型蓝色雷象', '100%', 0, 40, 29745, 35713, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (751, 7, 2, -1, 2, '重型绿色雷象', '100%', 0, 40, 29746, 35712, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (752, 7, 2, -1, 2, '重型紫色雷象', '100%', 0, 40, 29747, 35714, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (753, 7, 2, -1, 2, '迅捷霜刃豹缰绳', '100%', 0, 40, 18766, 23221, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (754, 7, 2, -1, 2, '迅捷雾刃豹缰绳', '100%', 0, 40, 18767, 23219, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (755, 7, 2, -1, 2, '迅捷雷刃豹缰绳', '100%', 0, 40, 18902, 23338, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (756, 7, 2, -1, 2, '迅捷白山羊', '100%', 0, 40, 18785, 23240, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (757, 7, 2, -1, 2, '迅捷棕山羊', '100%', 0, 40, 18786, 23238, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (758, 7, 2, -1, 2, '迅捷灰山羊', '100%', 0, 40, 18787, 23239, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (759, 7, 2, -1, 2, '迅捷美酒节赛羊', '100%', 0, 40, 33977, 43900, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (760, 7, 2, -1, 2, '大型美酒节科多兽', '100%', 0, 40, 37828, 49379, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (761, 7, 2, -1, 2, '黑色战狼号角', '100%', 0, 40, 18245, 22724, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (762, 7, 2, -1, 2, '黑色战斗迅猛龙之哨', '100%', 0, 40, 18246, 22721, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (763, 7, 2, -1, 2, '黑色作战科多兽', '100%', 0, 40, 18247, 22718, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (764, 7, 2, -1, 2, '红色骷髅战马', '100%', 0, 40, 18248, 22722, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (765, 7, 2, -1, 2, '霜狼嗥叫者的号角', '100%', 0, 40, 19029, 23509, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (766, 7, 2, -1, 2, '绿色骸骨军马', '100%', 0, 40, 13334, 17465, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (767, 7, 2, -1, 2, '紫色骷髅战马', '100%', 0, 40, 18791, 23246, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (768, 7, 2, -1, 2, '迅捷棕狼号角', '100%', 0, 40, 18796, 23250, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (769, 7, 2, -1, 2, '迅捷森林狼号角', '100%', 0, 40, 18797, 23251, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (770, 7, 2, -1, 2, '迅捷灰狼号角', '100%', 0, 40, 18798, 23252, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (771, 7, 2, -1, 2, '迅捷蓝色迅猛龙', '100%', 0, 40, 18788, 23241, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (772, 7, 2, -1, 2, '迅捷绿色迅猛龙', '100%', 0, 40, 18789, 23242, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (773, 7, 2, -1, 2, '迅捷橙色迅猛龙', '100%', 0, 40, 18790, 23243, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (774, 7, 2, -1, 2, '大型白色科多兽', '100%', 0, 40, 18793, 23247, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (775, 7, 2, -1, 2, '大型棕色科多兽', '100%', 0, 40, 18794, 23249, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (776, 7, 2, -1, 2, '大型灰色科多兽', '100%', 0, 40, 18795, 23248, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (777, 7, 2, -1, 2, '迅捷粉色陆行鸟', '100%', 0, 40, 28936, 33660, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (778, 7, 2, -1, 2, '迅捷绿色陆行鸟', '100%', 0, 40, 29223, 35025, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (779, 7, 2, -1, 2, '迅捷紫色陆行鸟', '100%', 0, 40, 29224, 35027, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (780, 7, 2, -1, 2, '迅捷幽灵虎缰绳', '100%', 0, 40, 33225, 42777, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (781, 7, 2, -1, 2, '上古霜刃豹缰绳', '100%', 0, 40, 12302, 16056, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (782, 7, 2, -1, 2, '夜刃豹缰绳', '100%', 0, 40, 12303, 16055, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (783, 7, 2, -1, 2, '赤狼号角', '100%', 0, 40, 12330, 16080, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (784, 7, 2, -1, 2, '冰狼号角', '100%', 0, 40, 12351, 16081, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (785, 7, 2, -1, 2, '白马缰绳', '100%', 0, 40, 12353, 16083, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (786, 7, 2, -1, 2, '褐色马缰绳', '100%', 0, 40, 12354, 16082, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (787, 7, 2, -1, 2, '白色迅猛龙之哨', '100%', 0, 40, 13317, 17450, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (788, 7, 2, -1, 2, '白色机械陆行鸟B型', '100%', 0, 40, 13326, 15779, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (789, 7, 2, -1, 2, '冰蓝色机械陆行鸟A型', '100%', 0, 40, 13327, 17459, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (790, 7, 2, -1, 2, '黑山羊', '100%', 0, 40, 13328, 17461, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (791, 7, 2, -1, 2, '霜山羊', '100%', 0, 40, 13329, 17460, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (792, 7, 2, -1, 2, '绿色科多兽', '100%', 0, 40, 15292, 18991, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (793, 7, 2, -1, 2, '蓝色科多兽', '100%', 0, 40, 15293, 18992, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (794, 7, 2, -1, 2, '黑色军用座虎缰绳', '100%', 0, 40, 18242, 22723, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (795, 7, 2, -1, 2, '黑色军用机械陆行鸟', '100%', 0, 40, 29465, 22719, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (796, 7, 2, -1, 2, '黑色军用科多兽', '100%', 0, 40, 29466, 22718, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (797, 7, 2, -1, 2, '黑色战羊', '100%', 0, 40, 29467, 22720, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (798, 7, 2, -1, 2, '黑色军用战马缰绳', '100%', 0, 40, 29468, 22717, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (799, 7, 2, -1, 2, '黑色军用座狼号角', '100%', 0, 40, 29469, 22724, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (800, 7, 2, -1, 2, '红色军用骷髅战马', '100%', 0, 40, 29470, 22722, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (801, 7, 2, -1, 2, '黑色军用座虎缰绳', '100%', 0, 40, 29471, 22723, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (802, 7, 2, -1, 2, '黑色军用迅猛龙哨', '100%', 0, 40, 29472, 22721, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (803, 7, 2, -1, 2, '迅捷作战陆行鸟', '100%', 0, 40, 34129, 35028, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (804, 7, 2, -1, 2, '迅捷斑马', '100%', 0, 40, 37719, 49322, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (805, 7, 2, -1, 2, '大战熊', '100%', 0, 40, 38576, 51412, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (806, 7, 2, -1, 2, '黑色猛犸战象的缰绳', '100%', 0, 40, 43956, 59785, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (807, 7, 2, -1, 2, '黑色猛犸战象的缰绳', '100%', 0, 40, 44077, 59788, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (808, 7, 2, -1, 2, '装甲棕熊的缰绳', '100%', 0, 40, 44225, 60114, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (809, 7, 2, -1, 2, '装甲棕熊的缰绳', '100%', 0, 40, 44226, 60116, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (810, 7, 2, -1, 2, '长毛猛犸象的缰绳', '100%', 0, 40, 44230, 59791, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (811, 7, 2, -1, 2, '长毛猛犸象的缰绳', '100%', 0, 40, 44231, 59793, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (812, 7, 2, -1, 2, '旅行者的苔原猛犸象缰绳', '100%', 0, 40, 44234, 61447, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (813, 7, 2, -1, 2, '旅行者的苔原猛犸象缰绳', '100%', 0, 40, 44235, 61425, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (814, 7, 2, -1, 2, '暴风城战马', '100%', 0, 40, 45125, 63232, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (815, 7, 2, -1, 2, '铁炉堡战羊', '100%', 0, 40, 45586, 63636, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (816, 7, 2, -1, 2, '诺莫瑞根机械陆行鸟', '100%', 0, 40, 45589, 63638, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (817, 7, 2, -1, 2, '埃索达雷象', '100%', 0, 40, 45590, 63639, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (818, 7, 2, -1, 2, '达纳苏斯夜刃豹', '100%', 0, 40, 45591, 63637, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (819, 7, 2, -1, 2, '雷霆崖科多兽', '100%', 0, 40, 45592, 63641, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (820, 7, 2, -1, 2, '暗矛迅猛龙', '100%', 0, 40, 45593, 63635, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (821, 7, 2, -1, 2, '奥格瑞玛战狼', '100%', 0, 40, 45595, 63640, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (822, 7, 2, -1, 2, '银月城陆行鸟', '100%', 0, 40, 45596, 63642, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (823, 7, 2, -1, 2, '被遗忘者战马', '100%', 0, 60, 45597, 63643, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (824, 7, 2, -1, 2, '迅捷紫色迅猛龙', '100%', 0, 60, 46743, 65644, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (825, 7, 2, -1, 2, '迅捷月刃豹', '100%', 0, 60, 46744, 65638, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (826, 7, 2, -1, 2, '重型红色雷象', '100%', 0, 60, 46745, 65637, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (827, 7, 2, -1, 2, '白骨战马', '100%', 0, 60, 46746, 65645, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (828, 7, 2, -1, 2, '涡轮机械陆行鸟', '100%', 0, 60, 46747, 65642, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (829, 7, 2, -1, 2, '迅捷紫色战羊', '100%', 0, 60, 46748, 65643, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (830, 7, 2, -1, 2, '迅捷紫鬃战狼', '100%', 0, 60, 46749, 65646, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (831, 7, 2, -1, 2, '大型金色科多兽', '100%', 0, 60, 46750, 65641, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (832, 7, 2, -1, 2, '迅捷红色陆行鸟', '100%', 0, 60, 46751, 65639, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (833, 7, 2, -1, 2, '迅捷灰色战马', '100%', 0, 60, 46752, 65640, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (834, 7, 2, -1, 2, '大型金色科多兽', '100%', 0, 60, 46755, 65641, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (835, 7, 2, -1, 2, '重型红色雷象', '100%', 0, 60, 46756, 65637, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (836, 7, 2, -1, 2, '迅捷紫鬃战狼', '100%', 0, 60, 46757, 65646, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (837, 7, 2, -1, 2, '迅捷灰色战马', '100%', 0, 60, 46758, 65640, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (838, 7, 2, -1, 2, '迅捷月刃豹', '100%', 0, 70, 46759, 65638, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (839, 7, 2, -1, 2, '迅捷紫色迅猛龙', '100%', 0, 70, 46760, 65644, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (840, 7, 2, -1, 2, '迅捷红色陆行鸟', '100%', 0, 70, 46761, 65639, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (841, 7, 2, -1, 2, '迅捷紫色战羊', '100%', 0, 70, 46762, 65643, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (842, 7, 2, -1, 2, '涡轮机械陆行鸟', '100%', 0, 70, 46763, 65642, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (843, 7, 2, -1, 2, '白骨战马', '100%', 0, 70, 46764, 65645, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (844, 7, 2, -1, 2, '奎尔多雷战马', '100%', 0, 70, 46815, 66090, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (845, 7, 2, -1, 2, '夺日者陆行鸟', '100%', 0, 70, 46816, 66091, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (846, 7, 2, -1, 2, '赭色白骨战马', '100%', 0, 70, 47101, 66846, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (847, 7, 2, -1, 2, '银色军马', '100%', 0, 70, 47179, 66906, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (848, 7, 2, -1, 2, '银色战马', '100%', 0, 70, 47180, 67466, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (849, 7, 2, -1, 2, '白色十字军战马', '100%', 0, 70, 49096, 68187, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (850, 7, 2, -1, 2, '黑色十字军战马', '100%', 0, 70, 49098, 68188, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (851, 7, 2, -1, 2, '大型战斗熊', '100%', 0, 70, 49282, 51412, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (852, 7, 2, -1, 2, '迅捷鬼灵之虎缰绳', '100%', 0, 70, 49284, 42777, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (853, 7, 2, -1, 2, '白色蓬毛犀牛', '100%', 0, 70, 54068, 74918, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (854, 7, 2, -1, 2, '红色迅猛龙之哨', '100%', 0, 70, 8586, 16084, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (855, 7, 2, -1, 2, '赤红死亡战骑缰绳', '100%', 0, 70, 52200, 73313, 1, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (856, 7, 2, -1, 2, '暴雪巨熊', '100%', 0, 70, 43599, 58983, 0, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (900, 9, 2, -1, 2, '飞行器控制台', '150%', 1, 40, 34060, 44153, 0, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (901, 9, 2, -1, 2, '金色狮鹫', '150%', 1, 40, 25470, 32235, 0, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (902, 9, 2, -1, 2, '黑色狮鹫', '150%', 1, 40, 25471, 32239, 0, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (903, 9, 2, -1, 2, '雪色狮鹫', '150%', 1, 40, 25472, 32240, 0, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (904, 9, 2, -1, 2, '茶色驭风者', '150%', 1, 40, 25474, 32243, 0, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (905, 9, 2, -1, 2, '蓝色驭风者', '150%', 1, 40, 25475, 32244, 0, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (906, 9, 2, -1, 2, '绿色驭风者', '150%', 1, 40, 25476, 32245, 0, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (907, 9, 2, -1, 2, 'X-51虚空火箭', '150%', 1, 40, 35225, 46197, 0, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (908, 9, 2, -1, 2, 'X-51型虚空火箭', '150%', 1, 40, 49285, 46197, 0, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (909, 9, 2, -1, 2, '飞行扫帚', '150%', 1, 40, 33176, 42667, 0, 1, 0);
INSERT INTO `eluna_wzmounts` VALUES (910, 9, 2, -1, 2, '飞毯', '150%', 1, 40, 44554, 61451, 0, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (911, 9, 2, -1, 2, '魔法扫帚', '150%', 1, 70, 33183, 42680, 0, 1, 0);
INSERT INTO `eluna_wzmounts` VALUES (912, 9, 2, -1, 2, '魔法扫帚', '150%', 1, 70, 37011, 47977, 0, 1, 0);
INSERT INTO `eluna_wzmounts` VALUES (1100, 11, 2, -1, 2, '涡轮加速飞行器控制台', '280%', 1, 10, 34061, 44151, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1101, 11, 2, -1, 2, '华丽的飞毯', '280%', 1, 10, 44558, 61309, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1102, 11, 2, -1, 2, '寒霜飞毯', '280%', 1, 20, 54797, 75596, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1103, 11, 2, -1, 2, '天蓝幼龙的缰绳', '280%', 1, 20, 43952, 59567, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1104, 11, 2, -1, 2, '暮光幼龙的缰绳', '280%', 1, 20, 43954, 59571, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1105, 11, 2, -1, 2, '黑色幼龙的缰绳', '280%', 1, 20, 43986, 59650, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1106, 11, 2, -1, 2, '绿色骑乘虚空鳐', '280%', 1, 20, 32314, 39798, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1107, 11, 2, -1, 2, '紫色骑乘虚空鳐', '280%', 1, 20, 32316, 39801, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1108, 11, 2, -1, 2, '红色骑乘虚空鳐', '280%', 1, 20, 32317, 39800, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1109, 11, 2, -1, 2, '银色骑乘虚空鳐', '280%', 1, 20, 32318, 39802, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1110, 11, 2, -1, 2, '蓝色骑乘虚空鳐', '280%', 1, 20, 32319, 39803, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1111, 11, 2, -1, 2, '黑色灵翼幼龙的缰绳', '280%', 1, 20, 32857, 41513, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1112, 11, 2, -1, 2, '青色灵翼幼龙的缰绳', '280%', 1, 20, 32858, 41514, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1113, 11, 2, -1, 2, '蓝色灵翼幼龙的缰绳', '280%', 1, 20, 32859, 41515, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1114, 11, 2, -1, 2, '紫色灵翼幼龙的缰绳', '280%', 1, 20, 32860, 41516, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1115, 11, 2, -1, 2, '绿色灵翼幼龙的缰绳', '280%', 1, 20, 32861, 41517, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1116, 11, 2, -1, 2, '红色灵翼幼龙的缰绳', '280%', 1, 20, 32862, 41518, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1117, 11, 2, -1, 2, '塞纳里奥作战角鹰兽', '280%', 1, 20, 33999, 43927, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1118, 11, 2, -1, 2, '红色幼龙的缰绳', '280%', 1, 20, 43955, 59570, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1119, 11, 2, -1, 2, '绿色始祖幼龙的缰绳', '280%', 1, 20, 44707, 61294, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1120, 11, 2, -1, 2, '银色角鹰兽', '280%', 1, 20, 45725, 63844, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1121, 11, 2, -1, 2, '银色盟约角鹰兽', '280%', 1, 20, 46813, 66087, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1122, 11, 2, -1, 2, '夺日者龙鹰', '280%', 1, 20, 46814, 66088, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1123, 11, 2, -1, 2, '青铜幼龙的缰绳', '280%', 1, 20, 43951, 59569, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1124, 11, 2, -1, 2, '蓝色幼龙的缰绳', '280%', 1, 20, 43953, 59568, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1125, 11, 2, -1, 2, '蓝色始祖幼龙的缰绳', '280%', 1, 20, 44151, 59996, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1126, 11, 2, -1, 2, '红色始祖幼龙的缰绳', '280%', 1, 20, 44160, 59961, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1127, 11, 2, -1, 2, '白色幼龙的缰绳', '280%', 1, 20, 44178, 60025, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1128, 11, 2, -1, 2, '红色龙鹰坐骑', '280%', 1, 20, 44842, 61997, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1129, 11, 2, -1, 2, '蓝色龙鹰坐骑', '280%', 1, 20, 44843, 61996, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1130, 11, 2, -1, 2, '迷失始祖幼龙的缰绳', '280%', 1, 20, 44168, 60002, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1131, 11, 2, -1, 2, '迅捷蓝色狮鹫', '280%', 1, 20, 25473, 32242, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1132, 11, 2, -1, 2, '迅捷红色狮鹫', '280%', 1, 20, 25527, 32289, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1133, 11, 2, -1, 2, '迅捷绿色狮鹫', '280%', 1, 20, 25528, 32290, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1134, 11, 2, -1, 2, '迅捷紫色狮鹫', '280%', 1, 30, 25529, 32292, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1135, 11, 2, -1, 2, '迅捷红色驭风者', '280%', 1, 40, 25477, 32246, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1136, 11, 2, -1, 2, '迅捷绿色驭风者', '280%', 1, 40, 25531, 32295, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1137, 11, 2, -1, 2, '迅捷黄色驭风者', '280%', 1, 40, 25532, 32296, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1138, 11, 2, -1, 2, '迅捷紫色驭风者', '280%', 1, 40, 25533, 32297, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1139, 11, 2, -1, 2, 'X-51虚空火箭特别加强版', '280%', 1, 40, 35226, 46199, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1140, 11, 2, -1, 2, 'X-51型虚空火箭极限版', '280%', 1, 40, 49286, 46199, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1141, 11, 2, -1, 2, '迅捷飞行扫帚', '280%', 1, 40, 33182, 42668, 1, 1, 0);
INSERT INTO `eluna_wzmounts` VALUES (1142, 11, 2, -1, 2, '迅捷月布飞毯', '280%', 1, 40, 44555, 61442, 1, 80, 0);
INSERT INTO `eluna_wzmounts` VALUES (1143, 11, 2, -1, 2, '迅捷魔焰飞毯', '280%', 1, 40, 44556, 61446, 1, 80, 0);
INSERT INTO `eluna_wzmounts` VALUES (1144, 11, 2, -1, 2, '装甲雪色狮鹫', '280%', 1, 40, 44689, 61229, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1145, 11, 2, -1, 2, '装甲蓝色驭风者', '280%', 1, 40, 44690, 61230, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1146, 11, 2, -1, 2, '炽热的角鹰兽', '280%', 1, 40, 54069, 74856, 1, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (1147, 11, 2, -1, 2, '黑锋骸骨狮鹫', '280%', 1, 40, 40775, 54729, 1, 60, 0);
INSERT INTO `eluna_wzmounts` VALUES (1148, 11, 2, -1, 2, '迅捷魔法扫帚', '280%', 1, 40, 33184, 42668, 1, 1, 0);
INSERT INTO `eluna_wzmounts` VALUES (1149, 11, 2, -1, 2, '无头骑士的缰绳', '280%', 1, 70, 37012, 48025, 1, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (1300, 13, 2, -1, 2, '大型爱心火箭', '310%', 1, 0, 50250, 71342, 1, 80, 0);
INSERT INTO `eluna_wzmounts` VALUES (1301, 13, 2, -1, 2, '奥的灰烬', '310%', 1, 20, 32458, 40192, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1302, 13, 2, -1, 2, '米米尔隆的徽记', '310%', 1, 20, 45693, 63796, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1303, 13, 2, -1, 2, '奥妮克希亚座龙缰绳', '310%', 1, 20, 49636, 69395, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1304, 13, 2, -1, 2, '黑色始祖幼龙的缰绳', '310%', 1, 20, 44164, 59976, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1305, 13, 2, -1, 2, '瘟疫始祖幼龙的缰绳', '310%', 1, 20, 44175, 60021, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1306, 13, 2, -1, 2, '紫色始祖幼龙的缰绳', '310%', 1, 20, 44177, 60024, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1307, 13, 2, -1, 2, '铁箍始祖幼龙的缰绳', '310%', 1, 20, 45801, 63956, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1308, 13, 2, -1, 2, '铁锈始祖幼龙的缰绳', '310%', 1, 20, 45802, 63963, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1309, 13, 2, -1, 2, '浴血霜育镇压者缰绳', '310%', 1, 20, 51954, 72808, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1310, 13, 2, -1, 2, '冰锢霜育镇压者缰绳', '310%', 1, 20, 51955, 72807, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1311, 13, 2, -1, 2, '无情角斗士的冰霜巨龙', '310%', 1, 20, 47840, 67336, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1312, 13, 2, -1, 2, '迅捷虚空幼龙', '310%', 1, 40, 30609, 37015, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1313, 13, 2, -1, 2, '残酷角斗士的虚空幼龙', '310%', 1, 40, 34092, 44744, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1314, 13, 2, -1, 2, '复仇角斗士的虚空幼龙', '310%', 1, 40, 37676, 49193, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1315, 13, 2, -1, 2, '野蛮角斗士的虚空幼龙', '310%', 1, 40, 43516, 58615, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1316, 13, 2, -1, 2, '致命角斗士的冰霜巨龙', '310%', 1, 40, 46171, 65439, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1317, 13, 2, -1, 2, '致命角斗士的冰霜巨龙', '310%', 1, 40, 46708, 64927, 1, 70, 0);
INSERT INTO `eluna_wzmounts` VALUES (1318, 13, 2, -1, 2, '无敌缰绳', '310%', 1, 70, 50818, 72286, 1, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (1319, 13, 2, -1, 2, '星穹战马缰绳', '310%', 1, 70, 54811, 75614, 1, 20, 0);
INSERT INTO `eluna_wzmounts` VALUES (1500, 15, 2, -1, 2, '重型黑色猛犸战象的缰绳', '100%', 0, 40, 43959, 61465, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (1501, 15, 2, -1, 2, '重型黑色猛犸战象的缰绳', '100%', 0, 40, 44083, 61467, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (1502, 15, 2, -1, 2, '重型冰雪猛犸象的缰绳', '100%', 0, 40, 43961, 61470, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (1503, 15, 2, -1, 2, '重型冰雪猛犸象的缰绳', '100%', 0, 40, 44086, 61469, 1, 40, 0);
INSERT INTO `eluna_wzmounts` VALUES (1504, 15, 2, -1, 2, '机械路霸', '100%', 0, 40, 41508, 55531, 1, 80, 0);
INSERT INTO `eluna_wzmounts` VALUES (1505, 15, 2, -1, 2, '机械师的摩托车', '100%', 0, 40, 44413, 60424, 1, 80, 0);
INSERT INTO `eluna_wzmounts` VALUES (1506, 15, 2, -1, 2, 'X-53型观光火箭', '310%', 1, 40, 54860, 75973, 1, 60, 0);

SET FOREIGN_KEY_CHECKS = 1;
