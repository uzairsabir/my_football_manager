import 'package:my_football_manager/Support/Export/MyExport.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal();

  final Dio dio = Dio(
    BaseOptions(
        baseUrl: SERVER_URL,
        connectTimeout: 10000,
        receiveTimeout: 10000000, //10000
        headers: {"Content-Type": "application/json"}),
  )..interceptors.add(ApiInterceptors());
}
