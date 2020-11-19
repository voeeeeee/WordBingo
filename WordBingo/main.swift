//
//  main.swift
//  WordBingo
//
//  Created by 竹辻篤志 on 2020/11/14.
//

import Foundation

//入力用------------------------------------------------------------
//S×S配列　S=bingoNumber
let bingoNumber = Int(readLine()!)!

//ビンゴの行
var lines = [String]()

//ビンゴの行を列化
var array:[[String]] = [[String]]()

//(i回横へ文字を追加する)をi回縦へ追加する
for i in 0..<bingoNumber {
    lines.append(readLine()!)
    array.append(lines[i].components(separatedBy: " "))
}


//出力用------------------------------------------------------------

//いくつの文字列を呼び出すか入力：N
let pickUpNumber = Int(readLine()!)!

//呼び出す文字列：w
var callString = ""

//配列内の呼ばれた文字を"○"へ変換する関数
func changeArray(){
    //指定回呼び出した文字を記載
    for _ in 0..<pickUpNumber {
        callString = readLine()!
        //        print(callString)
        
        //呼び出した文字を"○"へ変換
        for line in 0..<bingoNumber{
            for row in 0..<bingoNumber {
                if array[line][row] == callString{
                    array[line][row] = "○"
                }
            }
        }
    }
}



//列のビンゴが成立しているか確認する変数
//行のビンゴが成立しているか確認する変数
//右下がりななめのビンゴが成立しているか確認する変数
//左下がりななめのビンゴが成立しているか確認する変数
var judgeRow :Bool?
var judgeLine :Bool?
var judgeDiagonal1 :Bool?
var judgeDiagonal2 :Bool?

//列に何個"○"が存在するかカウントする変数
//列ビンゴが何個成立するかカウントする変数
//行に何個"○"が存在するかカウントする変数
//行ビンゴが何個成立するかカウントする変数
//右下がりななめに"○"が何個成立するかカウントする変数
//左さがりななめに"○"が何個成立するかカウントする変数
var countRow = 0
var countTotalRow = 0
var countLine = 0
var countTotalLine = 0
var countDiagonal1 = 0
var countDiagonal2 = 0

//列ビンゴ成立確認関数
func bingoRowJudge(){
    
    repeatRow :for j in 0 ..< bingoNumber{
        repeatLine:  for i in 0 ..< bingoNumber{
            if array[i][j] != "○"{
                continue
            }
            countRow += 1
            if countRow == bingoNumber{
                countTotalRow += 1
                //print("列ビンゴです。")
                continue repeatRow
            }else{
                //print("列ビンゴではありません。")
                continue repeatLine
            }
        }
        //列のカウント初期化
        countRow = 0
    }
    if countTotalRow >= 1{
        judgeRow = true
        //print("縦ビンゴが1つ以上あります。")
    }
}


//行ビンゴ成立確認関数
func bingoLineJudge(){
    
    repeatRow :for i in 0 ..< bingoNumber{
        repeatLine:  for j in 0 ..< bingoNumber{
            if array[i][j] != "○"{
                continue
            }
            countLine += 1
            if countLine == bingoNumber{
                countTotalLine += 1
                //print("行ビンゴです。")
                continue repeatRow
            }else{
                //print("行ビンゴではありません。")
                continue repeatLine
            }
        }
        //行のカウント初期化
        countLine = 0
    }
    if countTotalLine >= 1{
        judgeLine = true
        //print("横ビンゴが1つ以上あります。")
    }
}


//ななめビンゴ成立確認関数
func bingoDiagonalJudge(){
    
    //右下がりななめ成立確認
    for i in 0 ..< bingoNumber {
        if array[i][i] != "○"{
            continue
        }
        countDiagonal1 += 1
        if countDiagonal1 == bingoNumber{
            judgeDiagonal1 = true
            //print("右さがりななめビンゴです。")
            
        }
    }
    
    //左下がりななめ成立確認
    for i in (0..<bingoNumber).reversed(){
        if array[i][(bingoNumber-1)-i] != "○"{
            continue
        }
        countDiagonal2 += 1
        if countDiagonal2 == bingoNumber{
            judgeDiagonal2 = true
            //print("左さがりななめビンゴです。")
        }
    }
    
}

//S×Sビンゴ内にビンゴがあるかどうかの判断する関数
func judgement(){
    if judgeLine == true||judgeRow == true||judgeDiagonal1 == true||judgeDiagonal2 == true {
        print("yes")
    }else{
        print("no")
    }
    
}

//配列内の指定された文字を○へ変換する関数呼び出し
changeArray()
//縦ビンゴ成立確認関数
bingoRowJudge()

//横ビンゴ成立確認関数
bingoLineJudge()

//ななめビンゴ成立確認関数呼び出し
bingoDiagonalJudge()

//ビンゴが成立するか判断し、成立ならyes 不成立ならnoを出す関数
judgement()


//end------------------------------------------------------------

//↓参考-----------------------------------------------------------

//計算時間計測関数
//funcTime("self.test", action: {
//    //配列内の指定された文字を○へ変換する関数
//    changeArray()
//    //縦ビンゴ成立確認関数
//    bingoRowJudge()
//
//    //横ビンゴ成立確認関数
//    bingoLineJudge()
//
//    //ななめビンゴ成立確認関数
//    bingoDiagonalJudge()
//
//    //ビンゴが成立するか判断し、成立ならyes 不成立ならnoを出す関数
//    judgement()
//  })
//
//
//func funcTime(_ log: String, action: () -> Void) {
//        let startDate = Date()
//        action()
//        let endDate = Date()
//        print("\(log) \(endDate.timeIntervalSince(startDate))")
//}
