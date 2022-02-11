
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FirstPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  static const buttonSize = 60.0;

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String input = '';
  var len = 0;
  var _num = 6;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_outlined,
                        size: 75,
                        color: Colors.deepPurple.shade500,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 40, color: Colors.deepPurple.shade500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Enter PIN to login',
                          style: TextStyle(
                              fontSize: 30, color: Colors.deepPurple.shade500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      '$input',
                      style: TextStyle(
                          fontSize: 30, color: Colors.deepPurple.shade900),
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Collection for filled
                        if(input.isNotEmpty)
                          for (var i = 0; i<len; i++)
                            buildContainer2(),
                        // Collection for empty
                        for (var i = 0; i <_num; i++)
                          buildContainer(),


                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(1),
                      _buildButton(2),
                      _buildButton(3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(4),
                      _buildButton(5),
                      _buildButton(6),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(7),
                      _buildButton(8),
                      _buildButton(9),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: LoginPage.buttonSize,
                            height: LoginPage.buttonSize,
                          )),
                      _buildButton(0),
                      _buildButton(-1),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(
                          width: 25.0,
                          height: 25.0,
                          margin: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade100,
                            shape: BoxShape.circle,
                          ),
                        );
  }
  Container buildContainer2() {
    return Container(
      width: 25.0,
      height: 25.0,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade400,
        shape: BoxShape.circle,
      ),
    );
  }
  Widget _buildButton(int n) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (n == -1) {
            //print('Backspace');
            setState(() {
              // '12345'
              var length = input.length;
              input = input.substring(0, length - 1);
              len = input.length;
              _num++;
            });
          } else {
            //print('$n');
            if (input.length < 6) {
              setState(() {
                input = '$input$n';
                len = input.length;
                _num--;
                //print(input.compareTo('123456'));
              });
            }if(input.length == 6){
              setState(() {
                if(input.compareTo('123456')!=0){
                  showDialog(context: context,  barrierDismissible: false,builder: (BuildContext context){
                    return AlertDialog(
                      title: Text('Incorrect PIN'),
                      content:Text('Please try again'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  });
                  input = '';
                  _num = 6;
                }else{
                  // ให้แทน NextPage ด้วยชื่อคลาสของหน้าที่ต้องการ
                  // navigate ไป
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirstPage()
                    ),
                  );

                }
              });
            }

          }
        },
        borderRadius: BorderRadius.circular(LoginPage.buttonSize / 2),
        child: Container(
          width: LoginPage.buttonSize,
          height: LoginPage.buttonSize,
          //color: Colors.green, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว

          decoration: (n == -1)
              ? null
              : BoxDecoration(
                  color: Colors.deepPurple.shade200,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0)),
          alignment: Alignment.center,
          // conditional operator (?:)
          child: (n == -1)
              ? Icon(Icons.backspace)
              : Text(
                  '$n',
                  style: TextStyle(fontSize: 20),
                ),
        ),
      ),
    );
  }
}
