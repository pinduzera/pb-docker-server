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


| Env. Variable      | Default                  | Description                                                                                                                                                                                     |
|--------------------|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PB_NAME            | PBServer                 | The name of the server to be displayed in the game. Don't make this too long so it fits in the border.                                                                                          |
| PB_PORT            | 64640                    | TCP port to use, don't forget to properly forward. Probably you could just change the container external mapped port.                                                                           |
| PB_MAX_ROOMS       | 32                       | how many rooms can be created at once.                                                                                                                                                          |
| PB_WELCOME_MESSAGE | "Welcome to PBDocker!"   | Server's welcome message                                                                                                                                                                        |

