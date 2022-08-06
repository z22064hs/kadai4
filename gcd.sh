#!/bin/bash

#[ERROR 01]引数の数が２以外
if [ $# -ne 2 ]
then
  echo "[ERROR 01] 引数は自然数を２つ入力してください。" 1>&2
  exit 1
fi

#[ERROR 02]引数に数値以外を入力
expr $1 + $2 > /dev/null 2>&1 
if [ $? -ge 2 ]
then
  echo "[ERROR 02] 引数は自然数を２つ入力してください。" 1>&2
  exit 1
fi

#[ERROR 03]引数に自然数以外の数値を入力
if [ $1 -le 0 ]
then
  echo "[ERROR 03] 引数は自然数を２つ入力してください。" 1>&2
  exit 1
fi
if [ $2 -le 0 ]
then
  echo "[ERROR 04] 引数は自然数を２つ入力してください。" 1>&2
  exit 1
fi

#大小並べ替え、ユークリッドの互除法（初回）
if [ $1 -ge $2 ]
then
  a=$1
  b=$2
else
  a=$2
  b=$1
fi
c=$(($a%$b))

#ユークリッドの互除法（ループ）
echo "初回 b= $b"        #確認用
while [ ! $c == 0 ];
do
a=$b
b=$c
c=$(($a%$b))
echo "確認 b= $b"        #確認用
done

#最大公約数表示
echo "最大公約数= $b"
