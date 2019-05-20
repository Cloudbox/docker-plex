#!/bin/bash
marap=$(cut -c 10-14 <<<"$@")
if [ $marap <> "mpeg4" ]; then
     exec /usr/lib/plexmediaserver/Plex\ Transcoder2 -hwaccel nvdec "$@"
else
     exec /usr/lib/plexmediaserver/Plex\ Transcoder2 "$@"
fi
