import 'package:flutter/material.dart';
import 'package:grocery_item_app/screens/onboard.dart';
import 'package:grocery_item_app/screens/todolist.dart';

class Welcome extends StatelessWidget {
  bool _validPhone = false;
  void showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, StateSetter mystate) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Enter Your Phone Number to Login',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefixText: '+91',
                      labelText: '10 digit Mobile Number',
                    ),
                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    onChanged: (value) {
                      if (value.length == 10) {
                        mystate(() {
                          _validPhone = true;
                        });
                      } else {
                        mystate(() {
                          _validPhone = false;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AbsorbPointer(
                          absorbing: _validPhone ? false : true,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  _validPhone
                                      ? Colors.deepOrange
                                      : Colors.grey),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              if (_validPhone) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TodoList()));
                              }
                            },
                            child:
                                Text(_validPhone ? 'CONTINUE' : 'Enter Phone'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: Onboard()),
            Text(
              'Ready to order from your nearest shop?',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {},
                child: Text('Set Delivery Location')),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                showBottomSheet(context);
              },
              child: RichText(
                  text: TextSpan(
                      text: 'Already a customer? ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                    TextSpan(
                        text: 'LogIn',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent))
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
