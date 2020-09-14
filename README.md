![migodock](https://github.com/dxtrleague/migodock/blob/master/assets/logo.png?raw=true)
#
dockerizing local development environment like a boss


## Prerequisite

1. Pre-installed [Docker](https://www.docker.com/)
2. Docker & Docker Compose basic usage

## How it works

**Migodock** pick the easiest to use docker image that available for public. We are using [Makefile](https://www.gnu.org/software/make/manual/make.html) to run all the tools available. If there any required `username` or `password` for the tools, remember that it will be:
```
username: mickey
password: mouse
```
Also for the default settings for every tools e.g `host`, `port` mostly using the default value but if you don't like it, you can change it on every `.env` file inside the specific folder of the tools.

## Usage (Makefile targets)

- `make start-ftp-server` starting FTP server
- `make stop-ftp-server` stopping FTP server
- `make start-mongodb` starting MongoDB server
- `make stop-mongodb` stopping MongoDB server
- `make start-postgres` starting PostgreSQL server _`[*1]`_
- `make stop-postgres` stopping PostgreSQL server

## Notes

- _`[*1]`_ You might have problem during first initial `docker-compose` and have these kind of error
```
initdb: error: directory "/var/lib/postgresql/data" exists but is not empty
```
try to remove `./postgres/data/.gitkeep` and execute `make start-postgres` again will do the tricks.

## Contributing

Any suggested improvement & tools are very welcome, just create pull request to us.