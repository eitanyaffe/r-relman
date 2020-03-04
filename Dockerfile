FROM bioconductor/release_core2:R3.6.1_Bioc3.10

# bzip
RUN apt-get update
RUN apt-get install bzip2

# parallel
RUN mkdir /download && cd /download && wget http://ftp.gnu.org/gnu/parallel/parallel-20190722.tar.bz2 && tar xvf parallel-20190722.tar.bz2
RUN cd /download/parallel-20190722 && ./configure && make && make install

# for DirichletMultinomial
RUN apt-get -y install gsl-bin libgsl0-dev

# packages through BiocManager
RUN Rscript -e "BiocManager::install(c('DECIPHER','DESeq2','edgeR','msa','phyloseq','ggplot2','gplots', 'cowplot', 'DirichletMultinomial', 'wesanderson', 'rstan', 'topicmodels', 'slam'))"

RUN Rscript -e "install.packages(c('devtools', 'dplyr','Hmisc','phangorn','reshape2','tidyverse', 'R.utils', 'foreach','doParallel'))"

# github packages
RUN Rscript -e "devtools::install_github('jakobbossek/ggheatmap')"
RUN Rscript -e "devtools::install_github('bm2-lab/MetaTopics')"
