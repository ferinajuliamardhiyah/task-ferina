import 'package:flutter/material.dart';

void main() => runApp(Coba());

class Coba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: Login());
  }
}

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  String username = "";
  //String password = "";
  void handleChange(e) {
    setState(() {
      username = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Column(children: <Widget>[
          Stack(alignment: AlignmentDirectional.centerStart, children: <Widget>[
            Container(child: Image(image: AssetImage('images/pantai.jpg'))),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                      image: AssetImage('images/holiday.png'),
                      width: 25.0,
                      height: 25.0),
                  Text('LOGO',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold))
                ],
              ),
            )
          ]),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              margin: EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text('Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 20.0),
                        child: TextField(
                            onChanged: (e) => handleChange(e),
                            obscureText: true,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: 'Username'))),
                    Container(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0),
                        child: TextField(
                            onChanged: (e) => handleChange(e),
                            obscureText: true,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: 'Password'))),
                    Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
                        child: Text('Forgot password?',
                            style: TextStyle(color: Colors.blue))),
                  ])),
          Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 10.0),
              child: RaisedButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  padding: EdgeInsets.all(0.0),
                  elevation: 5.0,
                  child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      height: 40.0,
                      width: 100.0,
                      alignment: Alignment.center,
                      child: const Text('LOGIN',
                          style: TextStyle(fontSize: 15))))),
          Spacer(),
          Stack(alignment: AlignmentDirectional.center, children: <Widget>[
            Container(
                child: Image(
                    image: AssetImage('images/kota.png'),
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                    colorBlendMode: BlendMode.modulate)),
            Container(
                child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                            image: AssetImage('images/fb.jpg'),
                            width: 25.0,
                            height: 25.0),
                        Image(
                            image: AssetImage('images/google.jpg'),
                            width: 25.0,
                            height: 25.0),
                        Image(
                            image: AssetImage('images/twitter.png'),
                            width: 25.0,
                            height: 25.0),
                        Image(
                            image: AssetImage('images/linkedin.png'),
                            width: 25.0,
                            height: 25.0),
                      ])),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('New User?'),
                    Text(' Sign Up', style: TextStyle(color: Colors.blue))
                  ])
            ]))
          ])
        ])));
  }
}