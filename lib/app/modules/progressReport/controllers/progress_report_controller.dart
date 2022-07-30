import 'dart:convert';

import 'package:get/get.dart';
import 'package:mini_guru/app/modules/model/MaterialChartData.dart';
import 'package:mini_guru/others/api_service.dart';

class ProgressReportController extends GetxController {
  //TODO: Implement ProgressReportController

  final count = 0.obs;
  var isLoading=false.obs;
  var chartData=<Map<String,dynamic>>[].obs;
  var cData=<MaterialChartData>[].obs;
  //List<Map<String,dynamic>> cData=[];
  var total_project=0.obs;
  var complete_project=0.obs;
    // MaterialChartData(domain: "Pin", measure:34),
    // MaterialChartData(domain: "Board", measure: 1),
    // MaterialChartData(domain: "Paint", measure: 2),
    // MaterialChartData(domain: "Motor", measure: 7),
    // MaterialChartData(domain: "Glue", measure: 2),
  //].obs;

  @override
  void onInit()
  {
    super.onInit();
    getProjectProgressData();
  }

  getProjectProgressData() async
  {

    isLoading.value = true;
    var response = await ApiService().getProjectProcessData();
    isLoading.value = false;
    //print("Responseis there:${response['categoryList'][0]['title']}");
    //print(response);
    total_project.value=jsonDecode(response['total_project'].toString());
    complete_project.value=response['complete_project'];
    print(response['progressList']);
    cData.value =materialChartDataFromJson(jsonEncode(response['progressList']));
    print("${total_project}:done:${complete_project}#fine:${cData.value.length}");
    for (var i = 0; i < cData.length; i++)
    {
      chartData.add({"domain":cData[i].domain,"measure":cData[i].measure});
    }
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
