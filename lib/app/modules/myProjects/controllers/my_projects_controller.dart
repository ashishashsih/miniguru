import 'package:get/get.dart';
import 'package:mini_guru/others/api_service.dart';

class MyProjectsController extends GetxController {
  //TODO: Implement MyProjectsController

  final count = 0.obs;
  var isLoading=false.obs;
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
