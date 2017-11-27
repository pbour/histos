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
  0 [5]   : *__
  1 [9]   : *__
  2 [10]  : **__
  3 [30]  : ****__
  4 [16]  : **__
  5 [20]  : ***__
  6 [19]  : **__
  7 [28]  : ***__
  8 [49]  : *****__
  9 [131] : **************__
 10 [238] : ************************__
 11 [495] : **************************************************__
 12 [624] : ***************************************************************__
 13 [297] : ******************************__
 14 [97]  : **********__
 15 [43]  : *****__
 16 [6]   : *__
 17 [3]   : *__
 18 [1]   : *__
 19 [2]   : *__
 20 [1]   : *__

## License
This work is licensed under MIT License.
