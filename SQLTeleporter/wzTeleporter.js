/*
 * @Author: wuzhu
 * @Date: 2024-12-09 17:24:39
 * @LastEditTime: 2024-12-10 18:14:56
 * @FilePath: \Azerothcore\lua_scripts\SQLTeleporter\wzTeleporter.js
 * @Description: 
 * Copyright (c) 2024 by WUZHUPC, All Rights Reserved. 
 */

const dataStr = `冰冠冰川--银白先锋驻地	571	6162	-62	388
冰冠冰川--十字军之颠	571	6403	429	511
冰冠冰川--魔怪之渊	571	7181	693	496
冰冠冰川--死亡之门	571	6923	1338	401
冰冠冰川--铁墙水坝	571	6317	1080	332
冰冠冰川--依米海姆	571	7250	1658	438
冰冠冰川--邪鄙堡	571	6545	1785	633
冰冠冰川--冰冠城塞	571	6148	2233	512
冰冠冰川--黑暗大教堂	571	6279	2463	497
冰冠冰川--惊怖之门	571	6803	2228	581
冰冠冰川--血肉作坊	571	6390	3243	663
冰冠冰川--卓顿海姆	571	7033	4044	540
冰冠冰川--巴拉加德堡垒	571	7062	4253	680
冰冠冰川--死亡高岗	571	7417	4215	316
冰冠冰川--突袭军港口	571	7478	4747	58
冰冠冰川--尼约达村	571	7680	3701	650
冰冠冰川--战伤尖塔	571	7225	3639	811
冰冠冰川--英灵殿	571	8221	3532	628
冰冠冰川--蛮荒岩台	571	8491	3127	589
冰冠冰川--暗影穹殿	571	8346	2749	659
冰冠冰川--荒寂之门	571	8116	1940	504
冰冠冰川--静默警戒	571	7885	718	522`
const removeStr = '冰冠冰川--'
const parentID = 945
let id = 0
const data = dataStr.split('\n').map(item => item.split('\t'))
const data2 = data.map(item => {
    return {
        id: parentID * 100 + (id++),
        parent: parentID,
        type: 2,
        faction: -1,
        icon: 2,
        name: item[0].replace(removeStr, ''),
        map: item[1],
        x: item[2],
        y: item[3],
        z: item[4],
        o: 0
    }
})
// console.log(data2)
const resultSql = []
data2.forEach(item => {
    // INSERT INTO `acore_world`.`eluna_teleporter` (`id`, `parent`, `type`, `faction`, `icon`, `name`, `map`, `x`, `y`, `z`, `o`) VALUES 
    //                                               (4000, 400, 2, -1, 2, 'name', 0, -8910.172852, -143.489899, 81.95047, 0);
    resultSql.push(`INSERT INTO \`acore_world\`.\`eluna_teleporter\` (\`id\`, \`parent\`, \`type\`, \`faction\`, \`icon\`, \`name\`, \`map\`, \`x\`, \`y\`, \`z\`, \`o\`) VALUES (${item.id}, ${item.parent}, ${item.type}, ${item.faction}, ${item.icon}, '${item.name}', ${item.map}, ${item.x}, ${item.y}, ${item.z}, ${item.o});`)
})
console.log(resultSql.join('\n'))
