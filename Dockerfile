FROM floryn90/hugo:ext-alpine

USER root

# 安裝 git 並設定 safe.directory
RUN apk add git && \
    git config --system --add safe.directory /src && \
    git config --system --add safe.directory '*'

# 設定目錄權限
RUN mkdir -p /src && \
    chown -R hugo:hugo /src

# 切換到 hugo 用戶
USER hugo

WORKDIR /src

COPY --chown=hugo:hugo . /src

CMD ["hugo", "server", "--bind", "0.0.0.0"]
