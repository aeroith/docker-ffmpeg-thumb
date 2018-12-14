#!/bin/bash
echo "Type is ${TYPE}"
echo "URL is ${INPUT_VIDEO_FILE_URL}"
if [ "${TYPE}" == 'CAMERA' ]
then
  ffmpeg -i ${INPUT_VIDEO_FILE_URL} -vframes 1 -an -y ${OUTPUT_THUMBS_FILE_NAME}
else
  # Type is video
  echo "Downloading ${INPUT_VIDEO_FILE_URL} from S3"
  aws s3 cp ${INPUT_VIDEO_FILE_URL} /tmp/video --region ${AWS_REGION} --acl public-read
  ffmpeg -i /tmp/video -vframes 1 -an -y ${OUTPUT_THUMBS_FILE_NAME}
fi
echo "Copying ${OUTPUT_THUMBS_FILE_NAME} to S3 at ${OUTPUT_S3_PATH}/${OUTPUT_THUMBS_FILE_NAME} ..."
aws s3 cp ./${OUTPUT_THUMBS_FILE_NAME} s3://${OUTPUT_S3_PATH}/${OUTPUT_THUMBS_FILE_NAME} --region ${AWS_REGION}
