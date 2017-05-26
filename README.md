# nginx-hhvm-docker

A super fast, production hardened HHVM / PHP-7 `Dockerfile` served by Nginx forward proxy. See [link](http://goo.gl/Adqu0i) for the why. Perfect for horizontally distributed `php,hack` applications.

## Stack

* **HHVM** (Facebooks PHP-7 runtime)
* **Nginx** (FastCGI web-server)

## Usage

Preferably used in a horizontally scaled Docker container environment (such as docker-compose) run alongside other services such as Redis and MariaDB.

CD into your cloned repository

````Bash
cd nginx-hhvm-docker

docker build -t nginx-hhvm:test .

docker run -d -P -v $(WEBROOT):/var/www/public nginx-hhvm:test
````


## Configuration

In config dir. 
