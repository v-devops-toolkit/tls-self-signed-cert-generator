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

Validate input format PEM:

    openssl rsa -in CERTIFICATE_FILE -pubout -inform pem -check


## How to generate private key file?

The command to generate private key file:

    openssl genrsa -out PRIVATE_KEY_FILE 2048


With pass phrase:

    openssl genrsa -passout pass:foobar -out PRIVATE_KEY_FILE_WITH_PASS_PHRASE 2048

Later use it with:

    openssl rsa -in privkey.pem -passin pass:foobar -pubout -out privkey.pub

doc: https://stackoverflow.com/questions/4294689/how-to-generate-an-openssl-key-using-a-passphrase-from-the-command-line

## How to get rid of pass phrase?

What I do not understand is: why the command to get rid of pass phrase does not require pass phrase?

You can create a temporary un-encrypted version of the protected private key using the openssl toolkit:

    openssl rsa -in PRIVATE_ENCRYPTED -out PRIVATE_UNENCRYPTED
    openssl rsa -in PRIVATE_KEY_FILE_WITH_PASS_PHRASE -out PRIVATE_UNENCRYPTED

Verify (should be the same contents):

    openssl rsa -in PRIVATE_UNENCRYPTED -out PRIVATE_UNENCRYPTED2

