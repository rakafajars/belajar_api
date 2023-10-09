import 'package:flutter/material.dart';

class DidChangeDependenciesExample extends StatefulWidget {
  @override
  _DidChangeDependenciesExampleState createState() =>
      _DidChangeDependenciesExampleState();
}

class _DidChangeDependenciesExampleState
    extends State<DidChangeDependenciesExample> {
  String message = 'Hello, World!';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    message = 'Changed in didChangeDependencies';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('didChangeDependencies Example'),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DidChangeDependenciesExample(),
  ));
}
