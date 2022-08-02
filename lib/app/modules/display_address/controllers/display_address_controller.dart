import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DisplayAddressController extends GetxController
{
  //TODO: Implement DisplayAddressController

  final count = 0.obs;
  Razorpay ?razorpay;
  var transactionId="".obs;
  @override
  void onInit() {
    razorpay = new Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
    super.onInit();
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response)
  {
    transactionId.value=response.paymentId.toString();
    print("response id is here:$transactionId");
    //getData();
    orderNow();
    // Fluttertoast.showToast(
    //     msg: "Success",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: successColor,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
  }

  void orderNow() {

  }

  void handlerErrorFailure(){
    print("Pament error");
    Fluttertoast.showToast(
        msg: "error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void handlerExternalWallet(){
    Fluttertoast.showToast(
        msg: "Wallet",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.lightGreen,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void openCheckout(String amt)
  {
    var options = {
      'key': 'rzp_live_sop6uxg5y055jc',
      'amount': amt,
      'name': "Mini Guru",
      'description': 'Plan is here',
      'prefill': {
        'contact': "8878434866", 'email': "ashish.ujn2010@gmail.com"
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try{
      razorpay!.open(options);
    }catch(e){
      print(e.toString());
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay!.clear();
  }

  payNow(String amount)
  {
  openCheckout(amount);
  }
}
