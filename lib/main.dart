import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final eMail = TextEditingController();
  final passWord = TextEditingController();
  String fName = '';
  String lName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Sign Up'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Firs Name'),
            TextField(
              controller: firstName,
            ),
            Text('Last Name'),
            TextField(
              controller: lastName,
            ),
            Text('Email'),
            TextField(
              controller: eMail,
            ),
            Text('Password'),
            TextField(
              obscureText: true,
              controller: passWord,
            ),
            FlatButton(
              color: Colors.blueAccent,
              onPressed: () {
                signUp();
                setState(() {
                  fName = firstName.text;
                  lName = lastName.text;
                  email = eMail.text;
                  password = passWord.text;
                });
              },
              child: Text('Submit'),
            ),
            Text(
              fName,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              lName,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              email,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              password,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void signUp() async {
    String url = "http://solutionhub.com.pk/basic_app_apis/sign_up.php";
    String json =
        '{"FirstName":"$fName","LastName":"$lName","Email":"$email","Password":"$password"}';
    final response = await http.post(url, body: json);

    print(json);
    int statusCode = response.statusCode;

    if (response.statusCode == 200) {
      print('Api hit ho gai');
    }
  }
}
