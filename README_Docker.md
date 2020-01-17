# Running in Nvidia-Docker
```
sudo docker run --rm -it \
    -v /home/ubuntu/difftaichi/:/difftaichi \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY \
    -e XAUTHORITY \
    -e NVIDIA_DRIVER_CAPABILITIES=all \
    --workdir /difftaichi \
    taichi bash
```
which:

- sudo. permission for access`/tmp/.X11-unix`.
- "-v /tmp/.X11-unix:/tmp/.X11-unix", This is binding your X11 socket into the same location in the container image. You need that for the container to access the display.

The next 3 items are environment variables to be set in the container.

- "-e DISPLAY", this makes your DISPLAY environment variable available in the container. (That's usually set to something like ":0" )
- "-e XAUTHORITY", passes your "MIT-MAGIC-COOKIE" file location (used by xauth) to give permission for the container to use your X session. (that's usually .Xauthority in your home directory) with this you shouldn't need to do anything with "xhost" to set display permissions.
- "-e NVIDIA_DRIVER_CAPABILITIES=all", this is the biggest change from version 1 of nvidia-docker. **By default the container environment variable NVIDIA_DRIVER_CAPABILITIES does not include all of the capabilities of your driver and GPU.**

if `-e XAUTHORITY`not work, add the following step too:

- `xhost +` Access is granted to everyone, even if they aren't on the list (i.e.,  access  control is turned off).. Because the default settings of X11 only allows local users to print. so we need to change this to all users.

