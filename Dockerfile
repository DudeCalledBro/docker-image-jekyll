FROM ruby:3.3-slim-bookworm

LABEL org.opencontainers.image.authors="Niclas Spreng"
LABEL org.opencontainers.image.description="Jekyll Docker Image"
LABEL org.opencontainers.image.source=https://github.com/DudeCalledBro/jekyll-docker-image

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ="Europe/Berlin"
RUN apt-get -qy update \
    && apt-get install -qy --no-install-recommends \
        build-essential \
        git \
        tzdata \
    && ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt-get autoremove -qy \
    && rm -rf /var/lib/apt/lists/*

# install jekyll and its dependencies
RUN --mount=type=bind,source=Gemfile,target=Gemfile bundle install \
    && bundle clean --force

# setup jekyll docker entrypoint script
COPY --chmod=0755 docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR /srv/jekyll

EXPOSE 4000

CMD ["jekyll", "serve", "--force_polling", "--host", "0.0.0.0"]
