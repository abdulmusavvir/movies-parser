FROM golang:1.13.4
WORKDIR /go/src/github/mlabouardy/movies-parser

#ENV VERSION v1.0.22
ENV GOCACHE /tmp

#RUN wget https://github.com/sonatype-nexus-community/nancy/releases/download/$VERSION/nancy-linux.amd64-$VERSION -O nancy && \
#    chmod +x nancy && mv nancy /usr/local/bin/nancy
RUN go get -u golang.org/x/lint/golint

COPY . .

RUN go get -v 
