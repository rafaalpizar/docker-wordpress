# Wordpress HTTP and HTTPs support and MariaDb

This image will create two containers:
- wp_web
- wp_db

This container creates a fresh wordpress site, you can use to prototype any setup 
or you can load your wordpress files and database to restore and test a backup.

## Access
Ports 8080 and 8443 are available on localhost to test the wordpress site.
also it is possible to connect directly to container using standard ports.

To get web container IP use this command:
``` bash
docker container inspect wp_web | grep IPAddress | tail -n1 | cut -d\" -f4
```

### Local host URL:
http://localhost:8080
https://localhost:8443

### Direct container URLs:
http://<container ip address>
https://<container ip address>

## Shares
The container wp_web will mount a home folder inside the container
to manipulate the wordpress site files.

## Database
If there you are testing a site you can load a mysql backup to the wp_db container.

To get db container IP use this command:
``` bash
docker container inspect wp_db | grep IPAddress | tail -n1 | cut -d\" -f4
```

A way to restore the data base is:
```bash
cat backup.sql | mariadb -h<container ip> -uexampleuser -pexamplepass exampledb
```

Notes:
exampleuser, examplepass and exampledb are the settings inside the docker-compose.yaml file
