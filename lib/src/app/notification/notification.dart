import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Thông báo",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),),
        backgroundColor: Colors.red,
      ),
    );
  }
}
