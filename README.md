# SSL certificates

## 1. Generate

To generate certificates run:

```
vagrant up
vagrant ssh
cd /vagrant
./build.sh
```

The certificates are stored in:

```
ca_directory/app.example.lh.cacert.pem
server/app.example.lh.cert.pem
server/app.example.lh.key.pem
```

## 2. How to change domain?

### 2.1. Cleanup old certs

```
vagrant ssh
cd /vagrant
./clean-dirs.sh
./init-dirs.sh
```

Commit changes.

### 2.2. Search & replace

Search and replace:

```
app.example.lh   ===>   somedomain.example.lh
```

Commit changes.

### 2.3. Generate new certs

```
vagrant up
vagrant ssh
cd /vagrant
./build.sh
```

Commit changes.

