import 'package:get/get.dart';
import 'package:property_managment/API/check_out_api.dart';
import 'package:property_managment/components/loading.dart';
import 'package:property_managment/models/agent_model/check_in_model.dart';

class CheckOutController extends GetxController {
  checkinAgent(data) async {
    print("..................PROFILE LIST AGENT......$data");
    Get.dialog(loading());
    Future.delayed(const Duration(seconds: 30), () => "5");
    CheckInModel? thisUser = await CheckOutAPI().agentCheckOut(data);
    print(" of the checkout agent .............$thisUser");

    if (thisUser == null) {
      if (Get.isDialogOpen!) Get.back();
    }
    if (Get.isDialogOpen!) Get.back();
    Get.back();
  }
}
