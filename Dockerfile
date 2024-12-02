FROM floryn90/hugo:ext-alpine

USER root
RUN apk add git
USER hugo

RUN git config --global --add safe.directory /src

COPY . /src

WORKDIR /src

CMD ["hugo", "server", "--bind", "0.0.0.0"]
