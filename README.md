# SSL certificates for Devbox

To generate certificates run the following commands:

    vagrant up
    vagrant ssh
    cd /vagrant
    
    ./build.sh app.YourDomain.lh

The certificates are stored in:

    ca_directory/app.YourDomain.lh.cacert.pem
    server/app.YourDomain.lh.cert.pem
    server/app.YourDomain.lh.key.pem

The certificates are to be used in:

* RabbitMQ container
* Apache container

For more info about the commands used go to: https://www.rabbitmq.com/ssl.html
