import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/login_request.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/login_response.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/register_request.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/register_response.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/network/api_network_service.dart';
import 'package:kps_flutter_getx_design_battern/app/module/auth/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final apiNetworkService = Get.find<ApiNetworkService>();
  @override
  Future<LoginResponse> login({String? username, String?  password}) async {
    LoginRequest request = LoginRequest(
      phoneNumber: username,
      password: password
    );
    return await apiNetworkService.login(request);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    return await apiNetworkService.register(request);
  }
}
