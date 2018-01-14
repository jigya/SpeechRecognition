use strict;

my ($prompts, $wlist, $line, @line_array, $w, %words, @word_list);

# check usage
if (@ARGV != 2) {
  print "usage: $0 prompts wordlist\n\n"; 
  exit (0);
}

# read in command line arguments
($prompts, $wlist) = @ARGV;

# open files
open (PROMPTS,"$prompts") || die ("Unable to open prompts $prompts file for reading");
open (WLIST,">$wlist") || die ("Unable to open word list $wlist file for writing");

# process each prompt one at a time
while ($line = <PROMPTS>) {
  chomp ($line);
  @line_array=split(/\s+/, $line);
  printf("%s\n", $line_array[3]);
  printf(WLIST "%s\n", uc $line_array[3]);
}

close(WLIST);
close(PROMPTS);
