import 'package:common_utils/common_utils.dart';
import 'package:flutter/services.dart';

class Utils {
  /**
   * 返回当前时间戳
   */
  static int currentTimeMillos() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  /**
   * 复制到剪贴板
   */
  static copyToClipboard(final String text) {
    if (text == null) return;
    Clipboard.setData(ClipboardData(text: text));
  }

  /**
   * 返回文件大小字符串
  */
  static const RollupSize_Units = ["GB", "MB", "KB", "B"];
  static String getRollupSize(int size) {
    int idx = 3;
    int r1 = 0;
    String result = "";
    while (idx >= 0) {
      int s1 = size % 1024;
      size = size >> 10;
      if (size == 0 || idx == 0) {
        r1 = (r1 * 100) ~/ 1024;
        if (r1 > 0) {
          if (r1 >= 10)
            result = "$s1.$r1${RollupSize_Units[idx]}";
          else
            result = "$s1.0$r1${RollupSize_Units[idx]}";
        } else
          result = s1.toString() + RollupSize_Units[idx];
        break;
      }
      r1 = s1;
      idx--;
    }
    return result;
  }

  /**
   * 将毫秒转为 日期格式
  */
  static String formartDate(now, [types]) {
    var t = types == null ? DataFormats.full : types;
    // var d = now.add(new Duration(hours: 8));
    String dateStrByMs = DateUtil.formatDateMs(now, format: t);
    return dateStrByMs;
  }
}
