# How to Use Docker #

## Build ##
* Go into the `ssh` directory and run `./get_ssh_keys`
* Go back into the `docker` directory
`build_docker.sh <IMAGE_NAME>`
* There is a command in here that generates a `version` file, which is used to bust the Docker cache so that the most recent versions of every repository is downloaded. Only put code and commands that you would like to be run every time Docker builds after this cache busting ADD command.

## Run ##
* `./run_docker.sh -n <IMAGE_NAME>`
* `IMAGE_NAME` defaults to nick_setup
