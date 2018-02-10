# SSL certificates

## 1. Generate

To generate certificates run:

    vagrant up
    vagrant ssh
    cd /vagrant
    ./build.sh

The certificates are stored in:

    ca_directory/app.example.lh.cacert.pem
    server/app.example.lh.cert.pem
    server/app.example.lh.key.pem

## 2. How to change domain?

Search and replace:

```
app.example.lh   ===>   somedomain.example.lh
```
