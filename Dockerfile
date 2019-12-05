# Version 1.0

FROM python:3.7

RUN groupadd --gid 1000 antony \
    && useradd --uid 1000 --gid antony --shell /bin/bash --create-home antony

WORKDIR /home/antony

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install

RUN apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN pip install scrapy

USER antony

CMD ["/bin/bash"]
