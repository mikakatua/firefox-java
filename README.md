# firefox-java
Firefox with Java plugin

## Instructions
Download the repository files and execute the `run.sh` script. The script will create the docker image and start firefox container.

Feel free to customize firefox, all config settings and donwloaded files are persisted. They are stored on the host machine, in `~/firefox-java` directory.

While the container is running, you can access the Java Control Panel running:
```
docker exec -it CONTAINER-ID jcontrol
```

Enjoy! :sunglasses:
