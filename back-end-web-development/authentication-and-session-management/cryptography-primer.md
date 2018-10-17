# Cryptography 101

In this section, we will learn the concepts and techniques that are used as part of authentication process.

## What is cryptography? What is it used for?

Cryptography is the practice and study of techniques for secure communication in the presence of third parties. In layman terms, it's the techniques to protect some secrets when they are shared between people. 

For example, suppose you are a general in a war, and you would like to send a secret message to another general to plan for an attack in the next day. There is a chance that your messenger can be captured by your enemy and you need to make sure the secret is well protected.

Specifically, there are a few concerns you need to address:

- If your messenger is ever captured by your enemy, how can you make sure that they cannot interpret the message? How can you make sure that only your allies can understand your message?
  - For this purpose, you need to transform the message into some kind of cryptic codes that your enemy does not understand. This process is called **encryption**.
  - The message in encrypted format is usually referred as **cipher text**
  - Your allies should be able to convert the cryptic codes back to the plain text. This process is called **decryption**
  - In this case, cryptographic techniques helps to protect **secrecy** of the message.
  - Rumor says that Caesar once used this technique during a war, using an algorithm called [Caesar Cipher](https://en.wikipedia.org/wiki/Caesar_cipher)

- Once another general on your side gets your message, how can they be sure the message is not modified by the enemy during transmission?
  - To address this concern, one of the technique is to generate a **cryptographic hash value** of the original message. The **hash algorithm** for generating the hash should guarantee that when never the original text is modified, applying the same hash algorithm on the modified text should generate a different hash value.
  - When another general gets your message, together with the cryptographic hash value, if they apply the hash algorithm on the message and get back the same cryptographic hash value, then they can be sure that the message is not modified. (There is a small loophole here: how can we make sure the cryptographic hash value is not modified? That can be addressed by encryption techniques, or the digital signature techniques discussed below.)
  - In this case, cryptographic techniques helps to prove the **integrity** of the message.

- Once another general (on your side) gets your message, how can they be sure the message is indeed from you and not faked by your enemy?
  - A common solution is to sign the message with your signature. In digital world, you can sign your message digitally as well, with your **digital signature**. We will list down a few common digital signature algorithms below.
  - In this case, cryptographic techniques helps to prove the **identity** of the sender

In short, cryptographic techniques are tools for:

- hiding a secret so that only the intended recipient can interpret it.
- providing a way to verify the original message was not altered by malicious people when the recipient gets it.
- providing a way to prove the message is indeed created by the sender (and not another malicious person).

### Encryption/Decryption Algorithms

There are two major category of encryption/decryption algorithms:

- **Symmetric encryption/decryption**, where one **secret key** is used for both encryption and decryption. That means anyone with the correct secret key can decrypt the cipher text back to plain text correctly. Some of the well known symmetric encryption/decryption algorithm include:
  - [Triple DES](https://en.wikipedia.org/wiki/Triple_DES) 
  - [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard)

- **Asymmetric encryption/decryption**, where there are two keys used for encryption/decryption, one of them is called **private key**, the other is called **public key**. There is a unique relationship between the two keys:
  - A message encrypted by a public key can be decrypted by the corresponding private key
  - A message encrypted by a private key can be decrypted by the corresponding public key

  The owner of the private key should keep it as a secret and never sharing it with other people. In contrast, the public key can be shared with other people. Then the owner of the private key can encrypt a message with his/her private key and anyone holding the public key can decrypt the message. When decryption is done successfully, people can also confirm that the message is created by the person holding the private key. This is the foundation of **digital signature**

  One of the well known asymmetric encryption/decryption algorithm is called [RSA](https://simple.wikipedia.org/wiki/RSA_algorithm).

### Cryptographic Hash Algorithms

From [Wikipedia](https://simple.wikipedia.org/wiki/Cryptographic_hash_function):

> A cryptographic hash function is a hash function which takes an input (or 'message') and returns a fixed-size alphanumeric string. The string is called the 'hash value', 'message digest', 'digital fingerprint', 'digest' or 'checksum'.

The ideal hash function has three main properties:

- It is extremely easy to calculate a hash for any given data.
- It is extremely computationally difficult to calculate an alphanumeric text that has a given hash.
- It is extremely unlikely that two slightly different messages will have the same hash.

Common cryptographic hash functions including:

- [MD5](https://en.wikipedia.org/wiki/MD5). Warning: this one is not strong enough anymore!
- [SHA-1](https://en.wikipedia.org/wiki/SHA-1). Warning: this one is not strong enough anymore!
- [HMAC](https://en.wikipedia.org/wiki/HMAC)
- [bcrypt](https://en.wikipedia.org/wiki/Bcrypt). This one is commonly used to store users' passwords in database.

## Other Use Cases of Cryptography

### SSL Certificates

When you visit a website, you may notice a green lock icon on the URL address bar. That indicates the website has a certificate to prove its identity.

Each certificate has a private key and public key. The web server hosting the website holds the private key, and the browsers download the certificates which contains the public key. Then the browser can send a challenge to the web server. The challenge is basically some random number encrypted with the public key of the certificate. If the web server holds the corresponding private key, it should be able to decrypt the challenge and return the correct random number to the browser. Upon receiving the correct random number sent in the challenge, the browser can confirm the web server holds the correct private key, hence its identify (as declared in the certificate) can be trusted.

### HTTPS

Hypertext Transfer Protocol Secure (HTTPS) is an extension of the HTTP for secure communication over a computer network, and is widely used on the Internet. In HTTPS, the communication protocol is encrypted using **Transport Layer Security (TLS)**, or formerly, its predecessor, Secure Sockets Layer (SSL). The protocol is therefore also often referred to as **HTTP over TLS**, or **HTTP over SSL**.

A website that supports HTTPS uses the public/private key associated with its SSL certificate to create a random number and share it with the browser. That random number is used as a secret to encrypt/decrypt the HTTP requests/responses between the browser and the server.

### Protecting Passwords

Websites like Google and Facebook store their user passwords in database. For security reasons, those passwords are not stored in plaintext. Instead, the values stored in the databases are actually the hashes of the original passwords, generated using cryptographic hash functions like `bcrypt`.

When you login those websites, you fill in your username and password in your browser, and those credentials are sent to the server side for verification. At that time, the web server would compute the hash value of the passwords you submit, and compare it with the hash value stored in its database. When the two hash values match, the password authentication is considered successful.

### Blockchain

Blockchain is a [distributed ledger](https://medium.com/@vijay.betigiri/blockchain-explained-like-im-5-yrs-5f04b91b059c) that ensures all the information recorded in the system are never modified. This is achieved by using some of the encryption/decryption algorithms such as RSA.

## Resources

- [Khan Academy: Introduction to Cryptography](https://www.khanacademy.org/computing/computer-science/cryptography)
