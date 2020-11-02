#!bin/bash
#add -n if you just want to print the result without changing it
#renaming all my files in a better format with rename(perl)


rename -f -X 's/Challenge//g; s/Stats//g; s/\s+/_/g; s/[^-]-//; s/[^-]-//; s/-[^-]*\_//' *.csv

