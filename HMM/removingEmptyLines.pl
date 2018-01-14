my @data, $fileToBeTreated, $treatedFile;

# check usage
if (@ARGV != 2) {
  print "usage: $0 prompts wordlist\n\n"; 
  exit (0);
}

# read in command line arguments
($fileToBeTreated, $treatedFile) = @ARGV;

# open files
open (FILE,$fileToBeTreated) || "Unable to open file";
open (FILETWO,">$treatedFile") || "Unable to open file";

# put line only if line is not empty
foreach(<FILE>){
  push @data,$_ unless ($_ eq "\n");
}

# printing into output file
print FILETWO @data;

# closing files
close FILE || die "Unable to close file";
close FILETWO || die "Unable to close file";
