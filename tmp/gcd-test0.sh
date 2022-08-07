#!/bin/bash

#ans="/tmp/$$-ans"
result="/tmp/$$-result"

#ERROR_EXIT(){
#    echo $1
#    rm /tmp/$$-*
#    exit 1
#}

#[TEST 01] 正常終了
./gcd.sh 12 70 > ${result}


cat ${result} | cut -c 1-4
#if [ `cat ${result} | cut -c 1-4` == "CGD=" ]
#then
#    echo "正常終了"
#else
#    ERROR_EXIT "[ERROR 51] 自然数２引数比較エラー"
#echo "NG"
#fi




rm /tmp/$$-*

#if [ $result == 最大公約数=* ]
#then 
#echo "OK"
#else
#echo "NG"
#fi
#cat ${result}

#[TEST 02] 異常終了（引数不整合）
#[TEST 03] 異常終了（引数数値以外）
#[TEST 04] 異常終了（引数自然数以外）
#[TEST 01] 正常動作

