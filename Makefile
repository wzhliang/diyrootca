1-privatekey:
	openssl genrsa -des3 -out CAPrivate.key 2048

2-rootcert:  # this actually creats a root CA
	openssl req -x509 -new -nodes -key CAPrivate.key -sha256 -days 365 -out CAPrivate.pem

3-createcsr:
	openssl genrsa -out MyPrivate.key 2048
	openssl req -new -key MyPrivate.key -out MyRequest.csr

4-issuecert:
	openssl x509 -req -in MyRequest.csr -CA CAPrivate.pem -CAkey CAPrivate.key -CAcreateserial -out X509Certificate.crt -days 365 -sha256
