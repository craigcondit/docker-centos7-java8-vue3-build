FROM insideo/centos7-java8-build:latest
MAINTAINER ccondit@randomcoder.com

ENV PATH=/root/.npm-packages/bin:/opt/node/bin:/opt/java/jdk11/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN \	
	mkdir -p /root/.npm-packages/bin && \
	mkdir -p /download && \
	curl -L -o /download/node.tar.xz https://nodejs.org/dist/v10.18.1/node-v10.18.1-linux-x64.tar.xz && \
	mkdir -p /opt && \
	cd opt && \
	tar xvf /download/node.tar.xz && \
	mv node* node && \
	chown -R root:root node && \
	echo 'prefix=/root/.npm-packages' > /root/.npmrc && \
	npm install -g @vue/cli jslint json2yaml npm yaml-lint yarn && \
	rm -rf /download
