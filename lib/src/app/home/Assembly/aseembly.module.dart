import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:prod_mobile/src/app/app.module.dart';
import 'package:prod_mobile/src/app/app.view.dart';
import 'package:prod_mobile/src/app/app/main.dart';
import 'package:prod_mobile/src/app/home/home.view.dart';
import 'package:prod_mobile/src/app/qrscan/scan_view.dart';

class AseemblyModule extends Module {
  static String landing = '/';
  static String sps = 'sps';
  static String andon = 'andon';


  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
  ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
    ChildRoute(sps,
        child: (context, args) => const MenuApp(),
        transition: TransitionType.scale),
    ChildRoute(andon,
        child: (context, args) => const QRViewExample(),
        transition: TransitionType.scale),

  ];

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  Widget get bootstrap => const AppWidget();
}
