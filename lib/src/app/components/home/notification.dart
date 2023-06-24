import 'package:flutter/material.dart';
import 'package:prod_mobile/src/themes/styles/style.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({Key? key, required this.title, required this.content, required this.date, required this.icon}) : super(key: key);
  final String title;
  final String content;
  final String date;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: icon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 8, top: 5),
              child: SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text(content,style: const TextStyle(fontSize: 14,color: Colors.grey),overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                Text(date),
              ],
            )
          ],
        ),
      ),
    );
  }
}