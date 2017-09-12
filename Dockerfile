FROM rocker/shiny

RUN apt-get -y update && \
    apt-get -y install libssl-dev libxml2-dev libgdal-dev libproj-dev && \
    apt-get -y autoclean

# Libraries for display
RUN R -e "install.packages(c('DT', 'ggplot2', 'leaflet', 'shinythemes'), repos='http://cran.rstudio.com/')"

# Libraries for data analysis
RUN R -e "install.packages(c('changepoint','dplyr','lubridate','plotly','readr','ref','rgdal','rnrfa','stringr','zoo'), repos='http://cran.rstudio.com/')"
