import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DummyJson());
  }
}

class DummyJson extends StatefulWidget {
  @override
  _DummyJsonState createState() => _DummyJsonState();
}

class _DummyJsonState extends State<DummyJson> {

  Future<List<Categories>> _getEmployee() async {
    var empData = await http.get("http://10.0.2.2:8080/category");
    var jsonData = json.decode(empData.body);
    Set s = new Set();
    for(var v in jsonData){
      s.add(v["category"]);
    }
    List<Categories> employees = [];
    for (var emp in s) {
      Categories c = new Categories(emp);
      employees.add(c);
    }
    print(employees.length);
    return employees;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder(
        future: _getEmployee(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("Loading..."),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: (){},
                  /*   onTap: () {
                    post_product(snapshot.data[index].id.toString());
                  }, */
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://dummyimage.com/300/09f/fff.png'),
                  ), 
                  title: Text(
                    snapshot.data[index].category,
                  ),
                  //subtitle: Text(snapshot.data[index].id),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class Categories {
  String category;
  Categories(this.category);
}

/* import 'package:WIBI/variables.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Employee.dart';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/
