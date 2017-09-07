#!/usr/bin/perl
use strict; use warnings;
use FileHandle;

my($file) = @ARGV;

my $in = FileHandle->new("< $file");
print "track type=wiggle_0\n";

my $first_line = <>;
my $chr = "0";
my $start = 1;
while(<>){
	chomp;
	my @array = split(/\t/, $_);
	if($array[0] ne $chr){
		$chr = $array[0];
		print "variableStep chrom=$chr\n";
		if($array[1] == $start){
			print "$array[1]\t$array[2]$array[4]\n";
		}else{
		    $start = $array[1];
		    for(my $i=1;$i<$start;$i++){
		    	print "$i\t0.000\n";
	    	}
	    	print "$start\t$array[2]$array[4]\n";
        }
	}else{
    	if($array[1] - $start == 1){
	    	$start = $array[1];
            print "$array[1]\t$array[2]$array[4]\n";
    	}else{
        	for(my $i = $start + 1; $i<$array[1]; $i++){
	        	print "$i\t0.000\n";
        	}
            print "$array[1]\t$array[2]$array[4]\n";
        	$start = $array[1];
        }
    }
}   
