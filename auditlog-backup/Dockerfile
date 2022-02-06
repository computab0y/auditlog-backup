# FROM registry.access.redhat.com/ubi8-minimal
FROM registry.access.redhat.com/ubi8/ubi-minimal

LABEL maintainer="Ray Bryan"
RUN microdnf update -y && rm -rf /var/cache/yum
RUN microdnf install nss_wrapper gettext tar gzip -y \
    && microdnf clean all

RUN curl -L -s \
    https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.8.28/openshift-client-linux-4.8.28.tar.gz \
    | tar -C /usr/local/bin/ -zxv oc kubectl ; \
    chmod +x /usr/local/bin/oc ; \
    chmod +x /usr/local/bin/kubectl


RUN mkdir -p /backup/auditlogs/ 
RUN mkdir -p /backup/etcd/ 
RUN mkdir -p /backup/dblogs/ 
RUN chmod -R 755 /backup

COPY azcopy-linux/* /usr/local/bin

ENTRYPOINT ["/bin/bash"]
