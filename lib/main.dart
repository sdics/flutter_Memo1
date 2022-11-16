import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xff2B2D2D),
          scaffoldBackgroundColor: Color(0xff2B2D2D)),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = " ";
  List todo = [];

  @override
  void initState() {
    todo.add("Cycling");
    todo.add("add");
    todo.add("Cycling");
    todo.add("add");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "NOTES APP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              letterSpacing: 4,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.red[500],
            size: 35,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Color(0xffF48C8C),
                    title: Text("Add Todo's'"),
                    content: TextField(
                      decoration: InputDecoration(hintText: "Todo's"),
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            todo.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
              itemCount: todo.length,
              itemBuilder: (BuildContext context, index) {
                return Dismissible(
                  key: Key(todo[index]),
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      title: Text(
                        todo[index],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete_forever_rounded,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            todo.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
