import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mini_guru/app/modules/bottomBar/views/bottom_bar_view.dart';
import 'package:mini_guru/app/modules/onBoarding/views/on_boarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

bool? isLogin;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  isLogin = prefs.getBool('isLogin');
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins'),
          title: "MiniGuru",
          home: isLogin == true ? BottomBarView() : const OnBoardingView(),
          getPages: AppPages.routes,

        );
      },
    );
  }
}
