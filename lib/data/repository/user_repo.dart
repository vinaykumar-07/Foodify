 
import 'package:example1/data/api/api_client.dart';
import 'package:example1/utilites/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  ApiClient apiClient;
  UserRepo({required this.apiClient });
  
  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}
 