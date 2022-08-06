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


#[TEST 51] 引数・自然数設定正常（$1>$2）
./gcd.sh 11 35 > $result
if [[ `cat $result | cut -c 1-4` == "CGD=" ]]
then
    echo "[TEST 51] OK"
else
    ERROR_EXIT "[ERR  51] 引数・自然数設定正常時に発生（$1>$2）"
fi


#[TEST 52] 引数・自然数設定正常（$2>$1）
./gcd.sh 35 11 > $result
if [[ `cat $result | cut -c 1-4` == "CGD=" ]]
then
    echo "[TEST 52] OK"
else
    ERROR_EXIT "[ERR  52] 引数・自然数設定正常時に発生（$2>$1）"
fi


#[TEST 53] 引数・自然数設定正常（$1=$2）
./gcd.sh 11 11 > $result
if [[ `cat $result | cut -c 1-4` == "CGD=" ]]
then
    echo "[TEST 53] OK"
else
    ERROR_EXIT "[ERR  53] 引数・自然数設定正常時に発生（$1=$2）"
fi


#[TEST 71] 引数なし
./gcd.sh 2> $result && ERROR_EXIT "[ERR  71] 引数なし（異常終了せず）"
echo "[ERROR 01] 引数は自然数を２つ入力してください。" > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  71] 引数なし（エラーメッセージ相違）"
echo "[TEST 71] OK"


#[TEST 72] 引数１
./gcd.sh 10 2> $result && ERROR_EXIT "[ERR  72] 引数１（異常終了せず）"
echo "[ERROR 01] 引数は自然数を２つ入力してください。ＱＱ" > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  72] 引数１（エラーメッセージ相違）"
echo "[TEST 72] OK"


#[TEST 73] 引数数値以外
./gcd.sh a a 2> $result && ERROR_EXIT "[ERR  73] 引数数値以外（異常終了せず）"
echo "[ERROR 02] 引数は自然数を２つ入力してください。" > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  73] 引数数値以外（エラーメッセージ相違）"
echo "[TEST 73] OK"


#[TEST 74] 引数１に自然数以外
./gcd.sh 0 10 2> $result && ERROR_EXIT "[ERR  74] 引数１に自然数以外（異常終了せず）"
echo "[ERROR 03] 引数は自然数を２つ入力してください。" > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  74] 引数１に自然数以外（エラーメッセージ相違）"
echo "[TEST 74] OK"


#[TEST 75] 引数２に自然数以外
./gcd.sh 10 0 2> $result && ERROR_EXIT "[ERR  75] 引数２に自然数以外（異常終了せず）"
echo "[ERROR 04] 引数は自然数を２つ入力してください。" > $ans
diff $result $ans >> $err || ERROR_EXIT "[ERR  75] 引数２に自然数以外（エラーメッセージ相違）"
echo "[TEST 75] OK"

#TMPファイル削除
rm $remove
