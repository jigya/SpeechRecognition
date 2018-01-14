
open(INPUT,"/home/kartikparnami/btp/TedLium/automatingStepOne/beep-fixed");           # Beep dictionary
my(@lines) = <INPUT>;         # read file into list
close(INPUT);

    @fixedlines;
    foreach $line (@lines) {      # loop thru list
    $line =~ s/\\//g;      # remove backslashes
    if ( $line !~ m/^(\"|\'|#)/ ) { # remove lines with leading single & double quote or comments
               push @fixedlines, lc $line;          
    }
    }

    @lines = sort(@fixedlines);         # sort the list

    open(OUTPUT,">beep-fixed2");    # output file
    my($line);
    foreach $line (@lines) {       # loop thru list
        print OUTPUT "$line";      # print in sorted order
    }
    close(OUTPUT);
