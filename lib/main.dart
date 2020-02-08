import 'package:cameraApp/camera.dart';
import 'package:flutter/material.dart';
import 'package:cameraApp/dropdownColor.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sæt din lampe op',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Sæt din lampe op'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var wireColors = [
    DropdownColor(color1: Colors.brown, color2: Colors.brown, colorText: 'Brun'),
    DropdownColor(color1: Colors.blue, color2: Colors.blue, colorText: 'Blå'),
    DropdownColor(color1: Colors.green, color2: Colors.yellow, colorText: 'Gul/Grøn'),
    DropdownColor(color1: Colors.transparent, color2: Colors.transparent, colorText: 'Ingen')
  ];
  DropdownColor wireColor1 = wireColors[0];
  DropdownColor wireColor2 = wireColors[1];
  DropdownColor wireColor3 = wireColors[wireColors.length - 1];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            new Container(
              margin: new EdgeInsets.all(10.0),
              color: Colors.grey[300],
              child: TextFormField(
                enabled: false,
                initialValue: "Sluk for afbryder.",
                decoration: InputDecoration(
                  labelText: '1)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), 
                    ),
                  ),
                ),
              ),
              new Container(
              margin: new EdgeInsets.all(10.0),
              color: Colors.grey[300],
              child: TextFormField(
                enabled: false,
                initialValue: "Fjern dækselet på lampe udtaget.",
                decoration: InputDecoration(
                  labelText: '2)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), 
                    ),
                  ),
                ),
              ),
              new Container(
              margin: new EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.25
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0)
                ),
                color: Colors.grey[300],        
              ),
              child: Column(
                children: <Widget>[
                Container(
                  color: Colors.grey[300],
                  child: TextFormField(
                    enabled: false,
                    initialValue: "Vælg ledning farver:",
                    decoration: InputDecoration(
                      labelText: '3)',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(style: BorderStyle.none, width: 0),
                        borderRadius: BorderRadius.circular(5), 
                        ),
                      ),
                    ),
                ),
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Text('Ledning 1: '),
                  Container(
                    color: wireColor1.color1,
                    child: new DropdownButton<DropdownColor>(
                      iconEnabledColor: Colors.black,
                      value: wireColor1,
                      items: wireColors.map((DropdownColor value) {
                      return new DropdownMenuItem<DropdownColor>(
                        value: value,
                        child: value
                      );
                    }).toList(),
                    onChanged: (DropdownColor newValue) {
                      setState(() {
                        wireColor1 = newValue;
                      });
                    },
                ),
                  ),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Text('Ledning 2: '),
                  Container(
                      color: wireColor2.color1,
                      child: new DropdownButton<DropdownColor>(
                        value: wireColor2,
                        iconEnabledColor: Colors.black,
                        items: wireColors.map((DropdownColor value) {
                        return new DropdownMenuItem<DropdownColor>(
                          value: value,
                          child: value,
                      );
                    }).toList(),
                    onChanged: (DropdownColor newValue) {
                      setState(() {
                        wireColor2 = newValue;
                      });
                    },
                ),
                  ),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Text('Ledning 3: '),
                  Container(
                    color: wireColor3.color1,
                    child: new DropdownButton<DropdownColor>(
                      value: wireColor3,
                      iconEnabledColor: Colors.black,
                      items: wireColors.map((DropdownColor value) {
                        return new DropdownMenuItem<DropdownColor>(
                          value: value,
                          child: value
                        );
                      }).toList(),
                      onChanged: (DropdownColor newValue) {
                        setState(() {
                          wireColor3 = newValue;
                        });
                    },
                ),
                  ),
                ],)
              ],
            ),
            ],),
              
            ),
            new Container(
              margin: new EdgeInsets.all(10.0),
              color: Colors.grey[300],
              child: TextFormField(
                enabled: false,
                initialValue: "Klik på Camera knappen og film lampe udtaget.",
                decoration: InputDecoration(
                  labelText: '4)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), 
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CameraState(title: "Detection Mode",)));}, 
        tooltip: 'Camera',
        child: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
