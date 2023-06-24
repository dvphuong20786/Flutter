import 'package:flutter/material.dart';
import 'package:prod_mobile/src/themes/styles/style.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({Key? key, required this.child, required this.title}) : super(key: key);

  final Widget title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.bgnen,
      body: Stack(
        children: [
          SizedBox(
            height: 200,
            child: AppBar(
              toolbarHeight: 90,
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              title: title,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 90),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: child,
          ),
        ],
      ),
    );
  }
}
