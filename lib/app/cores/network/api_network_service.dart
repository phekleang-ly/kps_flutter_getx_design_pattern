import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/LoginRequest.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/LoginResponse.dart';

abstract class ApiNetworkService {
  Future<LoginResponse> login(LoginRequest req);
}