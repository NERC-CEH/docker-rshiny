FROM rocker/shiny

LABEL maintainer "joshua.foster@stfc.ac.uk"

RUN apt-get -y update && \
    apt-get -y install libssl-dev libxml2-dev libgdal-dev libproj-dev && \
    apt-get -y autoclean

# Libraries for display
RUN R -e "install.packages(c('devtools', 'DT', 'leaflet', 'shinythemes'), repos='http://cran.rstudio.com/')" && \
	R -q -e "devtools::install_github('idyverse/ggplot#c592e32')"

# Libraries for data analysis
RUN R -e "install.packages(c('changepoint','dplyr','lubridate','plotly','readr','ref','rgdal','rnrfa','stringr','zoo'), repos='http://cran.rstudio.com/')"
