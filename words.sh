#!/bin/sh
rm words2.csv
rm words2_sorted.csv
cp words2.txt words2.csv
./score.rb "words2.csv"
sort -t, -nrk2 words2.csv >> words2_sorted.csv
