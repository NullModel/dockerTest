# kent command line tools

## to build docker image:
```
  docker build -t kenttools:0.1-1 -f dockerFile.txt . > docker.build.log 2>&1
```
The output of the docker build must be captured in a file via the
redirect, otherwise unusual character sets displayed during the build
can kill your terminal.

A sample set of kent commands have been include in this image.
For example: featureBits, hgsql, twoBitInfo, faToTwoBit, twoBitToFa and
the big* tools.

In the container:
```
$ ls /usr/local/bin
bigBedInfo        bigWigAverageOverBed  bigWigMerge       featureBits
bigBedNamedItems  bigWigCat             bigWigSummary     hgsql
bigBedSummary     bigWigCluster         bigWigToBedGraph  twoBitInfo
bigBedToBed       bigWigCorrelate       bigWigToWig       twoBitToFa
bigPslToPsl       bigWigInfo            faToTwoBit
```

There is a short test script in the ubuntu user home directory: testCommands.sh
that will exercise a couple of these commands:
```
cat testCommands.sh 
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
```
