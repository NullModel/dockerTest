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
$ cat testCommands.sh 
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
# Commands that could be added to a container:
```
axtToMaf                chainToPsl         gff3ToGenePred         mafsInRegion         raSqlQuery
axtToPsl                chainToPslBasic    gff3ToPsl              makeTableList        raToLines
bedClip                 checkAgpAndFa      gmtime                 maskOutFa            raToTab
bedCommonRegions        checkCoverageGaps  gtfToGenePred          mktime               randomLines
bedCoverage             checkHgFindSpec    headRest               mrnaToGene           rmFaDups
bedExtendRanges         checkTableCoords   hgFindSpec             netChainSubset       rowsToCols
bedGeneParts            chopFaLines        hgGcPercent            netClass             sizeof
bedGraphPack            chromGraphFromBin  hgLoadBed              netFilter            spacedToTab
bedGraphToBigWig        chromGraphToBin    hgLoadChain            netSplit             splitFile
bedIntersect            colTransform       hgLoadMaf              netSyntenic          splitFileByColumn
bedItemOverlapCount     countChars         hgLoadMafSummary       netToAxt             sqlToXml
bedPileUps              crTreeIndexBed     hgLoadNet              netToBed             stringify
bedRemoveOverlap        crTreeSearchBed    hgLoadOut              newProg              subChar
bedRestrictToPositions  dbSnoop            hgLoadOutJoined        newPythonProg        subColumn
bedSort                 dbTrash            hgLoadWiggle           nibFrag              tailLines
bedToBigBed             estOrient          hgSpeciesRna           nibSize              tdbQuery
bedToExons              faAlign            hgTrackDb              oligoMatch           textHistogram
bedToGenePred           faCmp              hgWiggle               overlapSelect        tickToDate
bedToPsl                faCount            hgsql                  paraFetch            toLower
bedWeedOverlapping      faFilter           hgsqldump              paraSync             toUpper
bigBedInfo              faFilterN          htmlCheck              positionalTblCheck   transMapPslToGenePred
bigBedNamedItems        faFrag             hubCheck               pslCDnaFilter        trfBig
bigBedSummary           faNoise            hubPublicCheck         pslCat               twoBitDup
bigBedToBed             faOneRecord        ixIxx                  pslCheck             twoBitInfo
bigPslToPsl             faPolyASizes       lavToAxt               pslDropOverlap       twoBitMask
bigWigAverageOverBed    faRandomize        lavToPsl               pslFilter            twoBitToFa
bigWigCat               faRc               ldHgGene               pslHisto             udr
bigWigCluster           faSize             liftOver               pslLiftSubrangeBlat  validateFiles
bigWigCorrelate         faSomeRecords      liftOverMerge          pslMap               validateManifest
bigWigInfo              faSplit            liftUp                 pslMrnaCover         wigCorrelate
bigWigMerge             faToFastq          linesToRa              pslPairs             wigEncode
bigWigSummary           faToTab            localtime              pslPartition         wigToBigWig
bigWigToBedGraph        faToTwoBit         mafAddIRows            pslPosTarget         wordLine
bigWigToWig             faTrans            mafAddQRows            pslPretty            xmlCat
blastToPsl              fastqToFa          mafCoverage            pslRecalcMatch       xmlToSql
blastXmlToPsl           featureBits        mafFetch               pslReps
                        fetchChromSizes    mafFilter              pslScore
calc                    findMotif          mafFrag                pslSelect

```
