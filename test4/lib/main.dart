import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  TextEditingController stackController = TextEditingController();
  TextEditingController firstnameEditingController = TextEditingController();
  TextEditingController surnameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan[800].withOpacity(0.2),
          title: Text(
            'First screen',
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child: Column(
              children: [
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 1,
                    bottom: 1,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.cyan[200].withOpacity(0.2),
                  ),
                  child: TextFormField(
                    controller: firstnameEditingController,
                    validator: (val) {
                      return val.isEmpty || val.length < 3
                          ? "Enter Username 3+ characters"
                          : null;
                    },
                    decoration: InputDecoration(
                      hintText: "Firstname",
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 1,
                    bottom: 1,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.cyan[200].withOpacity(0.2),
                  ),
                  child: TextFormField(
                    controller: surnameEditingController,
                    validator: (val) {
                      return val.isEmpty || val.length < 3
                          ? "Enter Username 3+ characters"
                          : null;
                    },
                    decoration: InputDecoration(
                      hintText: "Surname",
                      icon: Icon(
                        Icons.person,
                        color: Colors.amber,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 1,
                    bottom: 1,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.cyan[200].withOpacity(0.2),
                  ),
                  child: TextFormField(
                    controller: stackController,
                    validator: (val) {
                      return val.isEmpty || val.length < 3
                          ? "Enter Username 3+ characters"
                          : null;
                    },
                    decoration: InputDecoration(
                      hintText: "stack",
                      icon: Icon(
                        Icons.work,
                        color: Colors.amber,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 26,
          ),
          GestureDetector(
            onTap: () {
              pushtodetailtoScreen(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.cyan[800].withOpacity(0.2),
              ),
              width: MediaQuery.of(context).size.width - 30,
              child: Text(
                "Sumbit and View",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // get the text in the TextField and start the Second Screen
  void pushtodetailtoScreen(BuildContext context) {
    String stack = stackController.text;
    String firstname = firstnameEditingController.text;
    String surname = surnameEditingController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(
            text: surname,
            text2: firstname,
            text3: stack,
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  final String text;

  final String text2;

  final String text3;

  // receive data from the MyApp as a parameter
  SecondScreen(
      {Key key,
      @required this.text,
      @required this.text2,
      @required this.text3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan[800].withOpacity(0.2),
          title: Text('Info Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Surname : $text".toUpperCase(),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "Firstname : $text2".toUpperCase(),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "Stack : $text3".toUpperCase(),
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
