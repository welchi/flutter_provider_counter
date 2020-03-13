import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<_Counter>(
        create: (_) => _Counter(),
        child: const _HomePage(title: 'Provider Counter Demo'),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Provider.of<_Counter>(context, listen: false).increment();
          }),
      body: const _Message(),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Provider.of<_Counter>(context).message,
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}

class _Counter with ChangeNotifier {
  int _count = 0;
  void increment() {
    _count++;
    notifyListeners();
  }

  String get message {
    return _count.toString();
  }
}
