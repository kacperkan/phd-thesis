#!/bin/bash

if [[ ! -d "krzysztof_krawiec" ]] 
then
    mkdir krzysztof_krawiec
fi

if [[ ! -d "boguslaw_cyganek" ]] 
then
    mkdir boguslaw_cyganek
fi
 
cp aux/rebuttal_kk.pdf krzysztof_krawiec/rebuttal_kacper_kania.pdf
cp aux/rebuttal_bg.pdf boguslaw_cyganek/rebuttal_kacper_kania.pdf
