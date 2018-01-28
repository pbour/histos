# histos
A tool to quickly draw equi-width histograms on the terminal

## Usage
       $ ./histos.pl [OPTION]... [FILE]

## Description
       No mandatory arguments besides input FILE

       -h
              display this help message and exit
       -c
              column to build the histogram; default value is 1
       -d
              spliting delimeter in quotes to define columns; by default is set to ','
       -b
              number of bins to partition the domain; default value is 10
       -s
              display scale; default value is 1
       -m
              minimum value contained inside input; computed internally if not given
       -M
              maximum value contained inside input; computed internally if not given

## Example
       $ ./histos.pl -c 1 -d ' ' -b 20 -s 10 data.csv
[5]    : *<br/>
[9]    : *<br/>
[10]   : **<br/>
[30]   : ****<br/>
[16]   : **<br/>
[20]   : ***<br/>
[19]   : **<br/>
[28]   : ***<br/>
[49]   : *****<br/>
[131]  : **************<br/>
[238]  : ************************<br/>
[495]  : **************************************************<br/>
[624]  : ***************************************************************<br/>
[297]  : ******************************<br/>
[97]   : **********<br/>
[43]   : *****<br/>
[6]    : *<br/>
[3]    : *<br/>
[1]    : *<br/>
[3]    : *<br/>

## License
This work is licensed under MIT License.
