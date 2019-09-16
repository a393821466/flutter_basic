import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogUtils {
  /**
   * 轻弹
   */
  void showToastDialog(String txt) {
    Fluttertoast.showToast(
      msg: txt,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 2,
      fontSize: ScreenUtil().setSp(24),
    );
  }

  /**
   * 对话框
   */
  Future showOpenDialog(BuildContext context, String title, String content,
      List<Widget> child) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: child,
        );
      },
    );
  }
}
