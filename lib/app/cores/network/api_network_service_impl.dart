import 'dart:convert';

import 'package:kps_flutter_getx_design_battern/app/cores/constants/constant_uri.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/login_request.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/login_response.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/register_request.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/register_response.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/network/api_network_service.dart';
import 'package:http/http.dart' as http;

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
}
