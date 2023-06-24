
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prod_mobile/src/app/app.view.dart';
import 'package:prod_mobile/src/app/home/home.module.dart';
import 'package:prod_mobile/src/app/login/login.view.dart';
import 'package:prod_mobile/src/app/otp/otpscreen.dart';



class AppModule extends Module {
  static String landing = '/';
  static String home = '/home/';
  static String otp = '/otp/';


  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
    //Bind((i) => HomeModule(), export: true)
  ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(home,
            module: HomeModule(),
            transition: TransitionType.rightToLeftWithFade),
        ChildRoute(landing,
            child: (context, args) => const LoginWidget(),
            transition: TransitionType.scale),

        ChildRoute(otp,
        child: (context, args) => const OtpScreen(),
        transition: TransitionType.scale),
      ];

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  Widget get bootstrap => const AppWidget();
}
