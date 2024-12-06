
const dataStr = `冠军的试炼	8585.0 791.0 558.3 571	80+
灵魂洪炉	5667.6 2007.2 798.0 571	80+
萨隆矿坑	5594.7 2012.2 798.0 571	80+
映像大厅	5628.8 1975.7 803.0 571	80+
黑曜石圣殿	3453.0 262.0 -112.7 571	80+团
纳克萨玛斯	3673.9 -1264.6 243.5 571	80+团
永恒之眼	3878.0 6980.0 152.1 571	80+团
奥杜尔	9338.2 -1115.6 1245.2 571	80+团
奥妮克希亚的巢穴	-4747.2 -3753.3 49.8 1	80+团
十字军的试炼	8515.0 721.0 558.3 571	80+团
冰冠堡垒	5784.6 2068.8 636.1 571	80+团
红玉圣殿	3604.0 192.5 -111.0 571	80+团
阿尔卡冯的宝库	5465.0 2843.0 418.7 571	80+团`
const data = dataStr.split('\n').map(item => item.split('\t'))
const data2 = data.map(item => {
    const xyz = item[1].split(' ')
    return { name: item[0] + '(' + item[2] + ')', x: xyz[0], y: xyz[1], z: xyz[2], o: xyz[3] }
})
// console.log(data2)
const parent = 16
let startIndex = 0
const resultSql = []
data2.forEach(item => {
    const { name, x, y, z, o } = item
    // INSERT INTO `acore_world`.`eluna_teleporter` (`id`, `parent`, `type`, `icon`, `name`, `map`, `x`, `y`, `z`, `o`) VALUES (600, 4, 2, 2, '杜隆塔尔', 1, -1067.4,-5341.5,1.3, 0);
    resultSql.push(`INSERT INTO \`acore_world\`.\`eluna_teleporter\` (\`id\`, \`parent\`, \`type\`, \`icon\`, \`name\`, \`map\`, \`x\`, \`y\`, \`z\`, \`o\`) VALUES (${parent * 100 + startIndex * 5}, ${parent}, 2, 2, '${name}', ${o}, ${x}, ${y}, ${z}, 0);`)
    startIndex++
})
console.log(resultSql.join('\n'))
