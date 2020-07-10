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

//this my tested work.............................
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fName = TextEditingController();
  final lName = TextEditingController();
  final uGender = TextEditingController();
  final eMail = TextEditingController();
  final pWord = TextEditingController();
  final conPassword = TextEditingController();
  final uContact = TextEditingController();

  String firstName;
  String lastName;
  String gender = 'Male';
  String email;
  String password;
  String confirmPassword;
  String contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('Firs Name'),
            TextField(controller: fName),
            Text('Last Name'),
            TextField(controller: lName),
            ListTile(
              leading: Radio(
                value: 'Male',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              title: Text('Male'),
            ),
            ListTile(
              leading: Radio(
                value: 'Female',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              title: Text('Female'),
            ),
            Text('Email'),
            TextField(controller: eMail),
            Text('Password'),
            TextField(controller: pWord),
            Text('Confirm Password'),
            TextField(controller: conPassword),
            Text('Contact Details'),
            TextField(controller: uContact),
            FlatButton(
              color: Colors.blueAccent,
              onPressed: () {
                firstName = fName.text;
                lastName = lName.text;
                email = eMail.text;
                password = pWord.text;
                contact = uContact.text;
                confirmPassword = conPassword.text;
                password == confirmPassword
                    ? register()
                    : print('fill the confirm password');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void register() async {
    String url = 'https://solutionhub.com.pk/basic_app_apis/register.php';
    String jSon =
        '{"uFirstName":"$firstName","uLastName":"$lastName","uEmail":"$email","uPassword":"$password","uContact":"$contact","uGender":"$gender"}';
    var response = await http.post(url, body: jSon);

    if (response.statusCode == 200) {
      print('it works ');
      print(response.statusCode);
    } else {
      print('Something is wrong');
      print(response.statusCode);
    }
  }
}
