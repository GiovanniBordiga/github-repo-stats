FROM jgehrcke/github-repo-stats-base:e87aa5891

COPY fetch.py /fetch.py
COPY analyze.py /analyze.py
COPY pdf.py /pdf.py
COPY entrypoint.sh /entrypoint.sh
COPY resources /resources

# Install plotly (added after base image was built; not included in base image)
RUN pip install "plotly>=5.0" && pip cache purge

RUN mkdir /rundir && cd /rundir
WORKDIR /rundir
ENTRYPOINT ["/entrypoint.sh"]
