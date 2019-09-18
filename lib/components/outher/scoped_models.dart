import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;
  void increment() {
    _counter++;
    notifyListeners();
  }
}


class CountWidgetCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Scoped_model')
      ),
      body: Container(
        child: ScopedModel(
          model:CounterModel(),
          child:ScopedModelDescendant<CounterModel>(
            builder: (context,_,model){
              return Center(
                child: ActionChip(
                  label: Text('${model._counter}'),
                  onPressed:model.increment,
                ),
              );
            },
          )
        ),
      ),
    );
  }
}

