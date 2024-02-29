FROM cloudron/base:4.2.0@sha256:46da2fffb36353ef714f97ae8e962bd2c212ca091108d768ba473078319a47f4

RUN mkdir -p /app/code
WORKDIR /app/code

ARG VERSION=0.0.5

RUN curl -L https://github.com/github-tijlxyz/khatru-pyramid/releases/download/v${VERSION}/khatru-pyramid-v${VERSION}-linux-amd64 -o /app/code/khatru

COPY env.sh.template start.sh /app/pkg/

RUN chmod +x /app/pkg/start.sh
RUN chmod +x /app/code/khatru

CMD [ "/app/pkg/start.sh" ]

