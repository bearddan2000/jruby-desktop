FROM jruby:9-alpine

RUN apk add --no-cache font-noto

RUN adduser -S developer

ENV HOME /home/developer

USER developer

COPY ./bin/main.rb /home/developer

CMD ["/home/developer/main.rb"]
