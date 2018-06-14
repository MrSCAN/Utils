import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }
 @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Utils App"),
      ),
      body: new TabBarView(
        children: <Widget>[
          new NewPage(title: 'first'),
          new NewPage(title: 'Second'),

        ],
        controller: _controller,
          ),
      bottomNavigationBar: new Material(
        color: Colors.teal,
        child: new TabBar(tabs:<Widget>[
          new Tab(
            icon: new Icon(Icons.favorite),
          ),
          new Tab(
            icon: new Icon(Icons.email),
          ),
        ],
        controller: _controller,),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  AlertDialog dialog = new AlertDialog(
    content: new Text('Dialog is up', style: new TextStyle(
      fontSize: 30.0,
    ),),
    title: new Text("Alert!!!"),
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new RaisedButton(
          onPressed: () {
            Scaffold.of(context).showSnackBar(
              new SnackBar(content: new Text("Download Started ..."),
                duration: new Duration(seconds: 3),
                backgroundColor: Colors.teal,
              ),
            );
            showDialog(context: context, child: dialog);
          },
          child: new Text("Click me"),
          color: Colors.teal,
        ),
      ),
    );
  }
}

class Steps extends StatefulWidget {
  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  int currentStep = 0;
  List<Step> my_steps  =[
    new Step(
        title: new Text('Step 1'), content: new Text('New content 1'),
        isActive: true),
    new Step(
        title: new Text('Step 2'), content: new Text('New content 2'),
        isActive: true),
    new Step(
        title: new Text('Step 3'), content: new Text('New content 3'),
        isActive: true),
  ];
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Stepper(
        steps:my_steps,
        currentStep: this.currentStep,
        type: StepperType.vertical,
      ),
    );
  }
}

class NewPage extends StatelessWidget {

  final String title;
  NewPage({this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(title),
      ),
    );
  }
}
