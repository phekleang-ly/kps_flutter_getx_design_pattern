import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/module/auth/login/login_controller.dart';
import 'package:kps_flutter_getx_design_battern/app/wigets/custom_buttom_wiget.dart';
import 'package:kps_flutter_getx_design_battern/app/wigets/custom_input_wiget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        appBar: AppBar(
          title: Text("Login", style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.red,
        ),

        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputWiget(
                controller: controller.usernameController.value,
                label: "Username",
                hintText: "Username",
              ),
              CustomInputWiget(
                controller: controller.passwordController.value,
                label: "Password",
                hintText: "Password",
                obscureText: controller.isPasswordHidden.value,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
              SizedBox(height: 35),
              CustomButtomWiget(
                laoding: controller.loading.value,
                label: "Login",
                onclick: () {
                  controller.onLogin();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
