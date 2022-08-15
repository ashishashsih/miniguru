import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mini_guru/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  final GlobalKey<FormState>loginFormKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  var statusString = 'welcome'.obs;
  var codeSent = 'no'.obs;
  var myVerificationId = '1'.obs;

  String get result => statusString.value;
  String get codeSentResult => codeSent.value;
  String get verifyResult => myVerificationId.value;

  var isLoading = false.obs;

  late TextEditingController phoneNumber;
  late TextEditingController codeController;

  @override
  void onInit() {
    super.onInit();
    phoneNumber = TextEditingController();
    codeController = TextEditingController();
  }

  @override
    void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleLogin() async{
    isLoading.value=true;
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
     AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    await firebaseAuth.signInWithCredential(credential);
    Get.toNamed('/profile-page', arguments: firebaseAuth.currentUser);
    isLoading.value=false;
  }

  //Phone Number Login
  signInPhoneNumber({required String myPhoneNumber}) async {
    if(myPhoneNumber.length != 10){
      Get.snackbar(
          'Incorrect Number',
          'Please Provide 10 digit Phone Number',
          margin: const EdgeInsets.all(20),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: redColor.withOpacity(0.6),
      );
    }else{
      await firebaseAuth.verifyPhoneNumber(
        //Pass in the phone number
        phoneNumber: '+91'+myPhoneNumber,
        //Triggers if phone number is verified
        verificationCompleted: (_){},
        //triggers if verification fails
        verificationFailed: (FirebaseException exception){
          statusString.value = 'Error Verifying Your Phone Number';
        },
        //triggered when firebase sends a code
        codeSent: (verificationId,responseToken){
          print('Code Sent triggered');
          codeSent.value = 'yes';
          print(codeSent.value);
          myVerificationId.value = verificationId;
          isLoading.value = false;
        },
        //get a new code after timeout
        codeAutoRetrievalTimeout: (_){},
        //Time in which the code is valid
        timeout: const Duration(seconds:120),
      );
    }

  }

  //OTP Verification
  myCredentials(String verId, String userId) async
  {
    final prefs = await SharedPreferences.getInstance();
    AuthCredential authCredential = PhoneAuthProvider.credential(verificationId: verId, smsCode: userId);
    firebaseAuth.signInWithCredential(authCredential).then((UserCredential){
      //Checking Login Using Shared Preferences
      prefs.setString('userId', "11547");
      prefs.setBool('isLogin', true);
      //if successful move to home page,
      Get.toNamed('profile-page', arguments: {"phoneNumber": phoneNumber.text});
    }).catchError((e){
      print('Error Message :- ${e}');
    });

  }
}
