#!/bin/bash

min=10
max=30

diff=$(( $max- $min ))


randomline=$((( RANDOM % $diff ) + 1 ))

actualline=$(( $randomline+$min ))

echo $actualline