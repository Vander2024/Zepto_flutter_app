import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../app/app.locator.dart';
import 'api_constants.dart';
import 'api_helper.dart';

@lazySingleton
class API {
  final apiHelper = zeptoLocator<ApiHelper>();

  Future<Dio> getAPIClient() async => await apiHelper.getApiClient(true);

  Future<String> authenticateUserAPI(String userName, String password) async {
    var client = await getAPIClient();
    String strAuth = "$userName:$password";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(strAuth);
    String encodeAuth = "Basic $encoded";
    client.options.headers['Authorization'] = encodeAuth;
    var response =  await client.post(authenticateUser);
    var responseData = json.decode(response.data);
    return responseData['token'];
  }



}
