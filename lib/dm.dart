import 'package:flutter/material.dart';

class Person{
  String id;
  String imageUrl;
  int time;

  Person(this.id, this.imageUrl, this.time);
}

class DMTile extends StatelessWidget {
  DMTile(this._person);

  final Person _person;

  @override

  Widget build(BuildContext context) {
    backgroundColor: Colors.black87;
    return Ink(
      color : Colors.black87,
      child : ListTile(
      // leading: CircleAvatar(child: Icon(FontAwesomeIcons.adjust),),
      title: Column(
          children: [

            SizedBox(
              height:3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Column(
                        children : <Widget>[
                          Container(
                            width : 50,
                            height : 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image:DecorationImage(image: AssetImage('images/1.jpg'), fit: BoxFit.cover),
                                border: Border.all(width: 0, color: Colors.black87)),
                            //margin: EdgeInsets.all(20),
                            //padding: EdgeInsets.all(10),
                          ),
                        ]
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children : <Widget>[
                        SelectableText(
                          _person.id, //mydata[index]['word'],
                          // data[index]['word'],
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "${_person.time} 분",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                    children : <Widget>[
                      Container(
                        width : 50,
                        height : 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            image:DecorationImage(image: AssetImage('images/2.jpg'), fit: BoxFit.cover),
                            border: Border.all(width: 0, color: Colors.black87)),
                        //margin: EdgeInsets.all(20),
                        //padding: EdgeInsets.all(10),
                      ),
                    ]
                ),
              ],
            ),
            SizedBox(
              height:3,
            ),
          ]
      ),
    ),
    );
/*
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(_person.id),
      subtitle: Text("${_person.time}"),
      //trailing: Image(_person.isLeftHand),
  );
 */
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class DM extends StatefulWidget {
  @override
  _DM createState() => _DM();
}

class DMView extends StatefulWidget{
  @override
  _DMViewState createState() => _DMViewState();
}

class _DMViewState extends State<DMView> {

  List<Person> person = [];
  int maxLength = 50;
  int personLength = 0;
  bool is_loading = false;
  late ScrollController _dm_scrollController;

  void initState(){
    super.initState();
    _requestPerson();
    _dm_scrollController = new ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
  }
  _requestPerson() async {
/*
    String url = "https://eunjin3786.pythonanywhere.com/question/all/";
    var response = await http.get(url);
    var statusCode = response.statusCode;

    if (statusCode == 200) {
      String responseBody = utf8.decode(response.bodyBytes);
      list = jsonDecode(responseBody);
    }

    setState(() {
      questions = list;
    });
 */
  for (int i = 0; i < 10; i++)
  {
    if (personLength > maxLength)
    {
      break;
    }
    person.add(Person("id${personLength}", "image", personLength));
    personLength++;
  }
  }
  _scrollListener() {
    if (_dm_scrollController.offset >=
        _dm_scrollController.position.maxScrollExtent &&
        !_dm_scrollController.position.outOfRange) {
      setState(() {
        print("comes to bottom isLoading");
        is_loading = true;

        if (is_loading) {
          print("RUNNING LOAD MORE");
          _requestPerson();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //final double postHeight = (size.height - kToolbarHeight - 24) / 4;
    //final double postWidth = size.width / post.axiscount;

    return ListView.builder
    (
      itemCount: person.length,
      controller: _dm_scrollController,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0.3,
          child: DMTile(Person(person[index].id,person[index].imageUrl,person[index].time)),
        );
      },
    );
  }
}

class _DM extends State<DM> {
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
                child: Expanded(child : DMView()),
              ),
            ],
          )
      ),
    );
  }
}