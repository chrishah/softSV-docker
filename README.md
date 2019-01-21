# softSV-docker
Docker image running Ubuntu 16.04 with SoftSV version 1.4.2 installed

Setup:
 - Ubuntu 16.04
   - libboost
   - bamtoolslib
 - seqan 2.0.0
 - [SoftSV](https://sourceforge.net/projects/softsv/) 1.4.2

Get the image:
```bash
docker pull chrishah/softsv:1.4.2
```

Use the container:
```bash
docker run --rm -v $(pwd):/in/ -w /in/ chrishah/softsv:1.4.2 SoftSV -h
```
