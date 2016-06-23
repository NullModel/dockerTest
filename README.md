# kent command line tools

## to build docker image:
```
  docker build -t kenttools:0.1-1 -f dockerFile.txt . > docker.build.log 2>&1
```
The output of the docker build must be captured in a file via the
redirect, otherwise unusual character sets displayed during the build
can kill your terminal.
