# TLS Self-Signed Cert Generator

To generate certificates run the following commands:

    ./build.sh app.YourDomain.lh

The certificates are stored in:

    server/app.YourDomain.lh.cert.pem
    server/app.YourDomain.lh.key.pem


## Documentation

Generate man page in txt format:

    man openssl | col -b > man/man-page-openssl.txt
    man ssh-keygen | col -b > man/man-page-ssh-keygen.txt

Further Reading:

* https://stackoverflow.com/questions/4294689/how-to-generate-an-openssl-key-using-a-passphrase-from-the-command-line


## How to validate cert file?

    openssl x509 -in CERTIFICATE_FILE -text -noout
    openssl x509 -in example.com.cert.pem -text -noout

## How to validate input format PEM?

    openssl rsa -in CERTIFICATE_FILE -pubout -inform pem -check

## How to generate private key file?

The command to generate private key file:

    openssl genrsa -out PRIVATE_KEY_FILE 2048

With pass phrase:

    # CAUTION: this is a private key with passphrase
    # but it is not ciphered.
    # It means that everybody can get rid of this passphrase
    openssl genrsa -passout pass:foobar -out PRIVATE_KEY_FILE_WITH_PASS_PHRASE 2048

To get rid of this passphrase run:

    openssl rsa -in PRIVATE_WITH_PASSPHRASE -out PRIVATE_WITHOUT_PASSPHRASE


**CAUTION** 
Without option to cipher the key the file is not ciphered.
Even if you use `--passout` param.


The command to generate password protected private key:

    # passphrase in the command line
    openssl genrsa -aes256 -passout pass:foobar -out PRIVATE_KEY_FILE_WITH_PASS_PHRASE 2048

    # you will be asked for passphrase
    openssl genrsa -aes256 -out PRIVATE_KEY_FILE_WITH_PASS_PHRASE 2048


## How to view keyfile?

    openssl rsa -text -noout -in yourdomain.key
    openssl rsa -text -noout -in PRIVATE_KEY_FILE

## How to get rid of pass phrase?

What I do not understand is: why the command to get rid of pass phrase does not require pass phrase?
It is simple: the file was not encrypted.


You can create un-encrypted version of the with:

    openssl rsa -in PRIVATE_KEY_A -out PRIVATE_KEY_B

Verify (should be the same contents):

    openssl rsa -in PRIVATE_KEY_B -out PRIVATE_KEY_C

Two files:

    PRIVATE_KEY_B
    PRIVATE_KEY_C

should be identical!
