import 'package:flutter/material.dart';
import '../components/form/button_widgets.dart';
import '../components/form/form_text.dart';
import '../components/form/form_register.dart';
import '../components/form/form_validates.dart';
import '../components/form/form_checkbox.dart';
import '../components/form/form_radio.dart';
import '../components/form/form_swich.dart';
import '../components/form/form_slider.dart';
import '../components/form/search_view.dart';
List formList = [
  {"routerLink": ButtonWidgets(), "title": '按钮', "icon": Icons.lens},
  {"routerLink": FormTextColor(), "title": '文本字段', "icon": Icons.text_fields},
  {"routerLink": FormRegister(), "title": '注册表单', "icon": Icons.format_shapes},
  {"routerLink": FormValidates(), "title": '验证表单', "icon": Icons.verified_user},
  {"routerLink": FormCheckBoxs(), "title": '复选框', "icon": Icons.check_box},
  {
    "routerLink": FormRadioList(),
    "title": '单选框',
    "icon": Icons.radio_button_checked
  },
  {"routerLink": FormSwichBox(), "title": '开关', "icon": Icons.edit_attributes},
  {"routerLink": FormSliderBOX(), "title": '滑块', "icon": Icons.play_for_work},
  {"title": "搜索", "routerLink": SearchView(), "icon": Icons.search},
];
