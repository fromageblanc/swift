/*********************************************
 * Array
 * ******************************************/

/*
 定数配列
*/
let fruit = ["apple","orange","melon","mango"]

// 要素にアクセス
for f in fruit {
    println(f)
}

// 要素数
println(fruit.count)
println(fruit.capacity)
// 最初のインデックス
println(fruit.startIndex) // 0
// 最後のインデックス
println(fruit.endIndex)  // 4  attension ! 要素数？！

/*
 変数配列
*/
var vesetables = ["carot","cucumber","pumpkin","spinach","eggplant"]

vesetables.append("daikon")
println(vesetables)
// 配列をアペンド
let addArr = ["soy"]
vesetables.extend(addArr)
println(vesetables)
// 要素を挿入
vesetables.insert("ginger",atIndex:1)
println(vesetables)
// 降順ソート
sort(&vesetables) { $0 > $1 }
println(vesetables)
// 昇順ソート
sort(&vesetables) { $0 < $1 }
println(vesetables)
// 最後の要素を削除
vesetables.removeLast()
println(vesetables)
// 全て削除
vesetables.removeAll()
println(vesetables)

/*********************************************
 * Dictionary
 * ******************************************/
 var dic:Dictionary = ["Apple":"りんご","Orange":"みかん","Melon":"メロン"]
 
// 要素追加
dic["Mango"] = "マンゴー"
println(dic)
// 要素数
println(dic.count)
// キー配列を取り出す
let keys:Array = Array(dic.keys)
println(keys)
// 値を配列で取り出す
let vals:Array = Array(dic.values)
println(vals)

// 要素Appleがあれば値表示、なければ
if let tmp = dic["Apple"] {
    println(dic["Apple"])
} else {
    dic["Apple"] = "ふじりんご"
}

// 要素Watermelonがあれば表示、なければ作成
if let tmp = dic["Watermelon"] {
    println(dic["Watermelon"])
} else {
    dic.updateValue("すいか",forKey:"Watermelon")
}
println(dic)

/* 実行結果 ----------------------------
apple
orange
melon
mango
4
4
0
4
[carot, cucumber, pumpkin, spinach, eggplant, daikon]
[carot, cucumber, pumpkin, spinach, eggplant, daikon, soy]
[carot, ginger, cucumber, pumpkin, spinach, eggplant, daikon, soy]
[spinach, soy, pumpkin, ginger, eggplant, daikon, cucumber, carot]
[carot, cucumber, daikon, eggplant, ginger, pumpkin, soy, spinach]
[carot, cucumber, daikon, eggplant, ginger, pumpkin, soy]
[]
[Apple: りんご, Orange: みかん, Melon: メロン, Mango: マンゴー]
4
[Apple, Orange, Melon, Mango]
[りんご, みかん, メロン, マンゴー]
Optional("りんご")
[Apple: りんご, Orange: みかん, Melon: メロン, Mango: マンゴー, Watermelon: すいか]
Click here for an interactive Swift lesson
----------------------- */
