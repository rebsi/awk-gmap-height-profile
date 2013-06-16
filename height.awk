BEGIN {
	SUM_UP = 0;
	SUM_DOWN = 0;
}
{
	if (NR > 1) {
		gsub(",","",$2);

		if (NR == 2) {
			LAST = $2;
		}
		DIFF = $2 - LAST;
		LAST = $2;
		if (DIFF > 0) {
			SUM_UP += DIFF;
		} else {
			SUM_DOWN += DIFF;
		}
	}
}
END {
	gsub(",","",$1);

	print "dist: " $1 "\tup: " SUM_UP "\tdown:" SUM_DOWN;
	print "+ back way:"
	print "dist: " ($1*2) "\tup: " SUM_UP-SUM_DOWN "\tdown:" SUM_DOWN-SUM_UP;
}

