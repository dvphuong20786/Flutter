import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:prod_mobile/src/Models/AssemblyScreen/AssemblyScreenItem.dart';
import 'package:prod_mobile/src/Models/AssemblyScreen/AssemblyScreenList.dart';
import 'dart:async';

import 'package:prod_mobile/src/Models/AssemblyScreen/AssemblyScreenItem.dart';
import 'package:prod_mobile/src/app/home/Assembly/Sps/AssemblyScreen/common.dart';


class AssemblyScreen extends StatefulWidget {
  const AssemblyScreen(): super();

  @override
  State<AssemblyScreen> createState() => _AssemblyScreen();

}

class _AssemblyScreen extends State<AssemblyScreen> {

  _AssemblyScreen(){
    repeatData();
  }

  List<AssemblyScreenItem> AssemblyScreenData = <AssemblyScreenItem>[];

  Common common =  Common();
  final Color _colorTitle = Color(0xFF00FF66);
  final Color _colorText1 = Color(0xFFB0FFCE);

  TextStyle _titleStyle = TextStyle( color: Color(0xFF020503), fontWeight: FontWeight.w900,  fontSize: 34,letterSpacing: -1);
  TextStyle _text1Style = TextStyle( color: Color(0xFF020503), fontWeight: FontWeight.w900,  fontSize: 38,letterSpacing: -1);
  TextStyle _text2Style = TextStyle( color: Color(0xFF020503), fontWeight: FontWeight.w800,  fontSize: 22,letterSpacing: -1 );
  TextStyle _text3Style = TextStyle( color: Color(0xFF020503), fontWeight: FontWeight.w800,  fontSize: 20,letterSpacing: -1 );

