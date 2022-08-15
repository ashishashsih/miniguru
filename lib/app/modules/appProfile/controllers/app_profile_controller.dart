import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProfileController extends GetxController {
  //TODO: Implement AppProfileController

  var studentName="".obs;
  var parentName="".obs;
  var dateOfBirth="".obs;
  var schoolName="".obs;
  var mobile="".obs;
  var email="".obs;
  var gender="".obs;
  @override
  void onInit()
  {
    super.onInit();
    getProfileData();
  }

  getProfileData()async
  {
    final prefs = await SharedPreferences.getInstance();
    studentName.value=prefs.getString('studentName')!;
    parentName.value=prefs.getString('parentName')!;
    dateOfBirth.value=prefs.getString('dateOfBirth')!;
    schoolName.value=prefs.getString('schoolName')!;
    mobile.value=prefs.getString('mobile')!;
    email.value=prefs.getString('email')!;
    gender.value=prefs.getString('gender')!;
    Fluttertoast.showToast(msg: "msg:${studentName},${parentName},${dateOfBirth},${schoolName},${mobile},${email},${gender}");
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}}
