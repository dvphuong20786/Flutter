import 'package:flutter/material.dart';
import 'package:prod_mobile/src/themes/styles/style.dart';

class Tracking extends StatelessWidget {
  const Tracking({Key? key, required this.title, required this.content, required this.date}) : super(key: key);
  final String title;
  final String content;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                "assets/images/avt/avt.png",
                fit: BoxFit.cover,
                width: 40,
                height: 40,
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
                        const Text(
                          "To: ",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
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
                const Text("Detail",style: TextStyle(
                  fontSize: 14,
                  color: AppColor.primaryColor,
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
