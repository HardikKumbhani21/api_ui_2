import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  StreamDemo({Key? key}) : super(key: key);

  StreamController<bool> _controller = StreamController();

  bool ismale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: StreamBuilder(
            initialData: false,
            stream: _controller.stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Switch(
                  value: snapshot.data,
                  onChanged: (value) {
                    print("value:$value");
                    _controller.sink.add(value);
                  });
              // Text("Counter: ${counter}");
            },
          ),
        ),
      ]),
    );
  }
}
