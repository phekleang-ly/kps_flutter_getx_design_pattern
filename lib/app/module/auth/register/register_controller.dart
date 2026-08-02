import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/cores/models/auth/register_request.dart';
import 'package:kps_flutter_getx_design_battern/app/data/access_token.dart';
import 'package:kps_flutter_getx_design_battern/app/module/auth/repository/auth_repository.dart';

class RegisterController extends GetxController {
  var firstNameController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var usernameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneNumberController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPasswordController = TextEditingController().obs;
  
  var loading = false.obs;
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  
  final authRepository = Get.find<AuthRepository>();

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  @override
  void onClose() {
    firstNameController.value.dispose();
    lastNameController.value.dispose();
    usernameController.value.dispose();
    emailController.value.dispose();
    phoneNumberController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.onClose();
  }

  Future<void> onRegister() async {
    var firstName = firstNameController.value.text;
    var lastName = lastNameController.value.text;
    var username = usernameController.value.text;
    var email = emailController.value.text;
    var phoneNumber = phoneNumberController.value.text;
    var password = passwordController.value.text;
    var confirmPassword = confirmPasswordController.value.text;

    if (firstName.isEmpty) {
      Get.snackbar("Error", "First Name is required");
      return;
    }
    if (lastName.isEmpty) {
      Get.snackbar("Error", "Last Name is required");
      return;
    }
    if (username.isEmpty) {
      Get.snackbar("Error", "Username is required");
      return;
    }
    if (email.isEmpty) {
      Get.snackbar("Error", "Email is required");
      return;
    }
    if (phoneNumber.isEmpty) {
      Get.snackbar("Error", "Phone Number is required");
      return;
    }
    if (password.isEmpty) {
      Get.snackbar("Error", "Password is required");
      return;
    }
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    loading.value = true;
    await Future.delayed(Duration(seconds: 2));
    
    try {
      RegisterRequest request = RegisterRequest(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        confirmPassword: confirmPassword,
        role: "USER",
        profile: "",
      );

      var registerResponse = await authRepository.register(request);
      
      if (registerResponse.accessToken != null) {
        // Option 1: API returned token directly
        loading.value = false;
        AccessToken.saveToken(
          username: username,
          token: registerResponse.accessToken,
          refresh: registerResponse.refreshToken,
        );
        Get.offAllNamed("/home");
      } else if (registerResponse.code == "200" || registerResponse.message == "Create Success") {
        // Option 2: Registration success but no token (Auto-Login)
        var loginResponse = await authRepository.login(
          username: username,
          password: password,
        );
        loading.value = false;
        if (loginResponse.accessToken != null) {
          AccessToken.saveToken(
            username: username,
            token: loginResponse.accessToken,
            refresh: loginResponse.refreshToken,
          );
          Get.offAllNamed("/home");
        } else {
          Get.snackbar("Success", "Account created successfully. Please login.");
          Get.offAllNamed("/login");
        }
      } else {
        loading.value = false;
        Get.snackbar("Error", registerResponse.message ?? "Registration failed.");
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar("Error", "An unexpected error occurred");
    }
  }
}
