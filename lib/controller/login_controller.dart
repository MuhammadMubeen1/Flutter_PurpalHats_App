import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_managment/API/login_api.dart';
import 'package:property_managment/components/loading.dart';
import 'package:property_managment/models/tanent_login_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../module/Tanent/home_screen.dart';
import '../module/Worker/home_view.dart';

class LoginController extends GetxController {
  var deviceToken;
  var myUser = TanentModel(
          status: "",
          reponse_type: "",
          response_message: "",
          data: DataTanent())
      .obs;
  var showPassValue = true.obs;
  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    super.onInit();

    /// used firedbase for notification ...
    FirebaseMessaging.instance.getToken().then((token) {
      print("firebase messgain  get token$token");
      assert(token != null);
      print("firebase messgain  get token$token");
      deviceToken = token;
      print("firebase messgain  get token$deviceToken");

      GetStorage().write("fcm_token", deviceToken);
      print(
          "----000----Message----${GetStorage().write("fcm_token", deviceToken)}");
    });
  }

  //// check login method here...
  loginUser(String username, String password) async {
    final prefs = await SharedPreferences
        .getInstance(); //used shared perefernce for storage user info
    Get.dialog(loading());
    Future.delayed(const Duration(seconds: 30), () => "5"); //wait 5 second ...
    TanentModel? thisUser = //check TanentModel ....
        await LoginAPI().login(username, password, deviceToken);
    if (thisUser == null) {
      ////// if user value null then go back else moveon
      if (Get.isDialogOpen!) Get.back();
    }
    myUser.value = thisUser!;

    ///check response of data....
    if (myUser.value.data != null && myUser.value.status == "success") {
      ///store user type here...
      GetStorage().write("user_type", myUser.value.data?.user_type);
      final user_Type = GetStorage().read('user_type');

      //// store user all info in sharedference .....
      print(
          "$myUser.value.data?.user_type - ${myUser.value.data?.name} - ${myUser.value.data?.email} - ${myUser.value.data?.user_id.toString()}");
      await prefs.setString('userType', myUser.value.data?.user_type);
      await prefs.setString('name', myUser.value.data?.name);
      await prefs.setString('email', myUser.value.data?.email);
      await prefs.setString('userId', myUser.value.data!.user_id.toString());
      if (Get.isDialogOpen!) Get.back();

      //// used check for check user type...here
      if (myUser.value.data?.user_type == "agent") {
        Get.to(AgentScreen(
          email: myUser.value.data?.email,
          name: myUser.value.data?.name,
          userId: myUser.value.data?.user_id.toString(),
        ));
      } else {
        Get.to(TanentHomeScreen(
          email: myUser.value.data?.email,
          name: myUser.value.data?.name,
          userId: myUser.value.data?.user_id.toString(),
        ));
      }
    }
  }

/// show password check here...
  isShowPass(val) {
    print(" nnnnnnnnnnn........ isshowPass.......$val");
    showPassValue(val);
  }
}
