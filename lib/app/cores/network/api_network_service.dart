import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/login_request.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/login_response.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/register_request.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/register_response.dart';

abstract class ApiNetworkService {
  Future<LoginResponse> login(LoginRequest req);
  Future<RegisterResponse> register(RegisterRequest req);
  Future<bool> refreshToken();
  Future<dynamic> get(String uri);
}
