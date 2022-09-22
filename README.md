# Generate self-signet SSL certificates

To generate certificates run the following commands:

    ./build.sh app.YourDomain.lh

The certificates are stored in:

    ca_directory/app.YourDomain.lh.cacert.pem
    server/app.YourDomain.lh.cert.pem
    server/app.YourDomain.lh.key.pem

## How to validate cert file?

    openssl x509 -in CERTIFICATE_FILE -text -noout
    openssl x509 -in example.com.cert.pem -text -noout
