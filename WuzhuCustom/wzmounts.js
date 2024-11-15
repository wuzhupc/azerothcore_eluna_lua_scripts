
const dataStr = `重型黑色猛犸战象的缰绳	团队副本	100%	陆地载具	史诗	40	40	43959	61465
重型黑色猛犸战象的缰绳	团队副本	100%	陆地载具	史诗	40	40	44083	61467
重型冰雪猛犸象的缰绳	声望	100%	陆地载具	史诗	40	40	43961	61470
重型冰雪猛犸象的缰绳	声望	100%	陆地载具	史诗	40	40	44086	61469
机械路霸	声望和商业技能	100%	陆地载具	史诗	40	80	41508	55531
机械师的摩托车	声望和商业技能	100%	陆地载具	史诗	40	80	44413	60424
X-53型观光火箭	奖品	310%	飞行载具	史诗	40	60	54860	75973`
const data = dataStr.split('\n').map(item => item.split('\t'))
const data2 = data.map(item => {
    return {
        name: item[0],
        faction: item[1].includes('联盟') ? 0 : (item[1].includes('部落') ? 1 : -1),
        speed: item[2],
        scope: item[3] === '水中' ? 2 : (item[3].includes('飞行') ? 1 : 0),
        level: item[5],
        itemlevel: item[6],
        item: item[7],
        spell: item[8],
        quality: item[4] === '史诗' ? 1 : 0
    }
})
// console.log(data2)
const parent = 15
let startIndex = 0
const resultSql = []
data2.forEach(item => {
    // INSERT INTO `acore_world`.`eluna_wzmounts` (`id`, `parent`, `type`, `icon`, `name`, `speed`, `scope`, `level`, `item`, `spell`, `quality`, `itemlevel`) VALUES (100, 1, 2, 2, 'name', '0%', 2, 20, 1111, 2222, 1, 40);
    resultSql.push(`INSERT INTO \`acore_world\`.\`eluna_wzmounts\` (\`id\`, \`parent\`, \`type\`, \`icon\`, \`name\`, \`speed\`, \`scope\`, \`level\`, \`item\`, \`spell\`, \`quality\`, \`itemlevel\`) VALUES (${parent * 100 + startIndex}, ${parent}, 2, 2, '${item.name}', '${item.speed}', ${item.scope}, ${item.level}, ${item.item}, ${item.spell}, ${item.quality}, ${item.itemlevel});`)
    startIndex++
})
console.log(resultSql.join('\n'))
