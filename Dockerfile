FROM perl:5.28 AS builder
MAINTAINER Heitor Gouvêa
COPY cpanfile cpanfile
RUN cpanm --installdeps .

FROM perl:5.28-slim
COPY --from=builder /usr/local/lib/perl5 /usr/local/lib/perl5
COPY secureperl /usr/bin/secureperl
WORKDIR /tmp/workspace

ENTRYPOINT ["perl", "/usr/bin/secureperl"]