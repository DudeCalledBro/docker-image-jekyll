# Jekyll Docker

[![CI](https://github.com/DudeCalledBro/jekyll-docker-image/actions/workflows/ci.yml/badge.svg)](https://github.com/DudeCalledBro/jekyll-docker-image/actions/workflows/ci.yml)

This repository is dedicated to developing the code necessary for containerizing Jekyll using Docker. It includes all the required files and configurations to create a Docker image for running Jekyll efficiently.

Additionally, the repository leverages GitHub Actions to automate the Docker image build process. This means that whenever changes are pushed to the repository, GitHub Actions automatically triggers a workflow that builds the Docker image according to the specified configurations.

## Usage

The following example demonstrates a typical Docker Compose deployment of the Jekyll Docker image. For this to work, an existing functional Jekyll structure is assumed.

```yaml
services:
  jekyll:
    image: dudecalledbro/jekyll:latest
    container_name: jekyll
    ports:
    - 127.0.0.1:4000:4000
    volumes:
    - .:/srv/jekyll:rw
```

To use this setup, simply place the `docker-compose.yml` file in your Jekyll project's root directory and run `docker compose up`. Your Jekyll site will be accessible at `http://localhost:4000`, and any changes made to your local files will be automatically reflected in the running site.

This approach simplifies Jekyll development by providing a consistent environment across different systems and eliminating the need for local Ruby and Jekyll installations

## Build

This image build is scheduled with GitHub Actions and will be pushed to DockerHub. The image will also be rebuilt, if the `main` branch is updated. If you need to build the image locally, ensure [Docker](https://docs.docker.com/engine/installation/) is installed and execute the following:

```bash
docker build -t jekyll-docker:latest .
```

## License

Copyright © 2024 Niclas Spreng

Licensed under the [MIT license](LICENSE).
