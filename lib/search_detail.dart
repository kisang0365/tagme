import 'package:flutter/material.dart';
import 'post.dart';

class SearchDetail extends StatefulWidget {
  @override
  final String imageUrl;

  SearchDetail({required this.imageUrl});

  _SearchDetail createState() => _SearchDetail();
}
class _SearchDetail extends State<SearchDetail> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    //final double postHeight = (size.height - kToolbarHeight - 24) / 4;
    //final double postWidth = size.width / post.axiscount;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          children: [
            Container(
              child: Image(image: AssetImage(widget.imageUrl), fit: BoxFit.cover),
            )
          ],
        ),
      ),
    );
  }
}