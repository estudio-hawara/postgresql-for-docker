# PostgreSQL for Docker

## Install

To start using this container, start by cloning the repository:

```bash
git clone https://github.com/hawara-es/postgresql-for-docker.git
cd postgresql-for-docker
```

## Configure

Once you have cloned the repository, create a new `.env` file and set your safe passwords there.

```bash
cp env.example .env
```

## Docker Container

To start the container with minimum settings, just run:

```bash
docker compose up -d
```

Which is equivalent to loading the default `docker-compose.yml`:

```bash
docker compose -f docker-compose.yml up -d
```

To start the container with the 5432 port binded to the host, use the `docker-compose.port.yml` file:

```bash
docker compose -f docker-compose.yml -f docker-compose.port.yml up -d
```

### The `dc` Helper

To standardize calling Docker from the project root, the `dc` filename has been added to this project's `.gitignore`.

You are encouraged to create it either if you will be only using the standard file:

```bash
#!/bin/bash
docker compose -f docker-compose.yml "$@"
```

... or if you will also be using the open port file:

```bash
#!/bin/bash
docker compose -f docker-compose.yml -f docker-compose.port.yml "$@"
```

Thanks to this, and after giving executing permissions to the new file, you will be able to use this short hand:

```bash
# chmod +x dc
./dc up -d
```

## Maintenance Scripts

### Create a Database

To create a new user with it's related database, there is a `create-bundle.sh` script:

```bash
./dc exec postgresql create-bundle.sh cowork
```

### Drop a Database

To drop an existing user with it's related database, there is a `drop-bundle.sh` script:

```bash
./dc exec postgresql drop-bundle.sh cowork
```

### Create an Administrator

To create a new user with privileges to create databases, there is a `create-admin.sh`script:

```bash
./dc exec postgresql create-admin.sh odoo
```

### Backup the Databases

To create a backup for one the databases, you can use the bundled `dump-database.sh` script:

```bash
./dc exec postgresql dump-database.sh cowork
```

That will create a `cowork.sql.gz` file in the `backups` folder.

### Restore a Backup

To restore a backup, you can use the `restore-database.sh` script:

```bash
./dc exec postgresql restore-database.sh cowork
```

The script will look for the corresponding `.sql.gz` file in the `backups` folder and it will restore it's backup state.
