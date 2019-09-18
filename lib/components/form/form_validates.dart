import 'package:flutter/material.dart';

// 表单验证
class FormValidates extends StatefulWidget {
  FormValidates({Key key}) : super(key: key);

  _FormValidatesState createState() => _FormValidatesState();
}

class _FormValidatesState extends State<FormValidates> {
  final registerForKey = GlobalKey<FormState>(); // 先注册一个key
  String username, password;
  bool autoValidate = false;
  submitOnClickForm() {
    // 自动验证判断
    if (registerForKey.currentState.validate()) {
      registerForKey.currentState.save(); // 保存表单填写的数据// 执行验证表单
      print('username:${username},password:${password}');
      // 底部弹窗
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('sadasdas')));
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }

  // 验证username方法
  String validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  // 验证password方法
  String validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('验证表单'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: registerForKey, // 把定义的globalKey传进来
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  helperText: '',
                ),
                onSaved: (value) {
                  // 把表单中的value保存到username
                  username = value;
                },
                // 添加验证
                validator: validateUsername,
                // 自动验证
                autovalidate: autoValidate,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  helperText: '',
                ),
                obscureText: true,
                onSaved: (value) {
                  // 把表单中的value保存到password
                  password = value;
                },
                // 添加验证
                validator: validatePassword,
                // 自动验证
                autovalidate: autoValidate,
              ),
              SizedBox(height: 32),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child:
                      Text('Register', style: TextStyle(color: Colors.white)),
                  elevation: 0,
                  onPressed: submitOnClickForm,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
