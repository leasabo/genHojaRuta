for archivo in *.m4a
do
    echo "Convirtiendo archivo: $archivo"
    mp4info $archivo
    nombre=$(mp4info $archivo | grep "Name:" | awk -F": " '{print $2}')
    artista=$(mp4info $archivo | grep "Artist:" | awk -F": " '{print $2}')
    album=$(mp4info $archivo | grep "Album:" | grep -v "Gapless" | awk -F": " '{print $2}')

    if test -z $artista
	then
	artista="Artista"
    fi

    if test -z $album
	then
	album="Album"
    fi

    ffmpeg -i $archivo -acodec libmp3lame -ab 128k "mp3/$artista-$album-$nombre.mp3"
done
