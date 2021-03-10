import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic text = '0';
  double firstNumber = 0;
  double secondNumber = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic operand = '';
  dynamic previousOperand = '';

  Widget btn(buttonText, Color color) {
    return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: new RaisedButton(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          onPressed: () {
            calculation(buttonText);
          },
          color: color,
          padding: EdgeInsets.all(22.0),
        ));
  }

  Widget btnZero(buttonText, Color color) {
    return Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: new RaisedButton(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          onPressed: () {
            calculation(buttonText);
          },
          color: color,
          padding:
              EdgeInsets.only(top: 20.0, bottom: 20.0, right: 85.0, left: 85.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Color(0xff656665),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 60.0),
                textAlign: TextAlign.right,
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('C', const Color(0xff123123124)),
              btn('+/-', const Color(0xff123123124)),
              btn('%', const Color(0xff123123124)),
              btn('÷', Colors.orange)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('7', const Color(0xff949494)),
              btn('8', const Color(0xff949494)),
              btn('9', const Color(0xff949494)),
              btn('x', Colors.orange)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('4', const Color(0xff949494)),
              btn('5', const Color(0xff949494)),
              btn('6', const Color(0xff949494)),
              btn('-', Colors.orange)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btn('1', const Color(0xff949494)),
              btn('2', const Color(0xff949494)),
              btn('3', const Color(0xff949494)),
              btn('+', Colors.orange)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btnZero('0', const Color(0xff949494)),
              btn('.', const Color(0xff949494)),
              btn('=', Colors.orange)
            ],
          )
        ],
      ),
    );
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  void calculation(btnText) {
    if (btnText == 'C') {
      text = '0';
      firstNumber = 0;
      secondNumber = 0;

      result = '';
      finalResult = '';
      operand = '';
      previousOperand = '';
    } else if (operand == '=' && previousOperand == '=') {
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '÷' ||
        btnText == '=') {
      if (firstNumber == 0) {
        firstNumber = double.parse(result);
      } else {
        secondNumber = double.parse(result);
      }

      if (operand == '+') {
        result = (firstNumber + secondNumber).toString();
        firstNumber = double.parse(result);
        doesContainDecimal(result);
        finalResult = result;
      } else if (operand == '-') {
        result = (firstNumber - secondNumber).toString();
        firstNumber = double.parse(result);
        doesContainDecimal(result);
        finalResult = result;
      } else if (operand == 'x') {
        result = (firstNumber * secondNumber).toString();
        firstNumber = double.parse(result);
        doesContainDecimal(result);
        finalResult = result;
      } else if (operand == '÷') {
        result = (firstNumber / secondNumber).toString();
        firstNumber = double.parse(result);
        doesContainDecimal(result);
        finalResult = result;
      }

      previousOperand = operand;
      operand = btnText;
      result = '';
    } else if (btnText == '%') {
      result = firstNumber / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }
}
