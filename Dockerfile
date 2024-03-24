ARG VERSION

FROM bitnami/kubectl:$VERSION as kubectl
FROM scratch

COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /medius-kubectl
