import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: "Counter 2.0"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _increaseCount = 0;
  int _decreaseCount = 0;

  void _changeCounterBy(int amount) {
    setState(() {
      _counter += amount;
      if (amount > 0) {
        _increaseCount++;
      } else {
        _decreaseCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              '"+" pressed times: $_increaseCount',
            ),
            Text(
              '"-" pressed times: $_decreaseCount',
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_counter > 0)
            FloatingActionButton(
              onPressed: () => _changeCounterBy(-1),
              tooltip: 'Decrement',
              backgroundColor: Colors.red,
              child: const Icon(Icons.remove),
            ),
          FloatingActionButton(
            onPressed: () => _changeCounterBy(1),
            tooltip: 'Increment',
            backgroundColor: Colors.green,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
