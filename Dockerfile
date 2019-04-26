FROM alpine

## Add the wait script to the image
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.5.0/wait /bin/wait
RUN chmod +x /bin/wait
