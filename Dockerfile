FROM openshift/base-centos7
MAINTAINER Chengchang Wang <chengchang.wang@vipshop.com>

EXPOSE 8583

ENV IMAGE_VERSION 1.0

LABEL io.k8s.description="Virtual Vehicle Maintenance Service" \
      io.k8s.display-name="Maintenance" \
      io.openshift.expose-services="8583:http" \
      io.openshift.tags="builder,service,maintenance" \
      io.openshift.s2i.destination="/opt/s2i/destination"

#COPY ./maintenance/ /apps
ADD vehicle /apps/

RUN chmod -R go+rw /apps && \
	chmod +x /apps/start.sh

WORKDIR /apps	
ENTRYPOINT ["/bin/bash", "./start.sh"]
