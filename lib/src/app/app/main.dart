import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuApp extends StatelessWidget {
  const MenuApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const  Text("Menu App"),
        backgroundColor: Colors.red,
      ),
      body: bodyLending(),//Text('LENDING MENU'),

    );
  }
  bodyLending(){
    return Container(
      child: Column(

        children: [
          ExpansionTile(
            title: const Text("Assembly"),
            //leading: const Icon(Icons.book), //add icon
            childrenPadding: EdgeInsets.only(left:60), //children padding
            children: [
              ExpansionTile(
                title: Text("Sps"),
                children: [
                  ListTile(
                    title: const Text("A1 Engine"),
                    onTap: (){
                      launch('http://192.168.2.16:6868/screens/assemblyscreen?screen_code=ENGINE_LINE_A1');
                    },
                  ),
                  ListTile(
                    title: const Text("A1 Engine"),
                    onTap: (){
                      launch('http://192.168.2.16:6868/screens/assemblyscreen?screen_code=ENGINE_LINE_AC1_A1');
                    },
                  ),
                ],
              ),

              ListTile(
                title: const Text("Andon"),
                onTap: (){

                },
              ),

              //more child menu
            ],
          ),


          ExpansionTile(
            title: Text("Parent Category 2"),
            //leading: Icon(Icons.person), //add icon
            childrenPadding: EdgeInsets.only(left:60), //children padding
            children: [
              ListTile(
                title: Text("Child Category 1"),
                onTap: (){
                  //action on press
                },
              ),

              ListTile(
                title: Text("Child Category 2"),
                onTap: (){
                  //action on press
                },
              ),

              //more child menu
            ],
          )
        ],
      ),
    );
  }
}
