import 'package:flutter/material.dart';

// 滑块
class FormSliderBOX extends StatefulWidget {
  @override
  _FormSliderBOXState createState() => _FormSliderBOXState();
}

class _FormSliderBOXState extends State<FormSliderBOX> {
  double _sliderItemA = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滑块'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
            Slider(
              value: _sliderItemA,
              onChanged: (value) {
                setState(() {
                  _sliderItemA = value;
                });
              },
              min: 0, // 最小
              max: 100, //最大
              divisions: 100, // 分隔
              label: '${_sliderItemA.toInt()}',
              activeColor: Colors.deepOrangeAccent,
              inactiveColor: Colors.grey[200],
            ),
            Text('Count:${_sliderItemA.toInt()}')
          ],
        ),
      ),
    );
  }
}
