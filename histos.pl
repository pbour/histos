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
getopts("hb:s:m:M:", \%options);


# Parse and check command line arguments.
if (defined $options{h})
{
    print "USAGE\n";
    print "       histo.pl [OPTIONS] [FILE]\n\n";
    print "DESCRIPTION\n";
    print "       No mandatory arguments besides input FILE\n\n";
    print "       -h\n";
    print "              display this help message and exit\n";
    print "       -b\n";
    print "              number in bins used to partition the domain; default value is 10\n";
    print "       -s\n";
    print "              display scale; default value is 1\n";
    print "       -m\n";
    print "              minimum value contained inside input; computed internally if not given\n";
    print "       -M\n";
    print "              maximum value contained inside input; computed internally if not given\n";
    exit;
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
    my $line = "";
    while ($line = <IN>)
    {
        chomp($line);
        $maxV = max($maxV, $line);
        $minV = min($minV, $line);
    }
    close(IN);
}


# Set the extend of each bin.
$extendBin = 1/$numBins;


# Normalize input.
my $diff = $maxV-$minV;
open(IN, $ARGV[0]) or die("Could not open file \"$ARGV[0]\".");
my $line = "";
while ($line = <IN>)
{
    chomp($line);
    my $count = ($line-$minV)/$diff;
    my $bin = int($count/$extendBin);
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
print "binID cardinality (scalled by $scale)\n";
foreach my $b (0..$numBins)
{
    my $count =  $histo{$b};
    for (0..($maxBinIdDigits-length($b)))
    {
        print " ";
    }
    if ($count < 1)
    {
        $count = 0;
    }
    
    print "$b [" . $count . "]";
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
