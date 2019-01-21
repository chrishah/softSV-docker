FROM ubuntu:16.04

MAINTAINER <christoph.hahn@tugraz.at>

RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential wget zip

WORKDIR /usr/src

#prepare dependencies
#bamtools
RUN apt-get install -y libbamtools-dev
#	bamtools

#Seqan
RUN wget http://packages.seqan.de/seqan-library/seqan-library-2.0.0.tar.bz2 && \
	tar jxf seqan-library-2.0.0.tar.bz2

#Boost
RUN apt-get install -y libboost-dev \
	libboost-program-options-dev \
	libboost-system-dev \
	libboost-filesystem-dev

#build SoftSV
RUN wget https://sourceforge.net/projects/softsv/files/SoftSV_1.4.2.zip && \
	unzip SoftSV_1.4.2.zip

RUN ln -s /usr/include/bamtools/ /usr/include/bamtools/include

RUN cd SoftSV_1.4.2 && \
	sed -i 's|BAMTOOLS=.*|BAMTOOLS=/usr/include/bamtools|' makefile && \
	sed -i 's|SEQAN=.*|SEQAN=/usr/src/seqan-library-2.0.0|' makefile && \
	make

ENV PATH=$PATH:/usr/src/SoftSV_1.4.2
	

