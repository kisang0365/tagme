import 'package:flutter/material.dart';
import 'post.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class StoryView extends StatefulWidget{
  @override
  _StoryViewState createState() => _StoryViewState();
}


class _StoryViewState extends State<StoryView>{

  late Post post;
  late ScrollController _story_scrollController;
  late int count;

  void initState(){
    super.initState();
    //addItemIntoList(1);
    post = new Post(1,4,12);
    _story_scrollController = new ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //final double postHeight = (size.height - kToolbarHeight - 24) / 4;
    //final double postWidth = size.width / post.axiscount;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: Container (
          //margin: EdgeInsets.symmetric(vertical: 20.0),

          child : GridView.count(
            crossAxisCount: post.axiscount,
            //childAspectRatio: (postWidth / postHeight),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: (3 / 3),
            padding : EdgeInsets.all(10),
            controller: _story_scrollController,
            scrollDirection: Axis.horizontal,

            physics: const AlwaysScrollableScrollPhysics(),
            children: post.list.map((value) {
              count = (value % 4) + 1;
              return GestureDetector(
                onTap: () {
  //Navigator.of(context).pop();
                },
                child: new Align(
                    alignment: Alignment.center,
                    child: Container(
                      width : 300,
                      height : 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image:DecorationImage(image: AssetImage('images/$count.jpg'), fit: BoxFit.cover),
                          border: Border.all(width: 5, color: Colors.black87)),
                      //margin: EdgeInsets.all(20),
                      //padding: EdgeInsets.all(10),
                      child: Column(
                          children: [
                            //Text('name'),
                          ]
                      ),
                    )),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
  //// ADDING THE SCROLL LISTINER
  _scrollListener() {
    if (_story_scrollController.offset >=
        _story_scrollController.position.maxScrollExtent &&
        !_story_scrollController.position.outOfRange) {
      setState(() {
        print("comes to bottom $post.isLoading");
        post.isLoading = true;

        if (post.isLoading) {
          print("RUNNING LOAD MORE");

          post.pageCount = post.pageCount + 1;

          post.addPostIntoLisT(post.pageCount);
        }
      });
    }
  }
}

class PostView extends StatefulWidget{
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView>{

  late Post post;
  late ScrollController _post_scrollController;
  late int count;

  void initState(){
    super.initState();
    //addItemIntoList(1);
    post = new Post(3, 8, 24);
    _post_scrollController = new ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double postHeight = (size.height - kToolbarHeight - 24) / 4;
    final double postWidth = size.width / post.axiscount;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: GridView.count(
          crossAxisCount: post.axiscount,
          childAspectRatio: (postWidth / postHeight),
          padding : EdgeInsets.all(0),
          controller: _post_scrollController,
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          children: post.list.map((value) {
            count = (value % 4) + 1;
            return Container(
              alignment: Alignment.center,
              //decoration: BoxDecoration(
              //border: Border.all(color: Colors.black),
              //),
              child: Image(image: AssetImage('images/$count.jpg'), fit: BoxFit.cover),
              // child: Image("Item ${value}"),
            );
          }).toList(),
        ),
      ),
    );
  }
  //// ADDING THE SCROLL LISTINER
  _scrollListener() {
    if (_post_scrollController.offset >=
        _post_scrollController.position.maxScrollExtent &&
        !_post_scrollController.position.outOfRange) {
      setState(() {
        print("comes to bottom $post.isLoading");
        post.isLoading = true;

        if (post.isLoading) {
          print("RUNNING LOAD MORE");

          post.pageCount = post.pageCount + 1;

          post.addPostIntoLisT(post.pageCount);
        }
      });
    }
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var size = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.black87,

        appBar: new AppBar(
            backgroundColor: Colors.black87,
            actions: <Widget>[
             new IconButton(
               icon: new Icon(Icons.person_add_alt_1_sharp),
               onPressed:() => {},
             ),
              new IconButton(
                icon: new Icon(Icons.add_alert_sharp),
                onPressed:() => {},
              ),
              new IconButton(
                icon: new Icon(Icons.search_sharp),
                onPressed:() => {},
              ),
            ]
        ),

        body : Column(
          children: [
            Container(
              height : 100,
              child: Expanded(child : StoryView()),
            ),
            Container(
              height : 80,
              padding : EdgeInsets.all(20),
              child : ButtonTheme(
                  minWidth: size.width,//버튼의 최소 가로 길이
                  height : size.height, //버튼의 세로 길이
                  shape: RoundedRectangleBorder( //버튼을 둥글게 처리
                  borderRadius: BorderRadius.circular(20)),
                  child: RaisedButton( //ButtonTheme의 child로 버튼 위젯 삽입
                    onPressed: () {},
                    child: Text(
                      'MAP SEEING',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                  ),
                ),
            ),
            Container(
              child: Expanded(child : PostView()),
            ),
          ],
        )
        ),
    );
  }
}
/*
class _Home extends State<Home> {
  final listcount = 100;
  List postList = <int>[];
  bool isLoading = false;
  late ScrollController _post_scrollController;
  var count = 0;
  int pageCount = 1;
  final int axiscount = 3;
  final int load_count = 24;

  void initState(){
    super.initState();
    //addItemIntoList(1);
    _post_scrollController = new ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double postHeight = (size.height - kToolbarHeight - 24) / 4;
    final double postWidth = size.width / axiscount;

    return MaterialApp(
      home: Scaffold(
        body: GridView.count(
          crossAxisCount: axiscount,
          childAspectRatio: (postWidth / postHeight),
          padding : EdgeInsets.all(0),
          controller: _post_scrollController,
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          children: postList.map((value) {
          count = (value % 4) + 1;
            return Container(
            alignment: Alignment.center,
            //decoration: BoxDecoration(
            //border: Border.all(color: Colors.black),
            //),
            child: Image(image: AssetImage('images/$count.jpg'), fit: BoxFit.cover),
           // child: Image("Item ${value}"),
            );
          }).toList(),
  /*
          children: List.generate(listcount, (index) {
            count = (index % 4) + 1;
            return Center(
              child: Image(image: AssetImage('images/$count.jpg')),
              //Text(
              //  'Item $index',
              //  style: Theme.of(context).textTheme.headline,
              //),


            );
          }),

   */
        ),
      ),
    );
  }
  //// ADDING THE SCROLL LISTINER
  _scrollListener() {
    if (_post_scrollController.offset >=
        _post_scrollController.position.maxScrollExtent &&
        !_post_scrollController.position.outOfRange) {
      setState(() {
        print("comes to bottom $isLoading");
        isLoading = true;

        if (isLoading) {
          print("RUNNING LOAD MORE");

          pageCount = pageCount + 1;

          addPostIntoLisT(pageCount);
        }
      });
    }
  }
  ////ADDING DATA INTO ARRAYLIST
  void addPostIntoLisT(var pageCount) {
    for (int i = (pageCount * load_count) - load_count; i < pageCount * load_count; i++) {
      postList.add(i);
      isLoading = false;
    }
  }

  @override
  void dispose() {
    _post_scrollController.dispose();
    super.dispose();
  }

}

 */