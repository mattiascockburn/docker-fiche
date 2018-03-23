# docker-fiche
Simple pastebin in Docker, using https://github.com/solusipse/fiche

Example:

docker run -d -e DOMAIN=pastebin.foobar.tld -p 9999:9999 fiche:latest

The Webserver part is based on https://github.com/mattiasgiese/docker-archlinux-caddy
and uses the webserver Caddy (https://caddyserver.com/)
