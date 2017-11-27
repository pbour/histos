#!/usr/bin/perl
use List::Util qw[min max];
use Getopt::Std;
use strict;


my %histo;
my %options=();
my $maxV = 0;
my $minV = 0;
my $maxBinIdDigits = 0;
my $numBins = 10;
my $extendBin = 0;
my $maxCountDigits = 0;
my $scale = 1;
my $column = 0;
my $delimeter = ',';
my @vals;
my $line = "";
my $lcounter = 0;
getopts("hb:s:m:M:c:d:", \%options);


# Parse and check command line arguments.
if (defined $options{h} or $#ARGV < 0)
{
    print "USAGE\n";
    print "       histo.pl [OPTION]... [FILE]\n\n";
    print "DESCRIPTION\n";
    print "       No mandatory arguments besides input FILE\n\n";
    print "       -h\n";
    print "              display this help message and exit\n";
    print "       -c\n";
    print "              column to build the histogram; default value is 1\n";
    print "       -d\n";
    print "              spliting delimeter in quotes to define columns; by default is set to ','\n";
    print "       -b\n";
    print "              number of bins to partition the domain; default value is 10\n";
    print "       -s\n";
    print "              display scale; default value is 1\n";
    print "       -m\n";
    print "              minimum value contained inside input; computed internally if not given\n";
    print "       -M\n";
    print "              maximum value contained inside input; computed internally if not given\n";
    exit;
}
if (defined $options{d})
{
    $delimeter = $options{d};
}
if (defined $options{c})
{
    $column = $options{c};
    $column -= 1;
}
if (defined $options{b})
{
    $numBins = $options{b};
}
if (defined $options{s})
{
    $scale = $options{s};
}
if (defined $options{m} and defined $options{M})
{
    $minV = $options{m};
    $maxV = $options{M};
}
else
{
    # Compute min and max values if not given
    open(IN, $ARGV[0]) or die("Could not open file \"$ARGV[0]\".");
    while ($line = <IN>)
    {
        chomp($line);
        $lcounter += 1;
        @vals = split($delimeter, $line);
        if ($#vals < $column)
        {
            print "File is not properly formatted: line $lcounter contains less than " . ($column+1) . " columns or the column delimeter is not properly set.\n" ;
            exit;
        }
        $maxV = max($maxV, $vals[$column]);
        $minV = min($minV, $vals[$column]);
    }
    close(IN);
}


# Set the extend of each bin.
$extendBin = 1/$numBins;


# Normalize input.
my $diff = $maxV-$minV;
open(IN, $ARGV[0]) or die("Could not open file \"$ARGV[0]\".");
$lcounter = 0;
while ($line = <IN>)
{
    chomp($line);
    $lcounter += 1;
    @vals = split($delimeter, $line);
    if ($#vals < $column)
    {
        print "File is not properly formatted: line $lcounter contains less than " . ($column+1) . " columns or the column delimeter is not properly set.\n" ;
        exit;
    }
    my $count = ($vals[$column]-$minV)/$diff;
    my $bin = int($count/$extendBin);
    if ($bin >= $numBins)
    {
        $bin = $numBins-1;
    }
    $histo{$bin} = $histo{$bin}+1;
}
close(IN);


# Compute stats for visualization.
$maxBinIdDigits = length($numBins);
my $maxCount = 0;
foreach my $b (0..$numBins)
{
    $maxCount = max($maxCount, $histo{$b});
}
$maxCountDigits = length($maxCount);


# Draw histogram.
print "histogram scaled by $scale\n";
foreach my $b (0..$numBins-1)
{
    my $count =  $histo{$b};
    #for (0..($maxBinIdDigits-length($b)))
    #{
    #    print " ";
    #}
    if ($count < 1)
    {
        $count = 0;
    }
    
    #print "$b [" . $count . "]";
    print "[" . $count . "]";
    for (0..($maxCountDigits-length($count)))
    {
        print " ";
    }
    print ": ";
    if ($count > 0)
    {
        for (0..($count/$scale))
        {
            print "*";
        }
    }
    print "\n";
}
exit;
