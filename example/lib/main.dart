import 'package:get_server/get_server.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(
    GetServer(
      getPages: AppPages.routes,
      host: '127.0.0.1',
      port: 5000,
      jwtKey: 'S3CR3T',
      cors: true,
      // SSL証明書追加（OPENSSL）
      certificateChain: 'assets/certificates/certificate.crt',
      privateKey: 'assets/certificates/private.key',
    ),
  );
}
