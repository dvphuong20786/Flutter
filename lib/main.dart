import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prod_mobile/src/app/app.module.dart';
import 'package:prod_mobile/src/app/app.view.dart';
import 'package:prod_mobile/src/app/home/home.view.dart';
import 'package:prod_mobile/src/app/login/login.view.dart';
import 'package:prod_mobile/src/routers/application.dart';
import 'package:prod_mobile/src/utils/shared_preferences.dart';





class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MaterApp",
      routes: {
        //'login' : (_) => LoginView(),
        'home' : (_) => Home()
      },
      //initialRoute là một thuộc tính của widget MaterialApp,
      // cho phép bạn chỉ định tuyến đường (route) mặc định được hiển thị khi ứng dụng được khởi động.
      initialRoute: 'login',
    );
  }
}



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<void> main() async {
  // Ensure that Flutter framework's binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  // Init sharePreference
  Application.sharePreference = await SpUtil.getInstance();
  runApp(ModularApp(module: AppModule(), child: AppWidget(),));
 // runApp(MyApp());
  //runApp(HomeView());
  // void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
