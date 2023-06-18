# getx_server_test

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



openssl download
https://slproweb.com/products/Win32OpenSSL.html

■Win64 OpenSSL Command Promptを開く
秘密鍵の生成
openssl genpkey -algorithm RSA -out private.key
公開鍵の生成
openssl rsa -pubout -in private.key -out public.key
自己署名証明書の生成（問い合わせはすべて空でエンター）
openssl req -new -key private.key -out certificate.csr
openssl x509 -req -signkey private.key -in certificate.csr -out certificate.crt

Edge
https://127.0.0.1:5000/
接続がプライベートではありません
⇒詳細設定
⇒127.0.0.1 に進む (安全ではありません)

