FROM alpine as tmp

ARG KUBECTL_VERSION
ARG KUBECTL_SHA256

ADD https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN set -xe \
 && echo "${KUBECTL_SHA256} */usr/local/bin/kubectl" | sha256sum -c \
 && chmod +x /usr/local/bin/kubectl

FROM scratch

COPY --from=tmp /usr/local/bin/kubectl /medius-kubectl
