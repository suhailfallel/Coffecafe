// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:coffecafe/homepage.dart';

void main() {
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Loginpage();
  }
}

class Loginpage extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CoffeCafe"),
      ),
      body: loginBody(),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget loginBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            child: const Text(
              'CoffeCafe',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 50,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding:const EdgeInsets.fromLTRB(10, 40, 10, 10),
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Myapp1()));
            },
            child: const Text(
              'Forgot Password?',
            )),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  if(nameController.text == "test" && passwordController.text == "test") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()));
                  }
                  else {
                    showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Invalid Username or Password'),
                        actions: [
                          TextButton(onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK')
                          )
                        ],
                      );
                    });
                  }
                },
                child: const Text(
                  'Login'
                )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Does not have account?'),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20),
                  ))
              ],
            )
        ],
      ),
    );
  }
}

class Myapp1 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return Forgotpage();
  }
}

class Forgotpage extends State<Myapp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CoffeCafe'),
        ),
        body: forgotPassword(),
      );
  }

  TextEditingController forgotEmail = TextEditingController();

  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            child: const Text(
              'CoffeCafe',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 50,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Confirm your Email and we will send the instructions',
              style: TextStyle(
                color: Colors.lightGreen,
                fontWeight: FontWeight.w300,
                fontSize: 13,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
            child: TextField(
              controller: forgotEmail,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            )
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Reset Password'),
            ),
          )
        ],
      ),
    );
  }
}