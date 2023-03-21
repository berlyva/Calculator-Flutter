import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  // const CalculatorApp({super.key});
  String output = "0";

  String _output = "0";

  double num1 = 0;

  double num2 = 0;

  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("already contins a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget BuildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
        child: OutlinedButton(
          onPressed: () {
            buttonPressed(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(
              color: Color.fromRGBO(17, 16, 16, 1),
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(5, 5, 5, 1),
        title: Text(
          "Calculator",
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 241, 231, 231),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    BuildButton("9"),
                    BuildButton("8"),
                    BuildButton("7"),
                    BuildButton("/"),
                  ],
                ),
                Row(
                  children: [
                    BuildButton("4"),
                    BuildButton("5"),
                    BuildButton("6"),
                    BuildButton("+"),
                  ],
                ),
                Row(
                  children: [
                    BuildButton("1"),
                    BuildButton("2"),
                    BuildButton("3"),
                    BuildButton("-"),
                  ],
                ),
                Row(
                  children: [
                    BuildButton("0"),
                    BuildButton("000"),
                    BuildButton("."),
                    BuildButton("*"),
                  ],
                ),
                Row(
                  children: [
                    BuildButton("CLEAR"),
                    BuildButton("="),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
