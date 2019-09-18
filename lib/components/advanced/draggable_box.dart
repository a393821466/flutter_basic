import 'package:flutter/material.dart';

//拖拽

// 拖拽weight
class DraggableView extends StatefulWidget {
  @override
  _DraggableViewState createState() => _DraggableViewState();
}

class _DraggableViewState extends State<DraggableView> {
  Color _draggableColor = Colors.grey[400];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('拖拽效果'),
        ),
        body: Stack(
          children: <Widget>[
            DraggableWidget(
              offset: Offset(80.0, 80.0),
              widgetColor: Colors.tealAccent,
            ),
            DraggableWidget(
              offset: Offset(200.0, 80.0),
              widgetColor: Colors.redAccent,
            ),
            Center(
              child: DragTarget(
                onAccept: (Color color) {
                  _draggableColor = color;
                },
                builder: (context, candidateData, reject) {
                  return Container(
                    width: 200.0,
                    height: 200.0,
                    color: _draggableColor,
                  );
                },
              ),
            )
          ],
        ));
  }
}

// 拖拽方法
class DraggableWidget extends StatefulWidget {
  @override
  final Offset offset;
  final Color widgetColor;
  const DraggableWidget({Key key, this.offset, this.widgetColor})
      : super(key: key);
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0, 0);
  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
        child:
            Container(width: 100.0, height: 100.0, color: widget.widgetColor),
        feedback: Container(
          width: 110.0,
          height: 110.0,
          color: widget.widgetColor.withOpacity(0.5),
        ),
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}
