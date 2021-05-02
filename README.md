# diabetes.page jitisi-docker

This repository contains code which was written for the now-concluded startup diabetes.page. The code is now licensed under the Apache license.

The following people participated in this startup (in alphabetical order):
- Alexander Remmes
- David Matthaei
- Joe Hewett
- Philipp Page
- Tom Diacono
- Vincent Rolfs


This the videostreaming service of diabetes.page. It is a modified version of [`docker-jitsi-meet`](https://github.com/jitsi/docker-jitsi-meet).

## Installation

### Step 1: Clone this repository with its submodules

```bash
git clone git@bitbucket.org:thesoftwarebrothers/jitsi-docker.git --recursive
```

### Step 2: Setting up the environment

The configuration works using `.env` files. To get started, run

```bash
cp env.example .env
./gen-passwords.sh
```

Then, configure the .env correctly. Importantly, double-check authentication related settings such as `ENABLE_AUTH` and so on. Also set `CORS_URL` to the url of the frontend, for example `PUBLIC_URL=http://localhost:19006/`. This is to ensure that CORS headers are set correctly. The relevant code for CORS can be found in `/web/rootfs/default/meet.conf`.

Note that the `CONFIG` variable in `.env` points to a folder on your machine to persist certain things. THe folder will be created if it does not exist. Sometimes it is helpful to delete the folder to reset certain things.

### Step 3: Building the videostreaming service

```bash
sudo make build JITSI_SERVICE=web
sudo make tag JITSI_SERVICE=web
```

You may also use `FORCE_REBUILD=1` like `sudo make build JITSI_SERVICE=web FORCE_REBUILD=1`.

The above only builds the `web` part, which should be enough. If, for some reason, you want to build the other parts yourself, use

```
sudo make all
sudo make tag-all
```

## Running the videostreaming service

```bash
docker-compose up -d
```

## Stopping the videostreaming service

```bash
docker-compose down
```

Optionally, to delete the CONFIG folder from .env, use

```
sudo rm -rf ~/.jitsi-meet-cfg
```

or something similar.