  // overflow: TextOverflow.clip,
  Decoration boxTitle = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
     color: Color(0xFF00FF66),
     // border: Border(top: BorderSide(color: Color(0xFF05A900)),
     //                left: BorderSide(color: Color(0xFF05A900))),
   );
  Decoration boxText = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: Color(0xFFB0FFCE),
    // border: Border(top: BorderSide(color: Color(0xFF05A900)),
    //                left: BorderSide(color: Color(0xFF05A900))),
  );


  final List<int> _items = List<int>.generate(10, (int index) => index);
  final List<int> _subitems = List<int>.generate(4, (int subindex) => subindex);

  int _count = 0;

  void reBuildState() {
    if(mounted) {
      setState(() {
        // Update state here


      });
    }
  }



  @override
  Widget build(BuildContext context) {
    if(_count > 0) print('--------------------REBUILD--------------------');


    if(AssemblyScreenData.length > 0) {
      return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Next page'),
        // ),
        body: bindScreen(AssemblyScreenData),
        floatingActionButton: FloatingActionButton(
          onPressed: callBack,
          tooltip: 'Increment',
          child: Icon(Icons.arrow_back_rounded),
        ),
      );
    }
    else{
      return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Next page'),
        // ),
        body: Text('Loading...'),
        floatingActionButton: FloatingActionButton(
          onPressed: callBack,
          tooltip: 'Increment',
          child: Icon(Icons.arrow_back_rounded),
        ),
      );
    }
  }
  @override
  void dispose() {
    super.dispose();
  }
  callBack(){
    common.clearTimeout(_timer!);
    Navigator.of(context).pop();
  }

  body1(){

    TextStyle _text1Style = TextStyle( color: Colors.black87, fontWeight: FontWeight.w800,  fontSize: 20, );
    TextStyle _titleStyle = TextStyle( color: Colors.black87, fontWeight: FontWeight.w800,  fontSize: 20, );

    return Container(
      //decoration: BoxDecoration(color: Colors.blue.shade100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Color(0xFF00FF66),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('row aaa', style: _titleStyle,),
                          ]
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('row 2', style: _text1Style)
                        ]
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('row 3', style: _text1Style)
                      ]
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           Text('row 4', style: _text1Style, textAlign: TextAlign.center),
                        ]
                    ),
                    flex: 1,
                  ),
                ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Column (
                children: <Widget> [
                  Expanded(
                    child: Container(
                      color: Color(0xFF00FF66),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('row aaa', style: _titleStyle,),
                          ]
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('row 2', style: _text1Style)
                        ]
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('row 3', style: _text1Style)
                        ]
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('row 4', style: _text1Style, textAlign: TextAlign.center),
                        ]
                    ),
                    flex: 1,
                  ),
                ],
              ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xFF00FF66),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('row aaa', style: _titleStyle,),
                        ]
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('row 2', style: _text1Style)
                      ]
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('row 3', style: _text1Style)
                      ]
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('row 4', style: _text1Style, textAlign: TextAlign.center),
                      ]
                  ),
                  flex: 1,
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xFF00FF66),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('row aaa', style: _titleStyle,),
                        ]
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('row 2', style: _text1Style)
                      ]
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('row 3', style: _text1Style)
                      ]
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('row 4', style: _text1Style, textAlign: TextAlign.center),
                      ]
                  ),
                  flex: 1,
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
               children: [
                 Expanded(
                   child: Container(
                     color: Color(0xFF00FF66),
                     child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Text('row aaa', style: _titleStyle,),
                         ]
                     ),
                   ),
                   flex: 1,
                 ),
                 Expanded(
                   child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text('row 2', style: _text1Style)
                       ]
                   ),
                   flex: 1,
                 ),
                 Expanded(
                   child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text('row 3', style: _text1Style)
                       ]
                   ),
                   flex: 1,
                 ),
                 Expanded(
                   child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text('row 4', style: _text1Style, textAlign: TextAlign.center),
                       ]
                   ),
                   flex: 1,
                 ),
               ],
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  bindScreen2(List<AssemblyScreenItem> item) {

    return ListView(
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
                  children: List.generate(item.length, (index) {
                    return Expanded (
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        // children: [Text('Item $index', style: (index==0)? _titleStyle : _text1Style, ),],
                        children: [
                          Expanded (
                            child: Container (
                              decoration: boxTitle,
                              // color: _colorTitle,
                              margin: EdgeInsets.all(2.0),
                              child: Row (
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(item[index].Process, style: _titleStyle),
                                  ]
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded (
                            child: Container (
                              decoration: boxTextColor(item[index].ModelName.toLowerCase()),
                              // color: Color(0xFFB0FFCE),
                              margin: EdgeInsets.all(2.0),
                              child: Row (
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(item[index].Grade, style: _text1Style),
                                  ]
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded (
                            child: Container (
                            decoration: boxTextColor(item[index].ModelName.toLowerCase()),
                              // color: _colorText1,
                              margin: EdgeInsets.all(2.0),
                              child: Row (
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(item[index].ModelName, style: _text2Style),
                                  ]
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded (
                            child: Container (
                              decoration: boxTextColor(item[index].ModelName.toLowerCase()),
                              // color: _colorText1,
                              margin: EdgeInsets.all(2.0),
                              child: Row (
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(item[index].SeqNo, style: _text3Style),
                                  ]
                              ),
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      flex: 1,
                    );
                  }),
                ),
                flex: 1,
              )
            ],
          )
        ),
      ],
    );

  }

  bindScreen(List<AssemblyScreenItem> item) {

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
                    children: List.generate(item.length, (index) {
                      return Container (
                        width: 150,
                        child: Column (
                          mainAxisAlignment: MainAxisAlignment.center,
                          // children: [Text('Item $index', style: (index==0)? _titleStyle : _text1Style, ),],
                          children: [
                            Expanded (
                              child: Container (
                                decoration: boxTitle,
                                // color: _colorTitle,
                                margin: EdgeInsets.all(2.0),
                                child: Row (
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(item[index].Process, style: _titleStyle),
                                    ]
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded (
                              child: Container (
                                decoration: boxTextColor(item[index].ModelName.toLowerCase()),
                                // color: Color(0xFFB0FFCE),
                                margin: EdgeInsets.all(2.0),
                                child: Row (
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(item[index].Grade, style: _text1Style),
                                    ]
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded (
                              child: Container (
                                decoration: boxTextColor(item[index].ModelName.toLowerCase()),
                                // color: _colorText1,
                                margin: EdgeInsets.all(2.0),
                                child: Row (
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(item[index].ModelName, style: _text2Style),
                                    ]
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded (
                              child: Container (
                                decoration: boxTextColor(item[index].ModelName.toLowerCase()),
                                // color: _colorText1,
                                margin: EdgeInsets.all(2.0),
                                child: Row (
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(item[index].SeqNo, style: _text3Style),
                                    ]
                                ),
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                        // flex: 1,
                      );
                    }),
                  ),
                  // flex: 1,
                )
              ],
            )
        ),
      ],
    );

  }

  _listViewBody_bk() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          // width:  MediaQuery.of(context).size.width,
          color: Colors.yellow,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_items.length, (index) {
              return Expanded (
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  // children: [Text('Item $index', style: (index==0)? _titleStyle : _text1Style, ),],
                  children: List.generate(_subitems.length, (subindex) {
                    return Expanded (
                      child: Container (
                        color: (subindex==0)? _colorTitle : _colorText1,
                        child: Row (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Item $subindex', style: (subindex==0)? _titleStyle : _text2Style, ),
                            ]
                        ),
                      ),
                      flex: 1,
                    );
                  }),
                ),
                flex: 1,
              );
            }),
          ),
        ),
      ],
    );

  }

  buildLayout(_data) {
    try {
      //var objdata = AssemblyScreenItem.fromJson(_data[0]);
       AssemblyScreenData = (_data as List)
          .map((e) =>
       AssemblyScreenItem.fromJson(e as Map<String, dynamic>)).toList();
      // AssemblyScreenData =  objdata.items.sublist(0,5);
      print(AssemblyScreenData);
      reBuildState();
    }
    catch(e){
      print('----------------error----------------');
      print(e.toString());
    }
  }

  Timer? _timer;
  repeatData(){
    try {
      getData().asStream().listen((_result) {
        if (_result != null) {
          _count++;
          print('--------------- listen getData(): OK ($_count)---------------');
          buildLayout(_result);
        }
      });

      // common.clearTimeout(_timer);
      _timer = common.setTimeout(repeatData,5000);

    }catch(ex) {
      print(ex.toString()); // Prints "throws" after 2 seconds.
      // common.clearTimeout(_timer);
      _timer = common.setTimeout(repeatData,5000);
    }
  }

  boxTextColor(m) {

    Color? _c;
    if (m == "camry") {
      _c = Color(0xFFFF99CC); //  "#FF99CC";
    } else if (m == "vios") {
      _c = Color(0xFFFABF8F); // "#FABF8F";
    } else if (m == "avanza") {
      _c = Color(0xFF8DB4E2); // "#8DB4E2";
    } else if (m == "fortuner") {
      _c = Color(0xFF000FF0); // "#ff0";
    } else if (m == "innova") {
      _c = Color(0xFFC8C09D); // "#c8c09d";
    }


    return BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: _c,
      // border: Border(top: BorderSide(color: Color(0xFF05A900)),
      //                left: BorderSide(color: Color(0xFF05A900))),
    );
  }

  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 30000),
      contentType: 'application/json; charset=utf-8',
    ),
  );

  Future getData() async {

    //http://192.168.3.12:4500/
    //http://192.168.2.16:3333/
    var _result;
    //data
    const url = "http://192.168.2.16:5555/api/services/app/AsyAdoAssemblyScreen/GetScreenData?prod_line=A1";
    //const url = "http://192.168.3.12:4500/api/services/app/LgaBp2ProgressScreen/GetMonitorScreenData?prod_line=A1";

    final response = await dio.get(url);
    if (response != null) {
      _result = response.data["result"];
      // print(_result);
      return _result;
    }
    else{
      return null;
    }
  }

  Future getDataConfig() async{

    var _result;
    //config
    const url = "http://192.168.2.16:5555/api/services/app/AsyAdoAssemblyScreen/GetScreenData?prod_line=A1";
    var response = await dio.get(url);
    if (response != null) {
      _result = response.data["result"].toString();
      // print(_result);
      return _result;
    }
    else{
      return _result;
    }
  }

}