FROM rocker/r-ubuntu as base

RUN apt-get update
RUN apt-get install -y pandoc

RUN mkdir /project
WORKDIR /project

# copy renv folder
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

# copy files in outside of subfolders
COPY Makefile Makefile
COPY report.Rmd report.Rmd

# copy the rest folders
RUN mkdir codes
RUN mkdir data
RUN mkdir output

COPY codes codes
COPY data data
COPY output output

RUN mkdir report

CMD make report.html && mv report.html report

