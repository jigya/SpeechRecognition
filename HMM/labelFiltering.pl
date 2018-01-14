my ($prompts, @fixedlines, $labFile , $wlist, $line, @line_array, $w, %words, @word_list);

# check usage
if (@ARGV != 3) {
  print "usage: $0 prompts wordlist\n\n"; 
  exit (0);
}

# read in command line arguments
($prompts, $labFile, $wlist) = @ARGV;

# open files
open (WLIST,">$wlist") || die ("Unable to open word list $wlist file for writing");

open(INPUT,"$prompts");           # Beep dictionary
my(@lines) = <INPUT>;         # read file into list
close(INPUT);
foreach $line (@lines) {      # loop thru list
    $line =~ s/\\//g;      # remove backslashes
    if ( $line !~ m/^(\"|\'|#)/ ) { # remove lines with leading single & double quote or comments
      $words{uc $line} = 1;
      printf("%s\n", uc $line);        
    }
}

open(LABFILE,"$labFile");           # Beep dictionary
my(@lines2) = <LABFILE>;         # read file into list
close(LABFILE);
foreach $line (@lines2) {      # loop thru list
    $line =~ s/\\//g;      # remove backslashes
    if ( $line !~ m/^(\"|\'|#)/ ) { # remove lines with leading single & double quote or comments
      if ($words{uc $line} == 1) {
          printf(WLIST "%s", lc $line);        
      }
    }
}

close(WLIST);
close(LABFILE);
close(INPUT);
