# histos
A tool to quickly draw histograms on screen

## Usage
       $ ./histos.pl [OPTIONS] [FILE]

## Description
       No mandatory arguments besides input FILE

       -h
              display help message and exit
       -b
              number in bins used to partition the domain; default value is 10
       -s
              display scale; default value is 1
       -m
              minimum value contained inside input; computed internally if not given
       -M
              maximum value contained inside input; computed internally if not given

## Example
       $ ./histos.pl -b 20 -s 10 data.csv
  0 [5]   : *
  1 [9]   : *
  2 [10]  : **
  3 [30]  : ****
  4 [16]  : **
  5 [20]  : ***
  6 [19]  : **
  7 [28]  : ***
  8 [49]  : *****
  9 [131] : **************
 10 [238] : ************************
 11 [495] : **************************************************
 12 [624] : ***************************************************************
 13 [297] : ******************************
 14 [97]  : **********
 15 [43]  : *****
 16 [6]   : *
 17 [3]   : *
 18 [1]   : *
 19 [2]   : *
 20 [1]   : *

## License
This work is licensed under MIT License.
