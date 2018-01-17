## SteamCMD

This Dockerfile will allow you to run steamcmd from a container.

To log in as an anonymous user, use the following command:

```
docker run -it saywhat1/steamcmd +login anonymous
```

This image is useful for downloading server files.  The following command will download the given Steam App ID and put it in your current directory:

```
docker run -v $(pwd):/home/steam/Steam/<dir> saywhat1/steamcmd \
  +login anonymous \
  +force_install_dir /home/steam/Steam/<dir> \
  +app_update <app-id> \
  validate \
  +exit
```
