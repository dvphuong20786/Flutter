import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prod_mobile/src/app/home/Assembly/Sps/AssemblyScreen/common.dart';
import 'package:prod_mobile/src/app/home/Assembly/Sps/ac1a1/ac1a1.data.dart';
import 'package:prod_mobile/src/repositories/aseembly/aseembly.repository.dart';

class ac1a1 extends StatefulWidget {
  const ac1a1({Key? key}) : super(key: key);

  @override
  State<ac1a1> createState() => _ac1a1State();
}


class _ac1a1State extends State<ac1a1> {
  Decoration boxTitle = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: Color(0xFF00FF66),
    // border: Border(top: BorderSide(color: Color(0xFF05A900)),
    //                left: BorderSide(color: Color(0xFF05A900))),
  );
  Ac1a1Data _cubit = Ac1a1Data(AseemblyRepository());
  Common common =  Common();
  @override
  void initState(){
    super.initState();
   // _ac1a1data.loadData();
   _cubit.loadData();

    Timer? _timer;

    callBack(){
      common.clearTimeout(_timer!);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {

    TextStyle _text1Style = TextStyle( color: Colors.black87, fontWeight: FontWeight.w800,  fontSize: 20, );
    TextStyle _titleStyle = TextStyle( color: Colors.black87, fontWeight: FontWeight.w800,  fontSize: 20, );
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Next page'),
      // ),
      body: bindScreen(),
      // floatingActionButton: FloatingActionButton(
      //  // onPressed: callBack,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.arrow_back_rounded),
      // ),
    );
  }


  bindScreen() {

    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,   //
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height - 24,  //24px : pin, time....
            // width:  MediaQuery.of(context).size.width - 50,
            // color: Colors.yellow,
            child: Column(
              children: [
                Expanded(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // children: List.generate(item.length, (index) {
                    //   return Container (
                    //     width: 150,
                    //     child: Column (
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       // children: [Text('Item $index', style: (index==0)? _titleStyle : _text1Style, ),],
                    //       children: [
                    //         Expanded (
                    //           child: Container (
                    //             decoration: boxTitle,
                    //             // color: _colorTitle,
                    //             margin: EdgeInsets.all(2.0),
                    //             child: Row (
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: <Widget>[
                    //                   //Text(style: _titleStyle),
                    //                 ]
                    //             ),
                    //           ),
                    //           flex: 1,
                    //         ),
                    //         Expanded (
                    //           child: Container (
                    //             //decoration: boxTextColor(item[index].ModelName.toLowerCase()),
                    //             // color: Color(0xFFB0FFCE),
                    //             margin: EdgeInsets.all(2.0),
                    //             child: Row (
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: <Widget>[
                    //                  // Text(item[index].Grade, style: _text1Style),
                    //                 ]
                    //             ),
                    //           ),
                    //           flex: 1,
                    //         ),
                    //         Expanded (
                    //           child: Container (
                    //             //decoration: boxTextColor(item[index].ModelName.toLowerCase()),
                    //             // color: _colorText1,
                    //             margin: EdgeInsets.all(2.0),
                    //             child: Row (
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: <Widget>[
                    //                  // Text(item[index].ModelName, style: _text2Style),
                    //                 ]
                    //             ),
                    //           ),
                    //           flex: 1,
                    //         ),
                    //         Expanded (
                    //           child: Container (
                    //             //decoration: boxTextColor(item[index].ModelName.toLowerCase()),
                    //             // color: _colorText1,
                    //             margin: EdgeInsets.all(2.0),
                    //             child: Row (
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: <Widget>[
                    //                 // Text(item[index].SeqNo, style: _text3Style),
                    //                 ]
                    //             ),
                    //           ),
                    //           flex: 1,
                    //         ),
                    //       ],
                    //     ),
                    //     // flex: 1,
                    //   );
                    // }
                    // ),
                  ),
                  // flex: 1,
                )
              ],
            )
        ),
      ],
    );

  }
}
