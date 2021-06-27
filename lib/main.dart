import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorApp(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var result = "";

  Widget btn(var textt) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          result = result + textt;
        });
      },
      child: Text(textt),
      style: ElevatedButton.styleFrom(
        // ignore: prefer_const_constructors
        primary: Color(0xfff1f582),
        // ignore: prefer_const_constructors
        onPrimary: Color(0xff292924),
      ),
    );
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator App',
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        height: 500,
        // ignore: prefer_const_constructors
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffa1a395),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                // ignore: prefer_const_constructors
                margin: EdgeInsets.only(right: 15),
                alignment: Alignment.centerRight,
                // ignore: prefer_const_constructors
                child: Icon(Icons.view_column)),
            // ignore: avoid_unnecessary_containers
            Container(
              width: 350,
              height: 100,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xff6a8f76),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                result,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn('1'),
                  btn('2'),
                  btn('3'),
                  btn('+'),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn('4'),
                  btn('5'),
                  btn('6'),
                  btn('-'),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn('7'),
                  btn('8'),
                  btn('9'),
                  btn('*'),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn('0'),
                  ElevatedButton(
                    onPressed: clear,
                    // ignore: prefer_const_constructors
                    child: Text("C"),
                    style: ElevatedButton.styleFrom(
                      // ignore: prefer_const_constructors
                      primary: Color(0xfff1f582),
                      // ignore: prefer_const_constructors
                      onPrimary: Color(0xff292924),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: output,
                    // ignore: prefer_const_constructors
                    child: Text("="),
                    style: ElevatedButton.styleFrom(
                      // ignore: prefer_const_constructors
                      primary: Color(0xfff1f582),
                      // ignore: prefer_const_constructors
                      onPrimary: Color(0xff292924),
                    ),
                  ),
                  btn('/'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.history), title: Text("History")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("User")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("Setting")),
        ],
      ),
    );
  }
}
