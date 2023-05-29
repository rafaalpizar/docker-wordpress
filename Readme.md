# Wordpress HTTP and HTTPs support and MariaDb

This docker compose service will create two containers:
- wp_web
- wp_db

This is a fresh wordpress site, you can use to prototype any setup 
or you can load your wordpress files and database to restore and test a backup.

## Web Access
TCP Ports 8080 and 8443 are available on localhost to test the wordpress site.
also it is possible to connect directly to container using standard ports.

To get web container IP use this command:
``` bash
docker container inspect wp_web | grep IPAddress | tail -n1 | cut -d\" -f4
```

### Local host URL:
- http://localhost:8080
- https://localhost:8443

### Direct container URLs:
- http://<container ip address>
- https://<container ip address>

### Certificate
This web server create a self-signed certificate, you must trust that in your browser to
continue.

## Shares
The container wp_web will mount a host folder inside the containerto manipulate the wordpress site files.

Mapping:
|Host|Container|
|~/share/wordpress_container|/var/www/html|


## Database
If you are testing a site you can load a mysql backup to the wp_db container.
The database is a mariadb listening on a standard port 3306/tcp.

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

## Iptables
If there is a need to use standard ports on 127.0.0.1, below iptables command can help
(must be run with root grants):
1. iptables -t nat -I OUTPUT -s 127.0.0.1 -d 127.0.0.1 -p tcp --dport 80 -j REDIRECT --to-port 8080
1. iptables -t nat -I OUTPUT -s 127.0.0.1 -d 127.0.0.1 -p tcp --dport 443 -j REDIRECT --to-port 8443
