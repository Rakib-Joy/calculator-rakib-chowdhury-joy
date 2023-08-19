import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double number1 = 0.0;
  double number2 = 0.0;
  String operator = "";
  String temp = "";
  String input = "";
  String output = "";

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        number1 = 0.0;
        number2 = 0.0;
        operator = "";
        output = "";
        input = "";
        temp = "";
      }else if(value == "CE"){
        setState(() {
          if (input.isNotEmpty) {
            input = input.substring(0, input.length - 1);
            temp = temp.substring(0, temp.length - 1);
          }
        });
      }
      else if(value == "(" || value == ")"){
        input = input + value;

      }
      else if(value == "." || value == "0" || value == "00" || value == "1" || value == "2" || value == "3" || value == "4" || value == "5" || value == "6" || value == "7" || value == "8" || value == "9"){
        input = input + value;
        temp = temp + value;
      }
      else if (value == "+" || value == "-" || value == "*" || value == "/" || value=="%") {
        operator = value;
        input = input + value;
        number1 = double.parse(temp);
        temp = "";
      } else if (value == "=") {
        number2 = double.parse(temp);
        if (operator == "+") {
          output = (number1 + number2).toString();
          temp = output;
        } else if (operator == "-") {
          output = (number1 - number2).toString();
          temp = output;
        } else if (operator == "*") {
          output = (number1 * number2).toString();
          temp = output;
        } else if (operator == "/") {
          output = (number1 / number2).toStringAsFixed(10);
          temp = output;
        }
        else if (operator == "%") {
          output = ((number1 * number2)/100).toString();
        }
        operator = "";
        number1 = 0.0;
        number2 = 0.0;
      } else {
        temp = temp + value;
      }
    });
  }

  Widget Button(String value) {
    final Color buttonsCOlor = Color(0xFF0B344F);
    return Expanded(

      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
          // Change this color
        ),
        onPressed: () => onButtonPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 30.0,),
        ),
      ),
    );
  }

  Widget lastButton(String value) {
    final Color buttonsCOlor = Color(0xFF0B344F);
    return Container(
      width: 100,
      height: 58,
      child: ElevatedButton(

        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
          // Change this color
        ),
        onPressed: () => onButtonPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 30.0,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final Color appbarAndBody = Color(0xFF0E2433);
    final Color buttonsCOlor = Color(0xFF0B344F);

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        backgroundColor: appbarAndBody,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
        toolbarHeight: 60,
        leading: Icon(Icons.menu),
        elevation: 0,

      ),
      body: Form(

        child: Column(

          children: <Widget>[
            Container(
              color: appbarAndBody,
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Column(
                children: [
                  Text(
                    input.toString(),
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(
                    height: 125.5,
                  ),

                  Text(
                    output,
                    style: TextStyle(fontSize: 49.90, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],

              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              decoration: BoxDecoration(
                color: buttonsCOlor,
              ),
              child: Column(
                children: [
                  Row(

                    children: <Widget>[
                      ElevatedButton(

                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
                          // Change this color
                        ),
                        onPressed: () => onButtonPressed("down"),
                        child: Icon(Icons.arrow_drop_down),
                      ),
                      Button("C"),
                      ElevatedButton(

                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
                          // Change this color
                        ),
                        onPressed: () => onButtonPressed("CE"),
                        child: Icon(Icons.close),
                      ),
                      Button("/"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Button("("),
                      Button(")"),
                      Button("%"),
                      Button("*"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Button("1"),
                      Button("2"),
                      Button("3"),
                      Button("-"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Button("4"),
                      Button("5"),
                      Button("6"),
                      Button("+"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Row(
                            children: [
                              lastButton("7"),
                              lastButton("8"),
                              lastButton("9"),
                            ],
                          ),
                          Row(
                            children: [
                              lastButton("0"),
                              lastButton("00"),
                              lastButton("."),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                            width: 92,
                            height: 116,

                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF296D98)),
                                // Change this color
                              ),
                              onPressed: () => onButtonPressed("="),
                              child: Text(
                                "=",
                                style: TextStyle(fontSize: 30.0,),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
