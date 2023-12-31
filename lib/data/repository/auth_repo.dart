import 'package:example1/data/api/api_client.dart';
import 'package:example1/models/signup_body_model.dart';
import 'package:example1/utilites/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

//method for Creating registration
  Future<Response> registration(SignupBody signupBody) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, signupBody.toJson());
  }

// method for checking user login or not
  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }

//method for Creating login
  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URI, {"email": email, "password": password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
   apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      throw e;
    }
  }

  //remove all data related to logged In  user
  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
    apiClient.token = "";
    apiClient.updateHeader('');

    return true;
  }

  void saveUserNumberAndPassword(String number, String password) {}
}
 