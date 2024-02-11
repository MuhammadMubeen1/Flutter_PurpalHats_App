
// ignore_for_file: unnecessary_null_comparison, unused_local_variable, avoid_print

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_managment/API/logout_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignOutSeekerController extends GetxController {
  signOutSeekeer(userId) async {
    print(" user deactive accoubnt........ $userId");
    Future.delayed(const Duration(seconds: 30), () => "5");
    var thisUser = await SeekerLogout().tanentLogout(userId); 
    

  }


  removeData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("myUser");
    prefs.remove("access_token");
    prefs.remove("profile_image");
    prefs.remove("userType");
    prefs.remove("email");
    prefs.remove("name");
    prefs.remove("userId");
    prefs.clear();
    GetStorage().remove("myUser");
    GetStorage().remove("access_token");
    GetStorage().remove("fcm_token");
    GetStorage().remove("profile_image");
  }
}
