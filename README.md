# docker-ffmpeg-thumb

Derived from the base [jrupakg/docker-ffmpeg-thumb](https://hub.docker.com/r/jrupakg/docker-ffmpeg-thumb/) docker image.
Extended to work with camera url's.
## Build image

```
docker build -t aeroith/docker-ffmpeg-thumb .
```

## Run

```
docker run -v /local/path:/tmp/workdir \
    -e INPUT_VIDEO_FILE_URL='your-video-or-camera-file-url' \
    -e POSITION_TIME_DURATION='position-of-frame-in-video' \
    -e OUTPUT_VIDEO_FILE_NAME='output.png' \
    -e TYPE='CAMERA'
    rupakg/docker-ffmpeg-thumb

```
After running the above command, the thumbnail image `output.png` will be created in the mounted `/local/path`.
