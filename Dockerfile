# Image
ARG TAG=latest
FROM plexinc/pms-docker:${TAG}

# Build Arguments (ref: https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact)
ARG BRANCH
ARG COMMIT
ARG TAG

# Environment Variables
ENV \
	BRANCH=${BRANCH:-Unknown} \
	COMMIT=${COMMIT:-Unknown} \
	TAG=${TAG:-Unknown} 	

# Build Output
RUN \
  echo "** BRANCH: ${BRANCH} - COMMIT: ${COMMIT} - TAG: ${TAG} **"

# Copy init scripts
COPY root/ /

# Exports
EXPOSE 32400 32400/udp 32469 32469/udp 5353/udp 1900/udp

# Volumes
VOLUME /config /transcode
