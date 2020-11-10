# jruby-desktop

## Description
This is a POC project to demonstrate a
jruby application running inside a docker container.

## Tech stack
- jdk 8
- jruby 9
- docker-cli
- bash
- xhost

## Docker stack
- jruby:9-alpine

## To run
```xhost + && sudo ./install.sh -u```

## To stop (optional)
```xhost && sudo ./install.sh -d```

## To see help
`sudo ./install.sh -h`
