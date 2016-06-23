#!/bin/sh

printf "featureBits hg38 -countGaps knownGene\n" 1>&2
featureBits hg38 -countGaps knownGene > fb.hg38.knownGene.txt 2>&1

printf "hgsql -e 'desc trackVersion;' hgFixed\n" 1>&2
hgsql -e 'desc trackVersion;' hgFixed > trackVersion.hgFixed.txt

printf "bigBedInfo http://hgdownload.cse.ucsc.edu/gbdb/hg38/bbi/lrgRegions/lrg.bb\n" 1>&2
bigBedInfo http://hgdownload.cse.ucsc.edu/gbdb/hg38/bbi/lrgRegions/lrg.bb > lrg.bigBedInfo.txt

printf "bigWigInfo http://hgdownload.cse.ucsc.edu/gbdb/rn6/bbi/gc5BaseBw/gc5Base.bw\n" 1>&2
bigWigInfo http://hgdownload.cse.ucsc.edu/gbdb/rn6/bbi/gc5BaseBw/gc5Base.bw > gc5Base.bigWigInfo.txt

printf "twoBitInfo http://hgdownload.cse.ucsc.edu/gbdb/hg38/hg38.2bit stdout | sort -k2nr\n" 1>&2
twoBitInfo http://hgdownload.cse.ucsc.edu/gbdb/hg38/hg38.2bit stdout | sort -k2nr > hg38.chromSizes.txt
