import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/login/controllers/login_controller.dart';
import 'package:mini_guru/constants.dart';
import 'package:mini_guru/others/api_service.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ProfilePageController extends GetxController {
  final geoLocator = Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
  Position ?currentPosition;
  var currentAddress = "".obs;
  late String phoneNumber;
  var isLocationLoading = false.obs;
  final GlobalKey<FormState>profileFormKey=GlobalKey<FormState>();

  late TextEditingController studentNameController;
  late TextEditingController parentNameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController schoolNameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;

  var studentName="".obs;
  var parentName="".obs;
  var schoolName="".obs;
  var mobile="".obs;
  var email="".obs;
  var gender="".obs;
  var gender_type="Boy".obs;

  var isLoading=false.obs;
  var dateOfBirth = DateFormat('dd-MM-yyyy').format(DateTime.now()).obs;
  final count = 0.obs;
  @override
  void onInit() async
  {
    studentNameController=TextEditingController();
    parentNameController=TextEditingController();
    schoolNameController=TextEditingController();
    mobileController=TextEditingController();
    emailController=TextEditingController();
    await Geolocator.requestPermission();
    super.onInit();
    getProfile();
  }

  void setGender(var type)
  {
    gender.value=type;
    gender_type.value=type;
    print(gender.value);
  }

  @override
  void onReady() async{
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String? validateText(String value,String msg)
  {
    print(value+msg);
    if(value.length<1)
    {
      return "$msg required";
    }
    return null;
  }

  String? validateLength(String value,int nmr,String msg)
  {
    if(value.length!=nmr)
    {
      return "Invaild $msg";
    }
    return null;
  }

  void getCurrentLocation() async {
    isLocationLoading.value = true;
    print('Location Service Started');
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
        currentPosition = position;
      getAddressFromLatLng();
        isLocationLoading.value = false;
    }).catchError((e) {
      print(e);
    });
  }

  void getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.longitude);
      Placemark place = p[0];
        currentAddress.value = "${place.thoroughfare}${place.subThoroughfare}, ${place.subLocality}, ${place.administrativeArea}";
    } catch (e) {
      print(e);
    }
  }
  void updateNow()
  {
    final isValid=profileFormKey.currentState!.validate();
    print(isValid);
    if(!isValid)
    {
      // Get.snackbar(
      //   'Incorrect Number',
      //   'Please Provide 10 digit Phone Number',
      //   margin: const EdgeInsets.all(20),
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: redColor.withOpacity(0.6),
      // );
      return;
    }else
    {
      setProfile();
      return;
    }
  }

  void getProfile()async
  {
    final prefs = await SharedPreferences.getInstance();
    studentName.value=prefs.getString('studentName')!;
    parentName.value=prefs.getString('parentName')!;
    dateOfBirth.value=prefs.getString('dateOfBirth')!;
    schoolName.value=prefs.getString('schoolName')!;
    mobile.value=prefs.getString('mobile')!;
    email.value=prefs.getString('email')!;
    gender.value=prefs.getString('gender')!;
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

  void setProfile()async
  {
    print("valide");
    isLoading.value = true;
    var response = await ApiService().setProfile(studentName.value,parentName.value,dateOfBirth.value,schoolName.value,mobile.value,email.value,gender.value,gender_type.value);
    isLoading.value = false;
    print("Responseis there:${response['data'][0]['studentName']}");

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', "11547");
    prefs.setString('studentName',response['data'][0]['studentName']);
    prefs.setString('parentName',response['data'][0]['parentName']);
    prefs.setString('dateOfBirth',response['data'][0]['dateOfBirth']);
    prefs.setString('schoolName',response['data'][0]['schoolName']);
    prefs.setString('mobile',response['data'][0]['mobile']);
    prefs.setString('email',response['data'][0]['email']);
    prefs.setString('gender',response['data'][0]['gender']);
    Get.toNamed('/bottom-bar');
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

  selectDateOfBirth() async {
    print("Date Picker Called");
    DateTime? pickedDate = await showDatePicker(context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      currentDate: null,
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context,child){
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
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
    dateOfBirth.value = DateFormat('dd-MM-yyyy').format(pickedDate!);
  }

  // void getImage(ImageSource imageSource) async
  // {
  //   final pickedFile = await ImagePicker().pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImgePath.value = pickedFile.path;
  //     selectedImageSize.value =
  //         ((File(selectedImgePath.value)).lengthSync() / 1024 / 1024)
  //             .toStringAsFixed(2) + "Mb";
  //
  //     // final cropImageFile = await ImageCropper().cropImage(
  //     //     sourcePath: selectedImgePath.value, maxHeight: 512, maxWidth: 512,
  //     //     compressFormat: ImageCompressFormat.jpg);
  //     // cropImagePath.value = cropImageFile!.path;
  //     // cropImageSize.value =
  //     //     ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
  //     //         .toStringAsFixed(2) + "Mb";
  //
  //     final dir = await Directory.systemTemp;
  //     final targetPath = dir.absolute.path + "/temp.jpg";
  //     var compressedFile = await FlutterImageCompress.compressAndGetFile(
  //         selectedImgePath.value, targetPath, quality: 90);
  //     compressImagePath.value = compressedFile!.path;
  //     print(compressImagePath.value);
  //     // compressImageSize.value =
  //     //     ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
  //     //         .toStringAsFixed(2) + "Mb";
  //     // updateImage();
  //
  //   }
  //   else {
  //     mySnackbar("Error", "No Image Selected", Colors.red, Colors.white,
  //         SnackPosition.BOTTOM);
  //   }
  // }


  // void updateImage() async
  // {
  //   isLoading.value = true;
  //   var base64Image = base64Encode(File(cropImagePath.value).readAsBytesSync());
  //   var response = await ApiService().uploadImage(base64Image);
  //   print(response);
  //   isLoading.value = false;
  //   String message = response['message'];
  //   if (response.containsKey('status'))
  //   {
  //     if (response['status'] == true)
  //     {
  //       print('Response from server: $response');
  //       print(message);
  //       final prefs = await SharedPreferences.getInstance();
  //       prefs.setString("profileImage", response['imageName']);
  //       print("ImageUrlis here${prefs.getString("profileImage")}");
  //       print("ImageUrlis here${response['imageName']}");
  //       Fluttertoast.showToast(msg: "Image Uploaded Succcessfully");
  //       //getUserProfile();
  //       //Get.bottomSheet(Text("Profile Image Updated Successfully"));
  //       // if (type == "manage" || type == null)
  //       // {
  //       //   Get.back(result: true);
  //       // } else {
  //       //   Get.toNamed("/address?type=payment&amt=" + amt.toString());
  //       // }
  //       //Get.back();
  //     } else if (response['status'] == false) {}
  //   } else {
  //     print("some Thing Weng wrong");
  //   }
  // }
}