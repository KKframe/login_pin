import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
  static const fontSize = 60.0;
  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Colors.tealAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Login successful',textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.indigo,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Log out',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: fontSize/2),
                ),
              ),
            )
          ],
        ),
      );
  }
}
