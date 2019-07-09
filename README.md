# arch-in-docker

Just a arch docker file to use in mac, with some packages pre-installed. 

Build the docker image using `docker build -t arch:0.1 .`

Start the container using `docker run -it -v $HOME:/root --rm --name archdocker arch:0.1 /bin/zsh`.

`Ctrl+D` to exit.