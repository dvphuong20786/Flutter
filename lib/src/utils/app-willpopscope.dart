import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWillPopScope extends StatefulWidget {
  final Widget child;
  final bool isHome;
  final String popTo;
  final Function onPopCallBack;

  const AppWillPopScope(
      {Key? key,
      required this.child,
      required this.isHome,
      required this.popTo,
      this.onPopCallBack = _defaultCallBack})
      : super(key: key);

  @override
  State<AppWillPopScope> createState() => _AppWillPopScopeState();
}

_defaultCallBack() {
  return null;
}

// _showDialog(context) {
//   showDialog(context: context,
//     builder: (context) => AlertDialog(
//       title: const Text('Are you sure?'),
//       content: const Text('Do you want to exit an App'),
//       actions: <Widget>[
//         GestureDetector(
//           onTap: () => ,
//           child: const Text("NO"),
//         ),
//         const SizedBox(height: 16),
//         GestureDetector(
//           onTap: () => _isHome = true,
//           child: const Text("YES"),
//         ),
//       ],
//     ),)
// }

class _AppWillPopScopeState extends State<AppWillPopScope> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: widget.child,
        onWillPop: () async {
          if (!widget.isHome && widget.popTo.isNotEmpty) Modular.to.pushReplacementNamed(widget.popTo);
          return widget.isHome;
        });
  }
}
