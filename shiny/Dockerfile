FROM ubuntu:16.04
MAINTAINER Felipe Santiago <felipe.santiago@outlook.com>

RUN apt-get update && apt-get install -y \
    r-base \
    wget \
    gdebi-core    

RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos='https://cran.rstudio.com/')" 

RUN wget --no-verbose https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION -O "version.txt" && \
    VERSION=$(cat version.txt)  && \
    wget --no-verbose "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-$VERSION-amd64.deb" -O ss-latest.deb && \
    gdebi -n ss-latest.deb && \
    rm -f version.txt ss-latest.deb && \
    cp -R /usr/local/lib/R/site-library/shiny/examples/* /srv/shiny-server/

COPY currencyReader /srv/shiny-server/currencyReader/  
COPY rmarkdown /srv/shiny-server/rmarkdown/

EXPOSE 3838

COPY shiny-server.sh /usr/bin/shiny-server.sh

RUN apt-get update && apt-get install -y \
    libmariadb-client-lgpl-dev \
    libxml2-dev

RUN R -e "install.packages(c('RMySQL','tidyr', 'dplyr', 'ggvis'), repos='https://cran.rstudio.com/')"

RUN R -e "install.packages(c('RNeo4j'), repos='https://cran.rstudio.com/')"

CMD ["/usr/bin/shiny-server.sh"]

#libcurl4-gnutls-dev \
    #libcurl4-openssl-dev \

#, 'rvest'


# FROM alpine:edge
# FROM conoria/alpine-r

# RUN apk update && apk add --no-cache R R-dev gcc g++ curl openssl libxml2 coreutils && \
#     R -q -e "install.packages('Rcpp', repo='https://cran.rstudio.com')" && \
#     curl -L -O https://cran.r-project.org/src/contrib/httpuv_1.3.3.tar.gz \
# 	&& tar xvf httpuv_1.3.3.tar.gz \
# 	&& sed -i -e 's/__USE_MISC/_GNU_SOURCE/g' httpuv/src/libuv/src/fs-poll.c \
# 	&& tar -cf httpuv_1.3.3.tar.gz httpuv \
# 	&& R CMD INSTALL httpuv_1.3.3.tar.gz \
# 	&& rm -rf httpuv_1.3.3.tar.gz httpuv /tmp/*

# #libc6-compat psmisc rrdtool openssl
# #curl openssl libxml2 

# COPY AirbusExtractor/ /srv/shiny-server/AirbusExtractor
# COPY CurrencyReader/ /srv/shiny-server/CurrencyReader 

# # , 'rmarkdown', 'RMySQL', 'tidyr', 'dplyr', 'ggvis', 'rvest'
# # CMD ["/bin/ash"]

# CMD ["R"]
# # g++



#TODO: Change this to alpine version 
# FROM r-base:latest

# MAINTAINER Felipe Santiago <felipe.santiago@outlook.com>

# RUN apt-get update && apt-get install -y -t unstable \
#     sudo \
#     gdebi-core \
#     pandoc \
#     pandoc-citeproc \
#     libcurl4-gnutls-dev \
#     libcairo2-dev/unstable \
#     libxt-dev \ 
#     libmysqlclient-dev \
#     libxml2-dev \ 
#     libssl-dev

# # Download and install shiny server
# RUN wget --no-verbose https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION -O "version.txt" && \
#     VERSION=$(cat version.txt)  && \
#     wget --no-verbose "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-$VERSION-amd64.deb" -O ss-latest.deb && \
#     gdebi -n ss-latest.deb && \
#     rm -f version.txt ss-latest.deb && \
#     R -e "install.packages(c('shiny', 'rmarkdown', 'RMySQL', 'tidyr', 'dplyr', 'ggvis', 'rvest'), repos='https://cran.rstudio.com/')" && \
#     cp -R /usr/local/lib/R/site-library/shiny/examples/* /srv/shiny-server/

# COPY AirbusExtractor/ /srv/shiny-server/AirbusExtractor
# COPY CurrencyReader/ /srv/shiny-server/CurrencyReader

# EXPOSE 3838

# COPY shiny-server.sh /usr/bin/shiny-server.sh

# CMD ["/usr/bin/shiny-server.sh"]

# #install.packages("XML")
# install.packages("ggradar")


# RUN apt-get update && apt-get install -y -t unstable \
#     sudo \
#     gdebi-core \
#     pandoc \
#     pandoc-citeproc \
#     libcurl4-gnutls-dev \
#     libcairo2-dev/unstable \
#     libxt-dev \ 
#     libmysqlclient-dev \
#     libxml2-dev \ 
#     libcurl4-openssl-dev

# # Download and install shiny server
# RUN wget --no-verbose https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION -O "version.txt" && \
#     VERSION=$(cat version.txt)  && \
#     wget --no-verbose "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-$VERSION-amd64.deb" -O ss-latest.deb && \
#     gdebi -n ss-latest.deb && \
#     rm -f version.txt ss-latest.deb && \
#     R -e "install.packages(c('shiny', 'rmarkdown', 'RMySQL', 'tidyr', 'dplyr', 'ggvis', 'rvest'), repos='https://cran.rstudio.com/')" && \
#     cp -R /usr/local/lib/R/site-library/shiny/examples/* /srv/shiny-server/

# COPY /home/santiago/Work/SantiagoCloud/R /srv/shiny-server/ 

# EXPOSE 3838

# COPY shiny-server.sh /usr/bin/shiny-server.sh

# CMD ["/usr/bin/shiny-server.sh"]



# FROM alpine:edge
# MAINTAINER Felipe Santiago <felipe.santiago@outlook.com>

# #BEGIN INSTALL PYTHON 2.7 
# #Source --> https://raw.githubusercontent.com/docker-library/python/855b85c8309e925814dfa97d61310080dcd08db6/2.7/alpine/Dockerfile

# # ensure local python is preferred over distribution python
# ENV PATH /usr/local/bin:$PATH

# # http://bugs.python.org/issue19846
# # > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
# ENV LANG C.UTF-8

# # install ca-certificates so that HTTPS works consistently
# # the other runtime dependencies for Python are installed later
# RUN apk add --no-cache ca-certificates

# ENV GPG_KEY C01E1CAD5EA2C4F0B8E3571504C367C218ADD4FF
# ENV PYTHON_VERSION 2.7.12

# # if this is called "PIP_VERSION", pip explodes with "ValueError: invalid truth value '<VERSION>'"
# ENV PYTHON_PIP_VERSION 8.1.2

# RUN set -ex \
# 	&& apk add --no-cache --virtual .fetch-deps \
# 		gnupg \
# 		openssl \
# 		tar \
# 		xz \
# 	\
# 	&& wget -O python.tar.xz "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" \
# 	&& wget -O python.tar.xz.asc "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" \
# 	&& export GNUPGHOME="$(mktemp -d)" \
# 	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$GPG_KEY" \
# 	&& gpg --batch --verify python.tar.xz.asc python.tar.xz \
# 	&& rm -r "$GNUPGHOME" python.tar.xz.asc \
# 	&& mkdir -p /usr/src/python \
# 	&& tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz \
# 	&& rm python.tar.xz \
# 	\
# 	&& apk add --no-cache --virtual .build-deps  \
# 		bzip2-dev \
# 		gcc \
# 		gdbm-dev \
# 		libc-dev \
# 		linux-headers \
# 		make \
# 		ncurses-dev \
# 		openssl \
# 		openssl-dev \
# 		pax-utils \
# 		readline-dev \
# 		sqlite-dev \
# 		tcl-dev \
# 		tk \
# 		tk-dev \
# 		zlib-dev \
# # add build deps before removing fetch deps in case there's overlap
# 	&& apk del .fetch-deps \
# 	\
# 	&& cd /usr/src/python \
# 	&& ./configure \
# 		--enable-shared \
# 		--enable-unicode=ucs4 \
# 	&& make -j$(getconf _NPROCESSORS_ONLN) \
# 	&& make install \
# 	\
# 		&& wget -O /tmp/get-pip.py 'https://bootstrap.pypa.io/get-pip.py' \
# 		&& python2 /tmp/get-pip.py "pip==$PYTHON_PIP_VERSION" \
# 		&& rm /tmp/get-pip.py \
# # we use "--force-reinstall" for the case where the version of pip we're trying to install is the same as the version bundled with Python
# # ("Requirement already up-to-date: pip==8.1.2 in /usr/local/lib/python3.6/site-packages")
# # https://github.com/docker-library/python/pull/143#issuecomment-241032683
# 	&& pip install --no-cache-dir --upgrade --force-reinstall "pip==$PYTHON_PIP_VERSION" \
# # then we use "pip list" to ensure we don't have more than one pip version installed
# # https://github.com/docker-library/python/pull/100
# 	&& [ "$(pip list |tac|tac| awk -F '[ ()]+' '$1 == "pip" { print $2; exit }')" = "$PYTHON_PIP_VERSION" ] \
# 	\
# 	&& find /usr/local -depth \
# 		\( \
# 			\( -type d -a -name test -o -name tests \) \
# 			-o \
# 			\( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
# 		\) -exec rm -rf '{}' + \
# 	&& runDeps="$( \
# 		scanelf --needed --nobanner --recursive /usr/local \
# 			| awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
# 			| sort -u \
# 			| xargs -r apk info --installed \
# 			| sort -u \
# 	)" \
# 	&& apk add --virtual .python-rundeps $runDeps \
# 	&& apk del .build-deps \
# 	&& rm -rf /usr/src/python ~/.cache

# #END INSTALL PYTHON 2.7

# #START MANUAL INSTALL SHINY SERVER 
# #Source --> https://github.com/rstudio/shiny-server/wiki/Building-Shiny-Server-from-Source
# RUN apk update && apk add --no-cache --update gcc g++ cmake R R-dev git unzip
# RUN R -e "install.packages(c('shiny'), repos='https://cran.rstudio.com/')"

# # Clone the repository from GitHub
# RUN git clone https://github.com/rstudio/shiny-server.git && \
#     cd shiny-server && \
#     mkdir tmp && \
#     cd tmp && \
# # # Add the bin directory to the path so we can reference node
#     DIR=`pwd` && \
#     PATH=$DIR/../bin:$PATH && \
# # # See the "Python" section below if your default python version is not 2.6 or 2.7. 
#     PYTHON=`which python` && \
# # # Check the version of Python. If it's not 2.6.x or 2.7.x, see the Python section below.
#     $PYTHON --version && \
# # # Use cmake to prepare the make step. Modify the "--DCMAKE_INSTALL_PREFIX"
# # # if you wish the install the software at a different location.
#     cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DPYTHON="$PYTHON" ../ && \
# # # Get an error here? Check the "How do I set the cmake Python version?" question below
# # Recompile the npm modules included in the project
#     make && \
#     mkdir ../build && \
#     (cd .. && ./bin/npm --python="$PYTHON" install) && \
#     (cd .. && ./bin/node ./ext/node/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js --python="$PYTHON" rebuild) && \
# # # Install the software at the predefined location
#     sudo make install





