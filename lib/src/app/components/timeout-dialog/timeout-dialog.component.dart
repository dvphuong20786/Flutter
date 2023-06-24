import 'package:flutter/material.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:prod_mobile/src/utils/screen_config.dart';

class TimeoutDialog extends StatefulWidget {
  final String title;

  const TimeoutDialog({required this.title}) : super();

  @override
  _TimeoutDialogState createState() => _TimeoutDialogState();
}

class _TimeoutDialogState extends State<TimeoutDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: Center(child: Text("${widget.title}", style: TextStyle(fontWeight: FontWeight.bold))),
      content: IntrinsicHeight(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton (
                  child: Container(
                    alignment: Alignment.center,
                    width: SizeConfig.safeBlockHorizontal * 18,
                    height: SizeConfig.safeBlockVertical * 5,
                    child: Text('Yes'.i18n, style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
