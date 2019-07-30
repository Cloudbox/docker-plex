# Image
ARG TAG
FROM plexinc/pms-docker:${TAG}

# Build Arguments (ref: https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact)
ARG BRANCH
ARG COMMIT
ARG TAG

# Environment Variables
ENV \
	BRANCH=${BRANCH:-Unknown} \
	COMMIT=${COMMIT:-Unknown} \
	TAG=${TAG:-Unknown} \
	HEALTHCHECK_MOUNT=/mnt/unionfs

# Build Output
RUN \
	# Set plex version
	export PLEX_VERSION="$(cat /version.txt)" && \
  	echo "** BRANCH: ${BRANCH} - COMMIT: ${COMMIT} - TAG: ${TAG} - PLEX: ${PLEX_VERSION} **" && \
  	# Install extra cli tools
	apt-get update && \
	apt-get install -y \
	iproute2 \
	&& \
	# Cleanup
	apt-get -y autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /tmp/* && \
	rm -rf /var/tmp/*

# Copy scripts
COPY root/ /

# Exports
EXPOSE 32400/tcp 3005/tcp 8324/tcp 32469/tcp 1900/udp 32410/udp 32412/udp 32413/udp 32414/udp

# Volumes
VOLUME /config /transcode
