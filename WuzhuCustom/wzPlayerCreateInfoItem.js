const maxRace = 11
const classList = [[1, 2, 4, 5, 6, 8, 9],
[1, 3, 4, 6, 7, 9],
[1, 2, 3, 4, 5, 6],
[1, 3, 4, 5, 6, 11],
[1, 4, 5, 6, 8, 9],
[1, 3, 6, 7, 11],
[1, 4, 6, 8, 9],
[1, 3, 4, 5, 6, 7, 8],
[],
[2, 3, 4, 5, 6, 8, 9],
[1, 2, 3, 5, 6, 7, 8]]

const itemIdList = [922002, 922003, 922004]

const resultSql = []
//INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`) VALUES (1, 1, 922001);
for (let raceIndex = 0; raceIndex < maxRace; raceIndex++) {
    const raceClsArr = classList[raceIndex]
    // console.log(raceClsArr)
    for (let clsIndex = 0; clsIndex < raceClsArr.length; clsIndex++) {
        const cls = raceClsArr[clsIndex]
        for (let itemIdIndex = 0; itemIdIndex < itemIdList.length; itemIdIndex++) {
            const itemId = itemIdList[itemIdIndex]
            resultSql.push(`INSERT INTO \`playercreateinfo_item\` (\`race\`, \`class\`, \`itemid\`) VALUES (${raceIndex + 1}, ${cls}, ${itemId});`)
        }
    }
}
console.log(resultSql.join('\n'))
