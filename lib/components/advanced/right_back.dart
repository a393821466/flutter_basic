import 'package:flutter/cupertino.dart';

//使用cupertino实现左滑右滑
class RightBackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            margin: EdgeInsets.fromLTRB(150.0, 120.0, 0, 0),
            color: CupertinoColors.activeGreen,
            child: CupertinoButton(
              child: Icon(CupertinoIcons.add),
              onPressed: () {
                Navigator.of(context).push(
                    // 实现跳转下一页
                    CupertinoPageRoute(builder: (BuildContext context) {
                  return RightBackPage();
                }));
              },
            ),
          ),
          Container(
              height: 80.0,
              decoration: BoxDecoration(color: CupertinoColors.white),
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: CupertinoButton(
                                child: Icon(CupertinoIcons.left_chevron,
                                    color: CupertinoColors.inactiveGray),
                                onPressed: () => Navigator.of(context).pop()),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text('Page',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: CupertinoColors.inactiveGray)),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(''),
                          )
                        ],
                      ))))
        ],
      ),
    );
  }
}
