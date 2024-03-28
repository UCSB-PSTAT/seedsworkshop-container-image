FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root



ENV TZ America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mamba install -c r-corrplot r-psych r-rocr && \
    /usr/local/bin/fix-permissions "${CONDA_DIR}" || true


USER $NB_USER

