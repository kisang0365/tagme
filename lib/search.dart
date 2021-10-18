import 'package:flutter/material.dart';
import 'post.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'search_detail.dart';
//https://camposha.info/flutter/flutter-staggeredgridview/
class SearchView extends StatefulWidget{
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView>{

  late ScrollController _serach_scrollController;
  late int count;
  List<String> images = [];
  bool isLoading = false;

  void initState(){
    super.initState();
    addItemIntoList();
    _serach_scrollController = new ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
  }
  void addItemIntoList(){
    for (int i = 0; i< 20; i++){
      int cnt = i % 4 + 1;
      images.add("images/$cnt.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 3;

    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            // The search area here
              backgroundColor: Colors.black87,
              title: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(
                  child : Center(
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.black38,
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              /* Clear the search field */
                            },
                          ),
                          //hintText: 'Search...',
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
              )),
          body : Column(
            children: [
              Expanded(
                child: new StaggeredGridView.countBuilder(
                  crossAxisCount: 3,
                  itemCount: images.length,
                  controller: _serach_scrollController,
                  itemBuilder: (BuildContext context, int index) => new Container(
                    child: InkWell(
                      onTap:(){
                        Navigator.push(context,
                          MaterialPageRoute(builder:(context)=>SearchDetail(imageUrl : images[index])),
                        );
                      },
                      child: Image(image: AssetImage(images[index]), height : itemHeight, fit: BoxFit.cover),
                    ),
                      //color: Colors.black87,
                      //child: Image(image: AssetImage(images[index]), height : itemHeight, fit: BoxFit.cover),
                  ),
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count((index == 0) ? 2 : 1, (index == 0) ? 2.2 : 1.1),
                ),
              ),
            ],
          )
      ),
    );
  }
  //// ADDING THE SCROLL LISTINER
  _scrollListener() {
    if (_serach_scrollController.offset >=
        _serach_scrollController.position.maxScrollExtent &&
        !_serach_scrollController.position.outOfRange) {
      setState(() {
        print("comes to bottom isLoading ${images.length}");
        isLoading = true;

        if (isLoading) {
          print("RUNNING LOAD MORE");
          isLoading = false;
          addItemIntoList();
        }
      });
    }
  }
}

class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}
class _Search extends State<Search> {
  @override
  List<String> imagePath = [];

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
              backgroundColor: Colors.black87,
            /*
            appBar: AppBar(
              // The search area here
                backgroundColor: Colors.black87,
                title: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey, borderRadius: BorderRadius.circular(30)),
                  child: SingleChildScrollView(
                    child : Center(
                      child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.black38,
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                /* Clear the search field */
                              },
                            ),
                            //hintText: 'Search...',
                            border: InputBorder.none
                          ),
                      ),
                  ),
                  ),
                )),*/
            body : Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SearchView(),
                      ),
                    ],
            )
        ),

    );
  }
}