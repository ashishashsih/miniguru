import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_guru/app/modules/model/MaterialList.dart';
import 'package:mini_guru/constants.dart';
import 'package:mini_guru/others/NameIdModel.dart';
import 'package:mini_guru/others/api_service.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProjectsController extends GetxController
{
  //TODO: Implement MyProjectsController
  final GlobalKey<FormState>profileFormKey=GlobalKey<FormState>();
  final price = 0.obs;
  var isLoading=false.obs;
  var dateOfBirth="07/05/1999".obs;
  var startDate = DateFormat('dd-MM-yyyy').format(DateTime.now()).obs;
  var endDate = DateFormat('dd-MM-yyyy').format(DateTime.now()).obs;
  var ageGroup=0.obs;
  var sketch=''.obs;
  late TextEditingController editingControllerTitle;
  late TextEditingController editingControllerDescription;
  var projectTitle="".obs;
  var projectDescription="".obs;
  var selectedAgeGroup=1.obs;
  var materialList=<MaterialModel>[].obs;

  var filteredProductList=<MaterialModel>[].obs;
  var selectedProductList=<MaterialModel>[].obs;

  var selectedIds=<int>[].obs;
  var selectedItems=<String>[].obs;

  late TextEditingController searchController;

  //var ageList = <NameIdModel>[].obs;
  var ageList = <NameIdModel>[NameIdModel(id: 1, name: '5-7'),NameIdModel(id: 2, name: '7-10'),NameIdModel(id: 3, name: '10-13')].obs;

  String? validateText(String value,String msg)
  {
    print(value+msg);
    if(value.length<1)
    {
      return "$msg required";
    }
    return null;
  }

  void calculateItemDetail()
  {
    selectedIds.clear();
    selectedItems.clear();
    selectedProductList.clear();
    selectedProductList.value=filteredProductList.where((element) => element.selected).toList();
    for(var i=0;i<selectedProductList.length;i++)
      {
        selectedIds.add(selectedProductList[i].id);
        selectedItems.add(selectedProductList[i].productName);
      }
    print("work now${selectedIds.length}");
    Get.back();
  }

  filterNow(String value)
  {
    print("SearchinString is here:${value}");
    if(searchController.text.isEmpty)
    {
      filteredProductList.value=materialList;
    }else
    {
      var cnvVal=value.toLowerCase();
      filteredProductList.value=materialList;
      filteredProductList.value=materialList.where((element) => element.productName.toLowerCase().contains(cnvVal)).toList();
    }
    print("SearchinString is here:${filteredProductList.length}");
  }

  void getProductData()async
  {
    print("valide");
    isLoading.value = true;
    var response = await ApiService().getMaterialList();
    print("material response is here:-${response}");
    isLoading.value = false;
    materialList.value=materialModelFromJson(jsonEncode(response['product_list']));
    filteredProductList.value=materialModelFromJson(jsonEncode(response['product_list']));
  }


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
              primary: primaryColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    startDate.value = DateFormat('dd-MM-yyyy').format(pickedDate!);
  }

  Color generateRandomColor() {
    // Define all colors you want here
    const predefinedColors = [
      primaryColor,
      secondaryColor,
      redColor,
      greenColor,
    ];
    Random random = Random();
    return predefinedColors[random.nextInt(predefinedColors.length)];
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
              primary: primaryColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: primaryColor, // button text color
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
  void onInit()
  {
  //    getProjectData();
    super.onInit();
    getProductData();
    getAge();
    searchController=TextEditingController();
    editingControllerTitle=TextEditingController();
    editingControllerDescription=TextEditingController();
  }

  void createProject()async
  {
    final isValid=profileFormKey.currentState!.validate();
    print(isValid);
    if(!isValid)
    {
      return;
    }else
    {
      isLoading.value = true;
      var response = await ApiService().createProject(projectTitle.value,projectDescription.value,startDate.value,endDate.value,sketch.value,selectedAgeGroup.value.toString());
      isLoading.value = false;
      Fluttertoast.showToast(msg: response['msg']);
    }
    //print("Responseis there:${response['status']}");
  }

  // void getProjectData()async
  // {
  //   print("valide");
  //   isLoading.value = true;
  //   var response = await ApiService().getProjectData();
  //   isLoading.value = false;
  //   print("Responseis there:${response['data'][0]['title']}");
  //   // String message = response['msg'];
  //   // // if (response.containsKey('status'))
  //   // // {
  //   // if (response['status'] == true)
  //   // {
  //   //   var dta=response['data'];
  //   //   return dta;
  //   // } else {
  //   //   print("some Thing Weng wrong");
  //   // }
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getImage(ImageSource imageSource) async{
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if(pickedFile != null){
      sketch.value = pickedFile.path;
    } else {
      Get.snackbar(
        'Error',
        'No Image Selected',
        margin: const EdgeInsets.all(20),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor,
        colorText: Colors.white,
      );
    }
  }

  getAge()async
  {
    final prefs = await SharedPreferences.getInstance();
    dateOfBirth.value=prefs.getString('dateOfBirth')!;
    Fluttertoast.showToast(msg: "Age is:${dateOfBirth.value}");
    DateTime tempDate = new DateFormat("dd/MM/yyyy").parse(dateOfBirth.value);
    DateTime today = DateTime.parse("2022-10-10");

    var age = today.year-tempDate.year;//today.getFullYear() - tempDate.getFullYear();
    Fluttertoast.showToast(msg: "Age is:${age}");
    // var m = today.getMonth() - birthDate.getMonth();
    // if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate()))
    // {
    // age--;
    // }
    //return age;
  }
}
