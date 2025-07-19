#!/bin/bash

OUTPUT_DIR="$HOME/Videos/recordings"
OUTPUT_FILE="$OUTPUT_DIR/wf-$(date +%Y-%m-%d_%H-%M)"
VID_EXT="mkv"
AUD_EXT="flac"

if [[ $(pgrep wf-recorder) || $(pgrep pw-record) ]]; then
	pkill wf-recorder
	pkill pw-record

	notify-send "Recording saved at $OUTPUT_DIR"

	sleep 0.5 

	ffmpeg \
		-i "video.${VID_EXT}" \
		-i "audio.${AUD_EXT}" \
		-c:v copy \
		-c:a aac \
		${OUTPUT_FILE}.${VID_EXT}

	rm video.${VID_EXT} audio.${AUD_EXT}

else
	pkill wf-recorder
	pkill pw-record

	notify-send "Recording starts in 5 seconds"
	sleep 5

	# ----- Video recording ----- #
	# Quality
	#wf-recorder -f ${OUTPUT_FILE}_video.${VID_EXT} -c libx264 -p CRF=18,preset=slow

	# Performance
	wf-recorder \
		-f "video.${VID_EXT}" \
		-r 30 \
		-c libx264 \
		-p deadline=realtime \
		-p threads=4 \
		-p vf=format=yuv420p &
		# -p crf=32 Add this to increase performance further

	# Low Size
	#wf-recorder -f ${OUTPUT_FILE}_video.${VID_EXT} -c libvpx -p deadline=good,crf=30,b=0

	# High Framerate
	#wf-recorder -f ${OUTPUT_FILE}_video.${VID_EXT} -r 60 -c libx264 -p CRF=20,preset=ultrafast

	# ----- Audio recording ----- #
	nice -n 10 pw-record  \
		--rate=24000 \
		--channels=1 \
		"audio.${AUD_EXT}"

fi
