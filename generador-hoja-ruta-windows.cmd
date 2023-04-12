@Echo OFF

(For %%tema In ("*.mp3") DO (
      MediaInfo.exe "%%~ftmae" "--Inform=General;%%CompleteName%% | %%Duration/String3%%"
))> ".\hoja-ruta.csv"

Pause&Exit /B 0