import 'package:flutter/material.dart';
import 'post.dart';

class Post {
  late List list;
  late bool isLoading;

  late int count;
  late int axiscount;
  late int pageCount;
  late int loadCount;

  Post(int axisCount, int pageCount, loadCount){
    this.list = <int>[];
    this.isLoading = false;
    this.count = 0;
    this.axiscount = axisCount;
    this.pageCount = pageCount;
    this.loadCount = loadCount;
  }

  ////ADDING DATA INTO ARRAYLIST
  void addPostIntoLisT(var pageCount) {
    for (int i = (pageCount * loadCount) - loadCount; i < pageCount * loadCount; i++) {
      list.add(i);
      isLoading = false;
    }
  }
}