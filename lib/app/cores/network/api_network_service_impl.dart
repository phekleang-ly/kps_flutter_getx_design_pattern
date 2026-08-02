import 'dart:convert';

import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/constants/constant_uri.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/RefreshTokenRequest.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/login_request.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/login_response.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/register_request.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/register_response.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/network/api_network_service.dart';
import 'package:http/http.dart' as http;
import 'package:kps_flutter_getx_design_battern/app/data/access_token.dart';

class ApiNetworkServiceImpl extends ApiNetworkService {
  var headers = {"Content-Type": "application/json"};

  @override
  Future<LoginResponse> login(LoginRequest req) async {
    LoginResponse loginResponse = LoginResponse();
    //URL
    var url = Uri.parse(ConstantUri.loginPath);
    //Call To API
    var response = await http.post(
      url,
      body: jsonEncode(req.toJson()),
      headers: headers,
    );
    //Check Condition status code
    if (response.statusCode == 401) {
      return loginResponse;
    }
    //Mapping Response
    if (response.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    }
    return loginResponse;
  }

  @override
  Future<RegisterResponse> register(RegisterRequest req) async {
    RegisterResponse registerResponse = RegisterResponse();
    //URL
    var url = Uri.parse(ConstantUri.registerPath);
    //Call To API
    var response = await http.post(
      url,
      body: jsonEncode(req.toJson()),
      headers: headers,
    );

    //Mapping Response
    if (response.statusCode == 200 || response.statusCode == 201) {
      registerResponse = RegisterResponse.fromJson(jsonDecode(response.body));
    }
    return registerResponse;
  }

  @override
  Future<bool> refreshToken() async {
    LoginResponse loginResponse = LoginResponse();

    var url = Uri.parse(ConstantUri.refreshPath);
    //Call To API
    var response = await http.post(
      url,
      body: jsonEncode(
        RefreshTokenRequest(refreshToken: AccessToken.getRefreshToken()),
      ),
      headers: headers,
    );

    if (response.statusCode == 401) {
      AccessToken.removeToken();
      Get.offNamed("/login");
      return false;
    }
    //Mapping Response
    if (response.statusCode == 200 || response.statusCode == 201) {
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
      AccessToken.saveToken(
        token: loginResponse.accessToken,
        refresh: loginResponse.refreshToken,
        username: loginResponse.user?.username,
      );
    }
    return true;
  }

  @override
  Future get(String uri) async {
    dynamic responseBody;
    //URL
    var url = Uri.parse(uri);
    //Call To API
    headers["Authorization"] = "Bearer ${AccessToken.getToken()}";
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      responseBody = response.body;
    }

    if (response.statusCode == 401) {
      if (await refreshToken() == true) {
        headers["Authorization"] = "Bearer ${AccessToken.getToken()}";
        var retryResponse = await http.get(url, headers: headers);
        if (response.statusCode == 200) {
          responseBody = retryResponse.body;
        }
      }
    }
    return responseBody;
  }
}
