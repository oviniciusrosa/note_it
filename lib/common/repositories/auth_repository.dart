import 'package:note_it/common/constants/api_constants.dart';
import 'package:note_it/common/services/http_client.dart';

class AuthRepository {
  final http = HttpClient();

  Future<dynamic> defaultLogin() => http.get(apiUrl);
}
