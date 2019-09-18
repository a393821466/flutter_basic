import 'package:flutter/material.dart';

//按钮
class ButtonWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('按钮'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 36,
                color: Colors.grey[300],
                child: Text('文字按钮'),
              ),
              FlatButton(
                child: Text('文字按钮'),
                onPressed: () {},
                splashColor: Colors.grey[200],
                textColor: Theme.of(context).primaryColor,
              ),
              Container(height: 1, color: Colors.grey[200]),
              FlatButton.icon(
                icon: Icon(Icons.add),
                label: Text('带图标的文字按钮'),
                onPressed: () {},
                splashColor: Colors.grey[200],
                textColor: Theme.of(context).primaryColor,
              ),
              Container(height: 1, color: Colors.grey[200]),
              Container(
                width: double.infinity,
                height: 36,
                color: Colors.grey[300],
                child: Text('普通按钮'),
              ),
              RaisedButton(
                child: Text('普通按钮'),
                onPressed: () {},
                splashColor: Colors.grey[200],
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
              Container(height: 1, color: Colors.grey[200]),
              RaisedButton.icon(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text('普通按钮带图标'),
                onPressed: () {},
                color: Colors.lightBlue,
                splashColor: Colors.grey[200],
                textColor: Colors.white,
                shape: StadiumBorder(),
              ),
              Container(height: 1, color: Colors.grey[200]),
              Container(
                width: double.infinity,
                height: 36,
                color: Colors.grey[300],
                child: Text('边框按钮'),
              ),
              OutlineButton(
                child: Text('边框按钮'),
                onPressed: () {},
                splashColor: Colors.grey[200],
                color: Theme.of(context).primaryColor,
                textColor: Colors.grey,
                highlightedBorderColor: Colors.grey,
              ),
              Container(height: 1, color: Colors.grey[200]),
              OutlineButton.icon(
                icon: Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
                label: Text('边框按钮带图标'),
                onPressed: () {},
                color: Colors.lightBlue,
                splashColor: Colors.grey[200],
                textColor: Colors.grey,
                shape: StadiumBorder(),
                highlightedBorderColor: Colors.grey,
              ),
              Container(height: 1, color: Colors.grey[200]),
              Container(
                width: double.infinity,
                height: 36,
                color: Colors.grey[300],
                child: Text('固定宽度按钮'),
              ),
              Container(
                width: 130,
                child: OutlineButton(
                  child: Text('普通按钮'),
                  onPressed: () {},
                  splashColor: Colors.grey[200],
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.grey,
                  highlightedBorderColor: Colors.grey,
                ),
              ),
              Container(height: 1, color: Colors.grey[200]),
              Container(
                width: double.infinity,
                height: 36,
                color: Colors.grey[300],
                child: Text('等分按钮'),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: OutlineButton(
                        child: Text('普通按钮1'),
                        onPressed: () {},
                        splashColor: Colors.grey[200],
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.grey,
                        highlightedBorderColor: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: OutlineButton(
                        child: Text('普通按钮2'),
                        onPressed: () {},
                        splashColor: Colors.grey[200],
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.grey,
                        highlightedBorderColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
