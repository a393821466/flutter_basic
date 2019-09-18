import 'package:flutter/material.dart';

//  注册表单
class FormRegister extends StatefulWidget {
  FormRegister({Key key}) : super(key: key);

  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final registerForKey = GlobalKey<FormState>(); // 先注册一个key
  String username, password;

  submitOnClickForm() {
    registerForKey.currentState.save(); // 保存表单填写的数据
    print('username:${username},password:${password}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册表单'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: registerForKey, // 把定义的globalKey传进来
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                onSaved: (value) {
                  // 把表单中的value保存到username
                  username = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) {
                  // 把表单中的value保存到password
                  password = value;
                },
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
