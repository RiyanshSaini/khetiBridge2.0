

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:kheti_project2/features/authentication/controller/otp_controller.dart';

import '../data/repository/authentication/authentication_repository.dart';
import '../data/repository/user/user_repository.dart';
import '../data/services/network_manager.dart';
import '../features/authentication/controller/sign_up_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // Register UserRepository
    Get.put(UserRepository());

    // You can also use lazy loading if you prefer
    // Get.lazyPut(() => UserRepository());

    // Register other dependencies like NetworkManager, AuthenticationRepository, etc.
    Get.put(AuthenticationRepository());
    Get.put(NetworkManager());


    // Register SignupController
    Get.put(SignupController());
    Get.put(OTPController());

  }
}
