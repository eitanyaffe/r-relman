FROM bioconductor/release_core2:R3.6.1_Bioc3.9

# basic packages
RUN Rscript -e "install.packages(c('dplyr','Hmisc','phangorn','reshape2','tidyverse', 'R.utils'))"

# bio packages
RUN Rscript -e "BiocManager::install(c('dada2','DECIPHER','DESeq2','edgeR','msa','phyloseq','ggplot2','gplots', 'cowplot'))"

# bzip
RUN apt-get update
RUN apt-get install bzip2

# parallel
RUN mkdir /download && cd /download && wget http://ftp.gnu.org/gnu/parallel/parallel-20190722.tar.bz2 && tar xvf parallel-20190722.tar.bz2
RUN cd /download/parallel-20190722 && ./configure && make && make install
