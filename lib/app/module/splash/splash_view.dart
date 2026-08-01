import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/module/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        backgroundColor: Colors.red,
        body: controller.loading.value == false ? Center(): Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    });

  }
}
