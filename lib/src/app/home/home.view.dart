import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prod_mobile/src/app/app.module.dart';
import 'package:prod_mobile/src/app/app/main.dart';
import 'package:prod_mobile/src/app/components/appbar/appbar_component.dart';
import 'package:prod_mobile/src/app/components/home/notification.dart';
import 'package:prod_mobile/src/app/components/home/section_title.dart';
import 'package:prod_mobile/src/app/components/home/tracking.dart';
import 'package:prod_mobile/src/app/home/Assembly/Sps/ac1a1/ac1a1.view.dart';
import 'package:prod_mobile/src/app/home/profile_manager/profile_manager.dart';
import 'package:prod_mobile/src/app/qrscan/scan_view.dart';
import 'package:prod_mobile/src/themes/styles/style.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeStatefulWidget();
}

class _HomeStatefulWidget extends State<Home> {
  //final ScrollController _homeController = ScrollController();

  PopupMenuItem _buildPopupMenuItem(
      {required String title,
      required IconData iconData,
      required Function() onClick}) {
    return PopupMenuItem(
      onTap: () {
        onClick();
      },
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildItemCategory(
      Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50)),
            child: icon,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBarComponent(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              SizedBox(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileManagerScreen(),
                          ));
                    },
                    icon: Image.asset(
                      "assets/images/avt/avt.png",
                    ),
                  )),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Andrew Ainsley",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HelveticaNeueLight',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Admin",
                    style: TextStyle(
                      fontSize: 16,
                      //fontFamily: 'Roboto-bold'
                    ),
                  )
                ],
              ),
              const Spacer(),
              const Icon(
                FontAwesomeIcons.solidBell,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  Modular.to.pushNamed(AppModule.landing);
                },
                icon: const Icon(
                  FontAwesomeIcons.powerOff,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                  color: AppColor.textColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFEEEEEE),
                      offset: Offset(
                        1.0,
                        1.0,
                      ),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [

                        Expanded(
                          child: _buildItemCategory(
                            const Icon(
                              FontAwesomeIcons.pencil,
                              color: AppColor.primaryColor,
                              size: 22,
                            ),
                            AppColor.iconColor,
                            () {},
                            'eSign',
                          ),
                        ),
                        Expanded(
                          child: _buildItemCategory(
                            const Icon(
                              Icons.qr_code_scanner,
                              color: AppColor.primaryColor,
                              size: 22,
                            ),
                            AppColor.iconColor,
                            () {},
                            'Scan Code',
                          ),
                        ),
                        Expanded(
                          child: _buildItemCategory(
                            const Icon(
                              Icons.branding_watermark,
                              color: AppColor.primaryColor,
                              size: 22,
                            ),
                            AppColor.iconColor,
                            () {},
                            'Watermark',
                          ),
                        ),
                        Expanded(
                          child: _buildItemCategory(
                            const Icon(
                              Icons.content_cut,
                              color: AppColor.primaryColor,
                              size: 22,
                            ),
                            AppColor.iconColor,
                            () {
                              launch(
                                  'http://192.168.2.16:6868/app/main/inventory/ckd/containerrentalwhplan');
                            },
                            'Split PDF',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildItemCategory(
                            const Icon(
                              Icons.reorder,
                              color: AppColor.primaryColor,
                              size: 22,
                            ),
                            AppColor.iconColor,
                            () {},
                            'Merge',
                          ),
                        ),
                        Expanded(
                          child: _buildItemCategory(
                            const Icon(
                              Icons.vpn_key,
                              color: AppColor.primaryColor,
                              size: 22,
                            ),
                            AppColor.iconColor,
                            () {},
                            'Secure',
                          ),
                        ),
                        Expanded(
                          child: _buildItemCategory(
                            const Icon(
                              Icons.stream,
                              color: AppColor.primaryColor,
                              size: 22,
                            ),
                            AppColor.iconColor,
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const QRViewExample(),
                                  ));
                            },
                            'Scan Code',
                          ),
                        ),
                        Expanded(
                          child: _buildItemCategory(
                            const Icon(
                              Icons.apps,
                              color: AppColor.primaryColor,
                              size: 22,
                            ),
                            AppColor.iconColor,
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ac1a1(),
                                  ));
                            },
                            'All Tools',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 370,
              child: ListView(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  SectionTitle(
                    title: "My Request Tracking",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Tracking(
                    title: "David Smith",
                    content:
                        "Expense report for lastest accounts from Northwest region...",
                    date: "03/28/2023",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Tracking(
                    title: "Marry Jones",
                    content: "Budget plan for next quarter expense ...",
                    date: "03/20/2023",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SectionTitle(
                    title: "Notification",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  NotificationSection(
                    title: "Maintaince Schedule",
                    content:
                        "Small update on the application, we've fix the bug that cause ...",
                    date: "2 hours ago",
                    icon: Icon(
                      Icons.error_outline,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  NotificationSection(
                    title: "Maintaince Schedule",
                    content:
                        "Small update on the application, we've fix the bug that cause ...",
                    date: "2 hours ago",
                    icon: Icon(
                      Icons.error_outline,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
