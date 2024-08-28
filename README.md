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

### Create a Bundle

To create a new user with it's related database, use the `create-bundle` script:

```bash
./dc exec postgresql create-bundle cowork

#> A new user cowork was created with the password VjFTxwNagaZGkQ5u.
#> A new database cowork was created.
#> The database cowork was linked with the user cowork.
```

Both the user and the database will have the same name.

### Create a Database

If you only want to create the database but you don't want to create a new user linked to it, use the `create-database` script:

```bash
./dc exec postgresql create-database cowork

#> A new database cowork was created.
```

### Create a User

Also, if you want to create a new user without a linked database, use the `create-user` script:

```bash
./dc exec postgresql create-user cowork

#> A new user cowork was created with the password nWGiMzcqlLx6/4Ug.
```

### Drop a Bundle

To drop an existing user with it's related database, use the `drop-bundle` script:

```bash
./dc exec postgresql drop-bundle cowork

#> The database cowork was dropped.
#> The user cowork was dropped.
```

### Drop a Database

If you only want to drop the database but you don't want to drop any user linked to it, use the `drop-database` script:

```bash
./dc exec postgresql drop-bundle.sh cowork

#> The database cowork was dropped.
```

### Drop a User

Also, if you want to drop a user but you don't want to drop any linked database, use the `drop-user` script:

```bash
./dc exec postgresql drop-user cowork

#> The user cowork was dropped.
```

### Create an Administrator

To assign a user privileges to create databases, there is a `set-admin`script:

```bash
./dc exec postgresql set-admin odoo

#> The user cowork can now create databases.
```

### Backup the Databases

To create a backup for one the databases, you can use the bundled `dump-database` script:

```bash
./dc exec postgresql dump-database cowork
```

That will create a `cowork.sql.gz` file in the `backups` folder.

### Restore a Backup

To restore a backup, you can use the `restore-database` script:

```bash
./dc exec postgresql restore-database cowork
```

The script will look for a file named `cowork.sql.gz` file in the `backups` folder and it will restore it's backup state.
