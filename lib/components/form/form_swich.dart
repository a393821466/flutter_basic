import 'package:flutter/material.dart';

// 开关
class FormSwichBox extends StatefulWidget {
  @override
  final Function() textClick;
  FormSwichBox({Key key, this.textClick}) : super(key: key);
  _FormSwichBoxState createState() => _FormSwichBoxState();
}

class _FormSwichBoxState extends State<FormSwichBox> {
  var _switchItem = false;
  bool _switchItem1 = false;

  // 自定义开关方法
  textClick() {
    setState(() {
      _switchItem = !_switchItem;
    });
  }

  Widget get SingleSwitchOpen {
    return _swichWrap(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: _switchItem,
              onChanged: (value) {
                setState(() {
                  _switchItem = value;
                });
              },
            ),
            Text(_switchItem ? '开启' : '关闭')
          ],
        ),
        textClick);
  }

  // 自定义回调
  _swichWrap(Widget child, Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback();
        }
      },
      child: child,
    );
  }

  // 开关组标签方法
  Widget get SwitchItemList {
    return SwitchListTile(
      value: _switchItem1,
      onChanged: (value) {
        setState(() {
          _switchItem1 = value;
        });
      },
      title: Text('switchItemA'),
      subtitle: Text('switchDes'),
      secondary: Icon(_switchItem1 ? Icons.visibility : Icons.visibility_off),
      selected: _switchItem1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('switch开关'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SingleSwitchOpen,
            Container(height: 1, color: Colors.grey[200]),
            SwitchItemList,
          ],
        ),
      ),
    );
  }
}
