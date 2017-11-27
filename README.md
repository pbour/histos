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
       <table cols = "3" align="right">
              <tr>
                     <td>0</td>
                     <td>[5]</td>
              </tr>
       </table>
&nbsp;0 [5]&nbsp;&nbsp;: *<br/>
&nbsp;1 [9]&nbsp;&nbsp;: *<br/>
&nbsp;2 [10]&nbsp;: **<br/>
&nbsp;3 [30]  &nbsp;: ****<br/>
&nbsp;4 [16]  &nbsp;: **<br/>
&nbsp;5 [20]  &nbsp;: ***<br/>
&nbsp;6 [19]  &nbsp;: **<br/>
&nbsp;7 [28]  &nbsp;: ***<br/>
&nbsp;8 [49]&nbsp;: *****<br/>
&nbsp;9 [131] : **************<br/>
 10 [238] : ************************<br/>
 11 [495] : **************************************************<br/>
 12 [624] : ***************************************************************<br/>
 13 [297] : ******************************<br/>
 14 [97]  &nbsp;: **********<br/>
 15 [43]  &nbsp;: *****<br/>
 16 [6]   &nbsp;&nbsp;: *<br/>
 17 [3]   &nbsp;&nbsp;: *<br/>
 18 [1]   &nbsp;&nbsp;: *<br/>
 19 [3]   &nbsp;&nbsp;: *<br/>

## License
This work is licensed under MIT License.
