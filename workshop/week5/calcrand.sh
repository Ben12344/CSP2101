#!/bin/bash

function cal_rand () {
    floor=20;
    celling=70;
    range=$(($celling-$floor+1));
    rand_num=$RANDOM;
    let "rand_num %= $range";
    rand_num=$(($rand_num+$floor));
}