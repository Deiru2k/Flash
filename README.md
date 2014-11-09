Flash
=====
Frontent part of Mikotoboard imageboard script.


To install:
* Check this repo out on your server
* Install grunt and bower if not installed
```bash
$ sudo npm install -g grunt-cli bower
```
* Run
```bash
$ npm install && bower install
```
* Edit ```app/scripts/app.coffee``` and set ```RestangularProvder.setBaseUrl('http://localhost:8080/v1/')``` to match your backend url (Leave /v1/ on the end)
* Run
```bash
$ grunt build
```
* Serve ```dist``` folder using your favourite web server (Nginx recommended)
* Navigate to your site and use the damn imageboard!
