#!/bin/bash

FRUITS=("APPLE" "ORANGE" "STRAWBERRY")   #ARRAY

#index starts from 0, size starts from 1, total size is 3, while printing print fruit index
echo "First Fruit is: ${FRUITS[0]}"
echo "Second Fruit is: ${FRUITS[1]}"
echo "Third Fruit is: ${FRUITS[2]}"

echo "Three Fruits which are entered is: ${FRUITS[@]}"
