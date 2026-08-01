import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/LoginResponse.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({String? username, String? password});
  
}