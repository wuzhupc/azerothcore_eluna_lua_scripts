-- ----------------------------
-- Table structure for `eluna_teleporter`
-- ----------------------------
DROP TABLE IF EXISTS `eluna_teleporter`;
CREATE TABLE `eluna_teleporter` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `parent` int(5) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '1',
  `faction` int(2) NOT NULL DEFAULT '-1',
  `icon` int(2) NOT NULL DEFAULT '0',
  `name` char(255) NOT NULL DEFAULT '',
  `map` int(5) DEFAULT NULL,
  `x` decimal(10,3) DEFAULT NULL,
  `y` decimal(10,3) DEFAULT NULL,
  `z` decimal(10,3) DEFAULT NULL,
  `o` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of eluna_teleporter
-- ----------------------------
INSERT INTO `eluna_teleporter` (id, parent, type, faction, icon, name, map, x, y, z, o) VALUES 
('1', '0', '1', '1', '0', 'Horde Cities', null, null, null, null, null),
('2', '0', '1', '0', '0', 'Alliance Cities', null, null, null, null, null),
('3', '0', '1', '-1', '0', 'Outlands Locations', null, null, null, null, null),
('4', '0', '1', '-1', '0', 'Northrend Locations', null, null, null, null, null),
('5', '0', '1', '-1', '0', 'PvP Locations', null, null, null, null, null),
('6', '1', '2', '1', '2', 'Orgrimmar', '1', '1503.000', '-4415.500', '22.000', '0.000'),
('7', '1', '2', '1', '2', 'Undercity', '0', '1831.000', '238.500', '61.600', '0.000'),
('8', '1', '2', '1', '2', 'Thunderbluff', '1', '-1278.000', '122.000', '132.000', '0.000'),
('9', '1', '2', '1', '2', 'Silvermoon', '530', '9484.000', '-7294.000', '15.000', '0.000'),
('10', '2', '2', '0', '2', 'Stormwind', '0', '-8905.000', '560.000', '94.000', '0.660'),
('11', '2', '2', '0', '2', 'Ironforge', '0', '-4795.000', '-1117.000', '499.000', '0.000'),
('12', '2', '2', '0', '2', 'Darnassus', '1', '9952.000', '2280.500', '1342.000', '1.600'),
('13', '2', '2', '0', '2', 'The Exodar', '530', '-3863.000', '-11736.000', '-106.000', '2.000'),
('14', '3', '2', '-1', '2', 'Blade\'s Edge Mountains', '530', '1481.000', '6829.000', '107.000', '6.000'),
('15', '3', '2', '-1', '2', 'Hellfire Peninsula', '530', '-249.000', '947.000', '85.000', '2.000'),
('16', '3', '2', '-1', '2', 'Nagrand', '530', '-1769.000', '7150.000', '-9.000', '2.000'),
('17', '3', '2', '-1', '2', 'Netherstorm', '530', '3043.000', '3645.000', '143.000', '2.000'),
('18', '3', '2', '-1', '2', 'Shadowmoon Valley', '530', '-3034.000', '2937.000', '87.000', '5.000'),
('19', '3', '2', '-1', '2', 'Terokkar Forest', '530', '-1942.000', '4689.000', '-2.000', '5.000'),
('20', '3', '2', '-1', '2', 'Zangarmarsh', '530', '-217.000', '5488.000', '23.000', '2.000'),
('21', '3', '2', '-1', '2', 'Shattrath', '530', '-1822.000', '5417.000', '1.000', '3.000'),
('22', '4', '2', '-1', '2', 'Borean Tundra', '571', '3230.000', '5279.000', '47.000', '3.000'),
('23', '4', '2', '-1', '2', 'Crystalsong Forest', '571', '5732.000', '1016.000', '175.000', '3.600'),
('24', '4', '2', '-1', '2', 'Dragonblight', '571', '3547.000', '274.000', '46.000', '1.600'),
('25', '4', '2', '-1', '2', 'Grizzly Hills', '571', '3759.000', '-2672.000', '177.000', '3.000'),
('26', '4', '2', '-1', '2', 'Howling Fjord', '571', '772.000', '-2905.000', '7.000', '5.000'),
('27', '4', '2', '-1', '2', 'Icecrown Glaicer', '571', '8517.000', '676.000', '559.000', '4.700'),
('28', '4', '2', '-1', '2', 'Sholazar Basin', '571', '5571.000', '5739.000', '-75.000', '2.000'),
('29', '4', '2', '-1', '2', 'Storm Peaks', '571', '6121.000', '-1025.000', '409.000', '4.700'),
('30', '4', '2', '-1', '2', 'Wintergrasp', '571', '5135.000', '2840.000', '408.000', '3.000'),
('31', '4', '2', '-1', '2', 'Zul\'Drak', '571', '5761.000', '-3547.000', '387.000', '5.000'),
('32', '4', '2', '-1', '2', 'Dalaran', '571', '5826.000', '470.000', '659.000', '1.400'),
('33', '5', '2', '-1', '2', 'Gurubashi Arena', '0', '-13229.000', '226.000', '33.000', '1.000'),
('34', '5', '2', '-1', '2', 'Dire Maul Arena', '1', '-3669.000', '1094.000', '160.000', '3.000'),
('35', '5', '2', '-1', '2', 'Nagrand Arena', '530', '-1983.000', '6562.000', '12.000', '2.000'),
('36', '5', '2', '-1', '2', 'Blade\'s Edge Arena', '530', '2910.000', '5976.000', '2.000', '4.000');


DELETE FROM `creature_template` WHERE (`entry` = 922001);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(922001, 0, 0, 0, 0, 0, '传送师', '您想到哪?', 'Taxi', 0, 80, 80, 2, 2092, 1, 1, 1.14286, 1, 1, 1, 1, 4, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 0);

UPDATE `creature_template` SET `unit_class` = 1 WHERE (`entry` = 922001);

DELETE FROM `creature_template_model` WHERE (`CreatureID` = 922001);
INSERT INTO `creature_template_model`(`CreatureID`,`Idx`,`CreatureDisplayID`,`DisplayScale`,`Probability`,`VerifiedBuild`) values 
(922001,0,19017,1,1,0);