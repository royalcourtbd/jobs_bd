import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {
  static const _scopes = [
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/firebase.messaging',
    'https://www.googleapis.com/auth/firebase.database',
  ];

  final _serviceAccountCredentials = dotenv.env['SERVICE_ACCOUNT_CREDENTIALS']!;

  Future<String> getServerKeyToken() async {
    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(_serviceAccountCredentials),
      _scopes,
    );

    return client.credentials.accessToken.data;
  }
}
