// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'account.dart';
import 'dm.dart';

//https://security-nanglam.tistory.com/484 reference
void main() => runApp(MaterialApp(
  title : 'Tag me App',
  home : MainPage(),
));

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}
class _MainPage extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 /*
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),

  */
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Camera'),
            icon: Icon(Icons.camera_enhance),
          ),
          BottomNavigationBarItem(
            title: Text('DM'),
            icon: Icon(Icons.schedule_send),
          ),
          BottomNavigationBarItem(
            title: Text('Account'),
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  List _widgetOptions = [
    Home(),
    Search(),
    Text(
      'Places',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    DM(),
    Account(),
  ];
}
/*
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(
        child: Image(image: AssetImage('images/1.jpg')),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text("Hello"),
            ),
          ),
          Container(
            height: 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.black54,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(icon: Icon(home), onPressed: (){

                },),
                IconButton(icon: Icon(saved_search), onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchRoute())
                  );
                },),
                IconButton(icon: Icon(camera_alt), onPressed: (){},),
                IconButton(icon: Icon(message), onPressed: (){},),
                IconButton(icon: Icon(manage_accounts), onPressed: (){},),
              ],
            ),
          )
        ],
      ),
    );
  }
}



*/