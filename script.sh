#! /bin/bash

pid=$$
curpath="$(dirname "$0")"
pidfile="/tmp/sash.pid"
fifofile="/tmp/sash.fifo"
iconpath="${curpath}/tray_icon.png"

# Exit if there is another instance of sash running
if [ -e $pidfile ]
then
	printf "There is already an instance of sash running. Exiting.\n"
	exit 1
fi

# Check if needed programs are available
for prog in yad ffmpeg ffplay ffcast
do
	command -v $prog >/dev/null 2>&1 || { echo >&2 "I require $prog but it's not installed.  Aborting."; exit 1; }
done

echo $pid > $pidfile

mkfifo $fifofile
ffplay $fifofile -fflags nobuffer &>/dev/null &
ffcast -s % ffmpeg -video_size %wx%h -framerate 30 -f x11grab -i :0.0+%x,%y -c:v hevc_nvenc -preset losslesshp -tune ull -f mpegts -y $fifofile &>/dev/null &

yad --notification --command="pkill -P $pid" --image=$iconpath
rm $fifofile
rm $pidfile
