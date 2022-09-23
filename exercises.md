# Exercises

## 1. Generate private key without passphrase which is not ciphered

    openssl genrsa -out EX1_A 2048

Convert it:

    openssl rsa -in EX1_A -out EX1_B

Both files should be identical!

The operation:

    openssl rsa -in EX1_A -out EX1_B

does not change the file!

## 2. Generate private key with passphrase which is not ciphered

    openssl genrsa -passout pass:foobar -out EX2_A 2048

Convert it (get rid of passphrase):

    openssl rsa -in EX2_A -out EX2_B

The files are identical!

    EX2_A
    EX2_B

Does it mean that the passphrase is not stored in a file?
Probably: yes


## 3. How to verify that the two keys are identical?

They produce identical output:

    openssl rsa -text  -pubout -in KEY_FILE_A > info.txt
    openssl rsa -text  -pubout -in KEY_FILE_B > info.txt

The file `info.txt` should not change.


## 4. Generate a key with different app and verify it with openssl


    # without any option it generates RSA key
    ssh-keygen -t rsa -b 2048 -m PEM

This file can be read by:

    openssl rsa -in THISISEXAMPLE

Convert it:

    openssl rsa -in THISISEXAMPLE -out THISISEXAMPLE_B

Is it changed? NO!

