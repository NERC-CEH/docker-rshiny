FROM rocker/shiny:4.0.4

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
  && apt-get -y autoclean

# Libraries for display
RUN R -e "install.packages(c('devtools', 'DT', 'leaflet', 'shinythemes', 'ggplot2', 'renv', 'packrat'), repos='http://cran.rstudio.com/')"


