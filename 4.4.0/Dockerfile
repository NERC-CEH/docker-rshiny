FROM rocker/shiny:4.4.0

ARG PHANTOMJSVER="phantomjs-2.1.1-linux-x86_64"

RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
  libcurl4-openssl-dev \
  libxml2-dev \
  gdal-bin \
  libgdal-dev \
  libproj-dev \
  libcairo2-dev \
  libgeos-dev \
  libgeos++-dev \
  libudunits2-dev \
  libpng-dev \
  libssl-dev \
  libssh2-1-dev \
  jags \
  libv8-dev \
  python3-dev \
  texlive-latex-base \
  libsodium-dev \
  libfreetype-dev \
  libxext-dev \
  lmodern \
  texlive-latex-recommended \
  texlive-latex-extra \
  texlive-fonts-recommended \
  texlive-font-utils \
  texlive-fonts-extra \
  curl \
  lmodern \
  libglpk-dev \
  libxml2-dev \
  && apt-get -y autoclean

# Install PhantomJS
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
  build-essential chrpath libssl-dev libxft-dev \
  libfreetype6 libfreetype6-dev \
  libfontconfig1 libfontconfig1-dev \
  && apt-get -y autoclean

RUN wget https://github.com/Medium/phantomjs/releases/download/v2.1.1/$PHANTOMJSVER.tar.bz2 \
    && tar xvjf $PHANTOMJSVER.tar.bz2 \
    && mv $PHANTOMJSVER /usr/local/share \
    && ln -sf /usr/local/share/$PHANTOMJSVER/bin/phantomjs /usr/local/bin

# Libraries for display
RUN R -e "install.packages(c('devtools', 'DT', 'leaflet', 'shinythemes', 'ggplot2', 'renv', 'packrat'), repos='http://cran.rstudio.com/')"

# update the rshiny config with longer timeouts
RUN sed -i 's/run_as shiny;/run_as shiny;\napp_init_timeout 1800;\napp_idle_timeout 300;/g' /opt/shiny-server/config/default.config
