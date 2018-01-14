use strict;
use warnings;

my $infile = $ARGV[0] or die "$0 Usage:\n\t$0 $1 <input file>\n\n";
my $outfile = $ARGV[1] or die "$0 Usage:\n\t$0 $1 <input file>\n\n";
open(my $in_fh , '<' , $infile) or die "$0 Error: Couldn't open $infile for reading: $!\n";
open(my $out_fh , '>' , $outfile) or die "$0 Error: Couldn't open $outfile for reading: $!\n";
my $file_contents;
{

    local $/; # slurp in the entire file. Limit change to $/ to enclosing block.
    $file_contents = <$in_fh>

}
close($in_fh) or die "$0 Error: Couldn't close $infile after reading: $!\n";

# change DOS line endings to commas
$file_contents =~ s/\r\n/,/g;
$file_contents =~ s/,$//; # get rid of last comma

# finally output the resulting string to STDOUT
print $file_contents . "\n";
