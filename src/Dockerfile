FROM postgres:13-alpine

ENV POSTGRES_USER=root
ENV POSTGRES_PASSWORD=peppa
ENV POSTGRES_DB=foxtrot

COPY init.sql /docker-entrypoint-initdb.d/
