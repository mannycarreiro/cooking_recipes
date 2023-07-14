FROM python:3 as build
WORKDIR /usr/src/mkdocs/docs
COPY docs mkdocs.yml ./
RUN pip install mkdocs \
mkdocs-exclude-search \
mkdocs-material-extensions \
mkdocs-material && \
mv mkdocs.yml ../ && \
cd ../ && \
mkdocs build

FROM nginx:stable
RUN rm -rf /etc/localtime && \
    ln -s /usr/share/zoneinfo/America/Toronto /etc/localtime
WORKDIR /usr/share/nginx/html
COPY --from=build /usr/src/mkdocs/site .
