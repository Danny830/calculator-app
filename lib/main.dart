import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator App'),
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
  num _result = 0;
  List<num> list = [];
  List<num> query = [];
  String _stringResult = "0";
  String resultList = "0";
  String queryResult = "";
  String listResult = "";
  bool clear = false;
  bool addition = false;
  bool subtraction = false;
  bool multiplication = false;
  bool division = false;
  bool equalState = false;
  bool decimalState = false;
  bool negation = false;
  bool zeroError = false;

  void _incrementCounter() {
    setState(() {
      _result++;
    });
  }

  // void _addComma() {
  //
  //   for (int i = 0; i < _stringResult.length; i++) {
  //
  //     if ()
  //
  //   }
  //
  // }

  // void checkDecimals() {
  //
  //   if (_stringResult.contains(".")) {
  //
  //     for (int i = 0; i < _stringResult.length; i++) {
  //
  //       if (_stringResult[i] == ".") {
  //
  //       }
  //
  //     }
  //
  //   }
  //
  // }

  void clearArithmetic() {

    addition = false;
    subtraction = false;
    multiplication = false;
    division = false;
    equalState = false;
    resultList = "0";
    //_stringResult = "0";

  }

  void _input(input) {

    clear = true;
    if (equalState) {

      equalState = false;
      list.clear();
      query.clear();

    }
    if (_stringResult.length >= 9) {
      return;
    }
    print("list : " + list.toString());
    if (resultList.contains('.')) {

      resultList = resultList + input;
      list.clear();
      list.add(num.parse(resultList));
      setState(() {
        _result = num.parse(resultList);
        _stringResult = resultList;
      });
      print(_stringResult);

    }
    else if (resultList == "-0") {

      list.add(-num.parse(input));
      setState(() {
        _result = num.parse(list.join());
        _stringResult = _result.toString();
        resultList = _result.toString();
      });
      print(_result);

    }
    else {

      if (_stringResult == "0") {
        _stringResult = "";
      }

      if (!(list.isEmpty && input == "0")) {
        setState(() {
          _stringResult = list.join() + input;
          resultList = _stringResult;
        });
        list.add(num.parse(input));
        _result = num.parse(list.join());
      }

      print(_result);

    }
    print("list : " + list.toString());

  }

  void _giveResult(String arithmetic) {

    zeroError = false;
    if (list.isEmpty) {
      list.add(0);
    }
    if (query.isEmpty) {
      query.add(0);
    }

    listResult = list.join();
    queryResult = query.join();
    print(queryResult + " And " + listResult);

    switch(arithmetic) {
      case "add":
        setState(() {
          _result = num.parse(queryResult) + num.parse(listResult);
          _stringResult = _result.toString();
        });
        query.clear();
        query.add(_result);
        break;
      case "sub":
        setState(() {
          _result = num.parse(queryResult) - num.parse(listResult);
          _stringResult = _result.toString();
        });
        query.clear();
        query.add(_result);
        break;
      case "mul":
        setState(() {
          _result = num.parse(queryResult) * num.parse(listResult);
          _stringResult = _result.toString();
        });
        query.clear();
        query.add(_result);
        break;
      case "div":
        try {
          setState(() {
            if (num.parse(queryResult) % num.parse(listResult) == 0) {
              _result = num.parse(queryResult) ~/ num.parse(listResult);
            }
            else {
              _result = num.parse(queryResult) / num.parse(listResult);
            }
            _stringResult = _result.toString();
          });
          query.clear();
          query.add(_result);
          print("No division error");
        }
        catch(e) {
          print("Error caught, Divide by Zero");
          zeroError = true;
          setState(() {
            _stringResult = "Error";
          });
          query.clear();
          list.clear();
        }
        break;
    }

    if (_result.round() == _result && !zeroError) {

      _result = _result.toInt();
      setState(() {
        _stringResult = _result.toString();
        //resultList = _stringResult;
      });
      print(_stringResult);
      query.clear();
      query.add(_result);

    }

    // if (_result.round() == (_result + 1) && (checkDecimals())) {
    //
    //
    //
    // }

    resultList = "0";

  }

  void _allClear() {
    setState(() {
      _result = 0;
      resultList = "0";
      _stringResult = "0";
      list.clear();
      query.clear();
      addition = false;
      subtraction = false;
      multiplication = false;
      division = false;
      equalState = false;
      decimalState = false;
    });
  }

  void _clear() {
    print("Erasing list: " + list.toString());
    list.clear();
    //list.add(0);
    if (equalState) {
      query.clear();
    }
    setState(() {
      _result = 0;
      _stringResult = _result.toString();
      resultList = _stringResult;
    });
    clear = false;
  }

  void _negate() {

    if (equalState) {

      // setState(() {
      //   _result = _result * -1;
      //   _stringResult = _result.toString();
      //   resultList = _stringResult;
      // });
      // query.clear();
      // query.add(_result);

      if (_stringResult == "0") {

        setState(() {
          _stringResult = "-$_stringResult";
          resultList = _stringResult;
        });

      }
      else if (_stringResult == "-0") {

        setState(() {
          _stringResult = _result.toString();
          resultList = _stringResult;
        });

      }
      else {

        setState(() {
          _result = _result * -1;
          _stringResult = _result.toString();
          resultList = _stringResult;
        });
        print(_result);
        query.clear();
        query.add(_result);
        print(query);

      }

    }
    else {

      if (_stringResult == "0") {

        setState(() {
          _stringResult = "-$_stringResult";
          resultList = _stringResult;
        });

      }
      else if (_stringResult == "-0") {

        setState(() {
          _stringResult = _result.toString();
          resultList = _stringResult;
        });

      }
      else if (list.isEmpty) {

        setState(() {
          _stringResult = "-0";
          resultList = _stringResult;
        });

      }
      else {

        setState(() {
          _result = _result * -1;
          _stringResult = _result.toString();
          resultList = _stringResult;
        });
        print(_result);
        list.clear();
        list.add(_result);

      }

      // if (_stringResult.contains("-")) {
      //
      //   setState(() {
      //     _result *= -1;
      //     print(_result);
      //     _stringResult = _result.toString();
      //     resultList = _stringResult;
      //   });
      //
      // }
      // else {
      //
      //   setState(() {
      //     _result = _result * -1;
      //     print(_result);
      //     _stringResult = "-$_stringResult";
      //     resultList = _stringResult;
      //   });
      //
      // }

      // list.clear();
      // list.add(_result);
      // print(list);

    }

  }

  void _percent() {

    // If the query list is same as the result, then we update
    // the query instead of the list. This is so we keep track
    // of the number that we keep manipulating when doing arithmetic
    // or when using the percent on our result after pressing equals
    if (query.join() == _result.toString()) {
      if ((_result / 100) == (_result / 100).round()) {
        _result = _result / 100;
        _result = _result.toInt();
      }
      else {
        _result = _result / 100;
      }
      query.clear();
      query.add(_result);
      setState(() {
        _stringResult = _result.toString();
      });
      print("query");
      print(query);
    }
    else {
      if ((_result / 100) == (_result / 100).round()) {
        _result = _result / 100;
        _result = _result.toInt();
      }
      else {
        _result = _result / 100;
      }
      list.clear();
      list.add(_result);
      setState(() {
        _stringResult = _result.toString();
      });
      print("list");
      print(list);
    }

  }

  void _addition() {

    // If query is empty, no arithmetic should be performed and we set
    // our query to the result of our list
    if (query.isEmpty) {
      query = List.from(list);
    }
    // We check if the user just hit the "equal" sign so we don't perform
    // more arithmetic than needed and check if any arithmetic should
    // be completed before moving on
    else if ((subtraction || multiplication || division) && (!equalState) && clear) {
      _equal();
    }
    // We run a continuous addition result if the user keeps pressing "+"
    else {

      try {
        continuousArithmetic("add");
      }
      catch (e) {
        print("No number input");
      }

    }
    // Disable all other arithmetic flags, set the correct flag to true and
    // clear the list for the next user input
    clearArithmetic();
    addition = true;
    list.clear();
    print(query);
    print("Addition True");

  }

  void _subtraction() {

    if (query.isEmpty) {
      query = List.from(list);
    }
    else if ((addition || multiplication || division) && (!equalState) && clear) {
      _equal();
    }
    else {

      try {
        continuousArithmetic("sub");
      }
      catch (e) {
        print("No number input");
      }

    }
    clearArithmetic();
    subtraction = true;
    list.clear();
    print(query);
    print("Subtraction True");

  }

  void _multiplication() {

    if (query.isEmpty) {
      query = List.from(list);
    }
    else if ((addition || subtraction || division) && (!equalState) && clear) {
      _equal();
    }
    else {

      try {
        continuousArithmetic("mul");
      }
      catch (e) {
        print("No number input");
      }

    }
    clearArithmetic();
    multiplication = true;
    list.clear();
    print(query);
    print("Multiplication True");

  }

  void _division() {

    if (query.isEmpty) {
      query = List.from(list);
    }
    else if ((addition || multiplication || subtraction) && (!equalState) && clear) {
      _equal();
    }
    else {

      try {
        continuousArithmetic("div");
      }
      catch (e) {
        print("No number input");
      }

    }
    clearArithmetic();
    division = true;
    list.clear();
    print(query);
    print("Division True");

  }

  void continuousArithmetic(String arith) {

    if (equalState) {
      list.clear();
    }
    else {
      _giveResult(arith);
    }

  }

  void _equal() {

    if (list.isEmpty) {
      list = List.from(query);
    }

    if (addition) {
      _giveResult("add");
    }
    else if (subtraction) {
      _giveResult("sub");
    }
    else if (multiplication) {
      _giveResult("mul");
    }
    else if (division) {
      _giveResult("div");
    }

  }

  void decimal() {

    if (!resultList.contains(".")) {
      setState(() {
        resultList = "$resultList.";
        _stringResult = resultList;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          heightSeparation(),
          Expanded (
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                  _stringResult,
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: _stringResult.length == 8 ? 78 : _stringResult.length == 9 ? 75 : 80),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              if (clear) button("C") else button("AC"),
              widthSeparation(),
              button("+/-"),
              widthSeparation(),
              button("%"),
              widthSeparation(),
              button("/"),
            ],
          ),
          heightSeparation(),
          Row(
            children: [
              button("7"),
              widthSeparation(),
              button("8"),
              widthSeparation(),
              button("9"),
              widthSeparation(),
              button("X"),
            ],
          ),
          heightSeparation(),
          Row(
            children: [
              button("4"),
              widthSeparation(),
              button("5"),
              widthSeparation(),
              button("6"),
              widthSeparation(),
              button("-"),
            ],
          ),
          heightSeparation(),
          Row(
            children: [
              button("1"),
              widthSeparation(),
              button("2"),
              widthSeparation(),
              button("3"),
              widthSeparation(),
              button("+"),
            ],
          ),
          heightSeparation(),
          Row(
            children: [
              button("0"),
              widthSeparation(),
              button("."),
              widthSeparation(),
              button("="),
            ],
          ),
        ],
      )
    );
  }

  Widget widthSeparation() {

    return SizedBox(width: 5);

  }

  Widget heightSeparation() {

    return SizedBox(height: 5);

  }

  Widget button(String input) {

    if (input == "0") {

      return SizedBox(
        width: 200,
        height: 120,
        child: ElevatedButton(
            onPressed: () {
              _input("0");
            },
            child: Text(input,
                style: TextStyle(fontSize: 35))),
      );

    }
    else {

      return SizedBox(
        width: 99,
        height: 120,
        child: ElevatedButton(
            onPressed: () {
              switch(input) {
                case "AC":
                  _allClear();
                  break;
                case "C":
                  _clear();
                  break;
                case "+/-":
                  _negate();
                  break;
                case "%":
                  _percent();
                  break;
                case "1":
                  _input(input);
                  break;
                case "2":
                  _input(input);
                  break;
                case "3":
                  _input(input);
                  break;
                case "4":
                  _input(input);
                  break;
                case "5":
                  _input(input);
                  break;
                case "6":
                  _input(input);
                  break;
                case "7":
                  _input(input);
                  break;
                case "8":
                  _input(input);
                  break;
                case "9":
                  _input(input);
                  break;
                case "+":
                  _addition();
                  break;
                case "-":
                  _subtraction();
                  break;
                case "X":
                  _multiplication();
                  break;
                case "/":
                  _division();
                  break;
                case "=":
                  equalState = true;
                  _equal();
                  break;
                case ".":
                  decimal();
                  break;

              }

            },
            child: Text(input,
                style: TextStyle(fontSize: 35))),
      );

    }

  }
}
