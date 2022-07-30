import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_guru/constants.dart';
import 'package:mini_guru/others/api_service.dart';
import 'package:intl/intl.dart';

class MyProjectsController extends GetxController {
  //TODO: Implement MyProjectsController

  final count = 0.obs;
  var isLoading=false.obs;

  var startDate = DateFormat('dd-MM-yyyy').format(DateTime.now()).obs;
  var endDate = DateFormat('dd-MM-yyyy').format(DateTime.now()).obs;
  

  selectStartDate() async {
    print("Date Picker Called");
    DateTime? pickedDate = await showDatePicker(context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 90)),
      currentDate: null,
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context,child){
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: secondaryColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: secondaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    startDate.value = DateFormat('dd-MM-yyyy').format(pickedDate!);
  }

  selectEndDate() async {
    print("Date Picker Called");
    DateTime? pickedDate = await showDatePicker(context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 90)),
      currentDate: null,
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context,child){
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: secondaryColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: secondaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    endDate.value = DateFormat('dd-MM-yyyy').format(pickedDate!);
  }



  @override
  void onInit() {
    getProjectData();
    super.onInit();
  }

  void getProjectData()async
  {
    print("valide");
    isLoading.value = true;
    var response = await ApiService().getProjectData();
    isLoading.value = false;
    print("Responseis there:${response['data'][0]['title']}");
    // String message = response['msg'];
    // // if (response.containsKey('status'))
    // // {
    // if (response['status'] == true)
    // {
    //   var dta=response['data'];
    //   return dta;
    // } else {
    //   print("some Thing Weng wrong");
    // }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
