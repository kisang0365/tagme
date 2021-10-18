import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _Account createState() => _Account();
}
class _Account extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Account Route '),
      ),
      body: Center(
        child: RaisedButton(
          child: Image(image: AssetImage('images/1.jpg')),
          onPressed: () {
            // 눌렀을 때 두 번째 route로 이동합니다.
            //   Navigator.pop(
            //       context
            //  );
          },
        ),
      ),
    );
  }
}