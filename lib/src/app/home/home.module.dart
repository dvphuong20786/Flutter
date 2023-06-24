import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prod_mobile/src/app/app.module.dart';
import 'package:prod_mobile/src/app/app.view.dart';
import 'package:prod_mobile/src/app/app/main.dart';
import 'package:prod_mobile/src/app/home/Assembly/Sps/AssemblyScreen/AssemblyScreen.dart';
import 'package:prod_mobile/src/app/home/Assembly/Sps/ac1a1/ac1a1.view.dart';
import 'package:prod_mobile/src/app/home/home.view.dart';
import 'package:prod_mobile/src/app/qrscan/scan_view.dart';

class HomeModule extends Module {
  static String landing = '/';
  static String home = '/home/';
  static String otp = '/otp/';
  static String esign = '/esign';
  static String merge = '/merge';


  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
  ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
    ChildRoute(landing,
        child: (context, args) => const ac1a1(),
        transition: TransitionType.scale),
    ChildRoute(home,
        child: (context, args) => const MenuApp(),
        transition: TransitionType.scale),
    ChildRoute(home,
        child: (context, args) => const QRViewExample(),
        transition: TransitionType.scale),
    ChildRoute(esign,
        child: (context, args) => const QRViewExample(),
        transition: TransitionType.scale),
    ChildRoute(merge,
        child: (context, args) => const QRViewExample(),
        transition: TransitionType.scale),
  ];

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  Widget get bootstrap => const AppWidget();
}
