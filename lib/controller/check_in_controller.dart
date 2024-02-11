// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:property_managment/API/check_in_api.dart';
import 'package:property_managment/components/loading.dart';
import 'package:property_managment/models/agent_model/check_in_model.dart';
import 'package:property_managment/module/Worker/my_task.dart';

class CheckInController extends GetxController {
  var CheckInUser = CheckInModel(
          status: '', reponse_type: '', response_message: '', data: Data())
      .obs;
  checkinAgent(data) async {
    print("..................PROFILE LIST AGENT......$data");
    Get.dialog(loading());
    Future.delayed(const Duration(seconds: 30), () => "5");
    CheckInModel? thisUser = await CheckInAPI().agentIn(data);
    print("checkin..................${thisUser}");
    CheckInUser(thisUser);
    print("Payload data response...............${CheckInUser.value.data}");
    if (thisUser == null) {
      if (Get.isDialogOpen!) Get.back();
    }
    if (Get.isDialogOpen!) Get.back();
    Get.to(MyTask());
  }
}
