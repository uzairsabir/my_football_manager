import 'package:my_football_manager/Support/Export/MyExport.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["X-Auth-Token"] = API_KEY;

    MyUtils.printMe('REQUEST[${options.method}] => PATH: ${options.path}');

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    MyUtils.printMe(
      'ERROR[${err.response?.statusMessage}] => PATH: ${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    MyUtils.printMe(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }
}
