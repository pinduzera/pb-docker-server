# Power Bomberman Docker Server

![logo](http://i.imgur.com/4PcHgGd.png)

Docker server for [Power Bomberman](http://www.bombermanboard.com/viewtopic.php?t=1925)

## How to use

### Building

Clone this repository and build the container

```bash
git clone https://github.com/pinduzera/pb-docker-server

cd pb-docker-server

docker build . -t pbserver
```

If you want to run on standard docker CLI detached, just:

```bash
docker run -d --rm --name pbserver -p 64640:64640 pbserver
```

You can set the following environmental variables, if none is set it will use the default values.


| Env. Variable   | Default  | Description                                                                                                                                                                                                       |
|-----------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PB_NAME         | PBServer | The name of the server to be displayed in the game. Don't make this too long so it fits in the border.                                                                                                            |
| PB_PORT         | 64640    |  TCP port to use, don't forget to properly forward. Probably you could just change the container external mapped port.                                                                                            |
| PB_MAX_CLIENTS  | 64       | how many players can be connected to the server at once. Any further connection attempts at the full capacity will be rejected until somebody quits.                                                              |
| PB_MAX_ROOMS    | 32       | how many rooms can be created at once.                                                                                                                                                                            |
| PB_LATENCY_MODE | low      | adjusts the frequency of game packet transmission. Available options are low, medium and high. low is preferred for the best experience, but you might want to try the others if you're having connection issues. |
| VNC_PASSWORD    | NONE     | Password needed to connect to the application's GUI.                                                                                                             |
| DISPLAY_WIDTH   | 1920     | Width (in pixels) of the PB Server application's window.                                                                                                                                                          |
| DISPLAY_HEIGHT  | 1080     | Height (in pixels) of the PB Server application's window.    

## VNC Access

You can access the server through a remote VNC session at `localhost:5900` (or `hostname:5900`) and use the server commands. If the session is not local you might want to expose the port 5900 and access using a VNC client such as [TigerVNC](https://tigervnc.org/). It is not recommended to expose this port to the web since it is not secured.

```bash
docker run -d --rm --name pbserver -p 5900:5900  -p 64640:64640 pbserver
```
For other VNC and base container options check https://github.com/jlesage/docker-baseimage-gui
