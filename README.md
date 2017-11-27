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
&nbsp;0 [5]   : *<br/>
  1 [9]   : *<br/>
  2 [10]  : **<br/>
  3 [30]  : ****<br/>
  4 [16]  : **<br/>
  5 [20]  : ***<br/>
  6 [19]  : **<br/>
  7 [28]  : ***<br/>
  8 [49]  : *****<br/>
  9 [131] : **************<br/>
 10 [238] : ************************<br/>
 11 [495] : **************************************************<br/>
 12 [624] : ***************************************************************<br/>
 13 [297] : ******************************<br/>
 14 [97]  : **********<br/>
 15 [43]  : *****<br/>
 16 [6]   : *<br/>
 17 [3]   : *<br/>
 18 [1]   : *<br/>
 19 [3]   : *<br/>

## License
This work is licensed under MIT License.
