#!/bin/bash
if [${TYPE} = 'VIDEO']
then
  echo "Downloading ${INPUT_VIDEO_FILE_URL} from S3"
  aws s3 cp ${INPUT_VIDEO_FILE_URL} . --region ${AWS_REGION}
  ffmpeg -i ${INPUT_VIDEO_FILE_URL} -ss ${POSITION_TIME_DURATION} -vframes 1 -vcodec png -an -y ${OUTPUT_THUMBS_FILE_NAME}
else
  # Type is camera
  ffmpeg -i ${INPUT_VIDEO_FILE_URL} -vframes 1 -vcodec png -an -y ${OUTPUT_THUMBS_FILE_NAME}
fi
echo "Copying ${OUTPUT_THUMBS_FILE_NAME} to S3 at ${OUTPUT_S3_PATH}/${OUTPUT_THUMBS_FILE_NAME} ..."
aws s3 cp ./${OUTPUT_THUMBS_FILE_NAME} s3://${OUTPUT_S3_PATH}/${OUTPUT_THUMBS_FILE_NAME} --region ${AWS_REGION}