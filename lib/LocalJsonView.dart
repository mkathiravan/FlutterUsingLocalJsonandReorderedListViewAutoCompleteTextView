import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(new MaterialApp(

  theme: new ThemeData(
    primarySwatch: Colors.teal,
  ),
   home: new HomePage(),
));

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Load Json App"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle
              .of(context)
              .loadString('loaded_json/person.json'),
            builder: (context, snapshot){
              //Decode json

              var mydata = jsonDecode(snapshot.data.toString());

              //var mydata = JSON.decode(snapshot.data.toString());

              return new ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text("Name: "+ mydata[index]['name']),
                          new Text("Age: "+ mydata[index]['age']),
                          new Text("Gender: "+ mydata[index]['gender']),
                          new Text("Technology: "+ mydata[index]['technology']),
                          new Text("City: "+ mydata[index]['city']),

                        ],
                      ),
                    );
                  },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
            ),
        ),
      ),
    );
  }

}