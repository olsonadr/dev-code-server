# dev-code-server

Docker container for development code-server.


### Usage

#### Build
`docker build . -t olsonadr/ubuntu-code-server:latest`

#### Run
- bridge network
  `docker network create code-server --ip-range 10.0.3.0/24 --subnet 10.0.3.0/24 --attachable`
- `flaviostutz/docker-wall`
  `docker run --rm --cap-add NET_ADMIN --name dockerwall --network host -v /var/run/docker.sock:/var/run/docker.sock -e "GATEWAY_NETWORKS=code-server" -dit flaviostutz/dockerwall`
- `docker:dind`
  `docker run --rm --privileged --name dind --network code-server --label "dockerwall.outbound=api.segment.io,cdn.segment.com,api.wootric.com,cdn.wootric.com,notify.bugsnag.com,sessions.bugsnag.com,auth.docker.io,cdn.auth0.com,login.docker.com,desktop.docker.com,hub.docker.com,registry-1.docker.io,production.cloudflare.docker.com,docker-pinata-support.s3.amazonaws.com,api.dso.docker.com,code-server,10.0.3.3" --ip 10.0.3.2 -dit docker:dind`
- `olsonadr/dev-code-server`
  `docker run --rm -p 8443:8443 --name code-server --network code-server --label "dockerwall.outbound=dind,10.0.3.2" --ip 10.0.3.3 -dit olsonadr/dev-code-server`

