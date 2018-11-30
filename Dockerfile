FROM debian AS compiler

COPY hello.c ./
RUN apt-get update\
 && apt-get install -y build-essential\
 && make hello

FROM debian
COPY --from=compiler /hello /hello
CMD /hello
