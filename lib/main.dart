import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'CIS 3334 Currency Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final dollarTextField = TextEditingController();
  final euroTextField = TextEditingController();
  double _dollars = 0;
  double _euros = 0;
  double _conversionRate = 1.19;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _convertToDollars() {
    setState(() {
      _euros = double.parse(euroTextField.text);
      _dollars =  _euros / _conversionRate;
      dollarTextField.text = _dollars.toStringAsFixed(2);
    });
  }
  void _convertToEuros() {
    setState(() {
      _dollars = double.parse(dollarTextField.text);
      _euros = _dollars / _conversionRate;
      euroTextField.text = _euros.toStringAsFixed(2);
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
            Row(
              children: [
                Text("Dollars:",
                    style: Theme.of(context).textTheme.headline4),
                Expanded(child: TextField(controller: dollarTextField,)),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _convertToEuros();
              },
              child: Text("Convert to Euros"),
            ),
            SizedBox(height: 100),
            Row(
              children: [
                Text("Euros",
                  style: Theme.of(context).textTheme.headline4,),
                Expanded(child: TextField(controller: euroTextField,)),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _convertToDollars();
              },
              child: Text("Convert to Dollars"),
            ),
          ],
        ),
      ),
    );
  }
}
