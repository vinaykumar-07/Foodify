
import 'package:example1/utilites/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'Application/json; Charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(String uri,) async {
    try {
     Response response= await get(uri);
     return response;

    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}