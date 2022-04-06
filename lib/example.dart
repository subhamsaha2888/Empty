import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  final String name;
  const Example({Key? key, required this.name}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.name),
      ),
    );
  }
}
