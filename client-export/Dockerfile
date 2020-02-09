FROM nginx:1.17.8-alpine

LABEL maintainer="Tyler Hale <t.w.hale32@gmail.com>"

RUN apk --no-cache add curl

# Basic "Can we get an OK 200" as a healthcheck
HEALTHCHECK CMD curl -f http://localhost:80 || exit 1

EXPOSE 80

COPY nginx.conf /etc/nginx/nginx.conf

COPY exported /site/build
