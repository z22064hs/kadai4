#!/bin/bash

#ディレクトリの変数への登録
result="/tmp/z22064hs$$-res"
ans="/tmp/z22064hs$$-ans"
err="/tmp/z22064hs$$-err"
remove="/tmp/z22064hs$$-*"


#関数によるエラー処理
ERROR_EXIT(){
    echo $1 >> $err
    echo $1
    rm $remove
    exit 1
}

#[TEST 101]正常系
testnum='101'; check='引数・自然数正常($1>$2)'
./gcd.sh 11 35 > $result || ERROR_EXIT "[ERR  $testnum] NG $check >> 異常終了"
if [ `grep -c GCD=* $result` == 1 ]; then
    echo "[TEST $testnum] OK $check >> 正常終了"; else
    ERROR_EXIT "[ERR  $testnum] NG $check >> 出力異常"
fi

#[TEST 102]正常系
testnum='102'; check='引数・自然数正常($2>$1)'
./gcd.sh 35 11 > $result || ERROR_EXIT "[ERR  $testnum] NG $check >> 異常終了"
if [ `grep -c GCD=* $result` == 1 ]; then
    echo "[TEST $testnum] OK $check >> 正常終了"; else
    ERROR_EXIT "[ERR  $testnum] NG $check >> 出力異常"
fi

#[TEST 103]正常系
testnum='103'; check='引数・自然数正常($1=$2)'
./gcd.sh 11 11 > $result || ERROR_EXIT "[ERR  $testnum] NG $check >> 異常終了"
if [ `grep -c GCD=* $result` == 1 ]; then
    echo "[TEST $testnum] OK $check >> 正常終了"; else
    ERROR_EXIT "[ERR  $testnum] NG $check >> 出力異常"
fi

#[TEST 201]異常系
testnum='201'; check='引数なし'
./gcd.sh 2> $result && ERROR_EXIT "[ERR  $testnum] NG $check >> 正常終了"
echo '[ERROR 01] 引数は自然数を２つ入力してください。' > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  $testnum] NG $check >> エラーメッセージ相違"
echo "[TEST $testnum] OK $check >> エラー出力終了"

#[TEST 202]異常系
testnum='202'; check='引数１つ'
./gcd.sh 10 2> $result && ERROR_EXIT "[ERR  $testnum] NG $check >> 正常終了"
echo '[ERROR 01] 引数は自然数を２つ入力してください。' > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  $testnum] NG $check >> エラーメッセージ相違"
echo "[TEST $testnum] OK $check >> エラー出力終了"

#[TEST 203]異常系
testnum='203'; check='引数３つ'
./gcd.sh 10 20 30 2> $result && ERROR_EXIT "[ERR  $testnum] NG $check >> 正常終了"
echo '[ERROR 01] 引数は自然数を２つ入力してください。' > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  $testnum] NG $check >> エラーメッセージ相違"
echo "[TEST $testnum] OK $check >> エラー出力終了"

#[TEST 211]異常系
testnum='211'; check='引数数値以外'
./gcd.sh a a 2> $result && ERROR_EXIT "[ERR  $testnum] NG $check >> 正常終了"
echo '[ERROR 02] 引数は自然数を２つ入力してください。' > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  $testnum] NG $check >> エラーメッセージ相違"
echo "[TEST $testnum] OK $check >> エラー出力終了"

#[TEST 221]異常系
testnum='221'; check='引数１にゼロ値'
./gcd.sh 0 10 2> $result && ERROR_EXIT "[ERR  $testnum] NG $check >> 正常終了"
echo '[ERROR 03] 引数は自然数を２つ入力してください。' > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  $testnum] NG $check >> エラーメッセージ相違"
echo "[TEST $testnum] OK $check >> エラー出力終了"

#[TEST 222]異常系
testnum='222'; check='引数２にゼロ値'
./gcd.sh 10 0 2> $result && ERROR_EXIT "[ERR  $testnum] NG $check >> 正常終了"
echo '[ERROR 04] 引数は自然数を２つ入力してください。' > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  $testnum] NG $check >> エラーメッセージ相違"
echo "[TEST $testnum] OK $check >> エラー出力終了"

#[TEST 223]異常系
testnum='223'; check='引数１に負数'
./gcd.sh -1 10 2> $result && ERROR_EXIT "[ERR  $testnum] NG $check >> 正常終了"
echo '[ERROR 03] 引数は自然数を２つ入力してください。' > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  $testnum] NG $check >> エラーメッセージ相違"
echo "[TEST $testnum] OK $check >> エラー出力終了"

#[TEST 224]異常系
testnum='224'; check='引数２に負数'
./gcd.sh 10 -1 2> $result && ERROR_EXIT "[ERR  $testnum] NG $check >> 正常終了"
echo '[ERROR 04] 引数は自然数を２つ入力してください。' > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  $testnum] NG $check >> エラーメッセージ相違"
echo "[TEST $testnum] OK $check >> エラー出力終了"

#[TEST 225]異常系
testnum='225'; check='引数１に小数'
./gcd.sh 1.2 10 2> $result && ERROR_EXIT "[ERR  $testnum] NG $check >> 正常終了"
echo '[ERROR 02] 引数は自然数を２つ入力してください。' > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  $testnum] NG $check >> エラーメッセージ相違"
echo "[TEST $testnum] OK $check >> エラー出力終了"

#[TEST 226]異常系
testnum='226'; check='引数２に小数'
./gcd.sh 10 1.2 2> $result && ERROR_EXIT "[ERR  $testnum] NG $check >> 正常終了"
echo '[ERROR 02] 引数は自然数を２つ入力してください。' > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  $testnum] NG $check >> エラーメッセージ相違"
echo "[TEST $testnum] OK $check >> エラー出力終了"

#TMPファイル削除
rm $remove
