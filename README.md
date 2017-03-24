![h5ai](https://u.teknik.io/S8CTX.png)
# What is h5ai ?

h5ai is a modern file indexer for HTTP web servers with focus on your files. Directories are displayed in a appealing way and browsing them is enhanced by different views, a breadcrumb and a tree overview. Initially h5ai was an acronym for HTML5 Apache Index but now it supports other web servers too.

# Features

There are lots of optional extensions and configuration options to customize the web appearance of your directory listings. All markup is valid HTML5 spiced up with CSS3 and finest JavaScript to build a fresh but minimal user interface and a user experience that focuses on your files.

Some of the optional features are:
sorting – view modes – localization – breadcrumb – tree view – custom headers+footers – filter+search – folder sizes – auto refresh – packaged download – QR codes – thumbnails – image+text+audio+video preview


> [More info](https://larsjung.de/h5ai/)


# How to deploy this image ?

h5ai was built on top of **resin/rpi-raspian** image. This container only use php and nginx, you **must** install h5ai manually in your attached volume storage by decrompressing the zip file on the root:

```
wget https://release.larsjung.de/h5ai/h5ai-0.27.0.zip
unzip h5ai-0.27.0.zip -d /your/storage/path
docker run -d --name h5ai --hostname h5ai -v /your/storage/path:/var/www iomonad/rpi-h5ai-nginx
```
Then you can access http://containerIP. Exposed port are 80 and 443. To bind them on the host:

```
docker run -d --name h5ai --hostname h5ai -v /your/storage/path:/var/www -p 80:80 -p 443:443 iomonad/rpi-h5ai-nginx
```
If your are using a reverse proxy, like **jwilder/nginx-proxy**, you should use this command tp enable vhost:

```
docker run -d --name h5ai --hostname h5ai -v /your/storage/path:/var/www -e VIRTUAL_HOST=files.your.domainname iomonad/rpi-h5ai-nginx
```
