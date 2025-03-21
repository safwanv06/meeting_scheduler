
import 'package:dio/dio.dart';

import '../../../main.dart';

final dio = Dio();

Dio dioApiCall() {
  String userToken = '';

  dio.interceptors.add(InterceptorsWrapper(
    onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {

      /// Token Handling
         userToken = "175|FgpWC1lFOkQKWkZC6zl73d27WHmzVZvd6pCHa3Fxeb69b6bd";
      // userToken == ''
          // ? userToken = await sharedDataHandler.getSharedData(
          //     key: SharedPreferenceKey.token)
          // : null;
      print("the user token is $userToken");
      if (userToken != '') {
        options.headers['Accept'] = 'application/json';
        options.headers['Authorization'] = 'Bearer $userToken';
      }
      return handler.next(options);
    },
    onResponse: (Response response, ResponseInterceptorHandler handler) async {
      return handler.next(response);
    },
    onError: (DioException exception, ErrorInterceptorHandler handler) async {
      if (exception.response?.statusCode == 403) {
        await sharedDataHandler.clearSharedData();
        ///Navigate to login
      }
      return handler.next(exception);
    },
  ));
  return dio;
}
