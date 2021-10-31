import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
  GoogleFonts.config.allowRuntimeFetching = true;
}

// Main driver thing

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'THE VOID',

      // Theme for whole app

      theme: ThemeData(
        primaryColor: const Color(0xff9ad5f4),
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 25.0, color: Colors.white),
            bodyText2: TextStyle(fontSize: 50.0, color: Colors.white),
            subtitle1:
                TextStyle(fontSize: 25.0, color: Colors.white) // Void text
            ),
      ),
      home: const MyHomePage(title: 'The Void'),
    );
  }
}

// Home page

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// State for the Home Page

class _MyHomePageState extends State<MyHomePage> {
  var fieldControl = TextEditingController();
  var currentSaved = "";
  List savedItems = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff42d0bd), Color(0xff3a9efa)])),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              widget.title,
              style: GoogleFonts.alexBrush(fontSize: 40),
            ),
            actions: [
              // Settings button
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
                tooltip: 'Settings',
                icon: const Icon(Icons.settings),
                color: const Color(0xff9ad5f4),
                highlightColor: Colors.blue,
              )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Enter troubles here',
                    style: TextStyle(fontSize: 40),
                  ),
                ),

                TextField(
                  controller: fieldControl,
                  maxLines: null,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                      // fillColor: Color(0xff0A1127),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  // border: UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.white))),
                ),
                // Row of Buttons
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Button 1
                      TextButton(
                        child: const Text('SUBMIT'),
                        onPressed: () {
                          currentSaved = fieldControl.text;
                          fieldControl.text = "";
                          savedItems.add(currentSaved);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                      ),
                      // Button 2
                      TextButton(
                        child: const Text('CLEAR'),
                        onPressed: () {
                          fieldControl.text = "";
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                      ),
                      // Button 3
                      TextButton(
                        child: const Text('SEND TO VOID'),
                        onPressed: () {
                          Text voidText = Text(fieldControl.text,
                              style: Theme.of(context).textTheme.bodyText2);
                          currentSaved = '';
                          fieldControl.text = '';
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SendToVoid(savedText: voidText)));
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
          // Vault button
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Vault screen (temporarily void screen)
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VaultView(
                            savedText: Text(currentSaved),
                            itemList: savedItems,
                          )));
            },
            tooltip: 'Vault',
            child: const Icon(Icons.savings_rounded),
          ),
        ));
  }
}

// Settings Page

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff42d0bd), Color(0xff3a9efa)])),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Change Color"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Change Font"),
                    ),
                  ),
                  // Go Back
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Go Back!"),
                    ),
                  ),
                ]))));
  }
}

// Vault screen

class VaultView extends StatelessWidget {
  const VaultView({Key? key, required this.savedText, required this.itemList})
      : super(key: key);

  final Text savedText;
  final List itemList;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff94c9f0), Color(0xffd48fd1)])),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Vault"),
            ),
            body: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(itemList[index],
                        style: Theme.of(context).textTheme.subtitle1),
                    // tileColor: Colors.white,
                  );
                })));
  }
}

// Vault state

class SendToVoid extends StatefulWidget {
  const SendToVoid({Key? key, required this.savedText}) : super(key: key);
  final Text savedText;
  @override
  _SendToVoidState createState() => _SendToVoidState();
}

class _SendToVoidState extends State<SendToVoid> {
  double rotation = 0.0;
  double opacity = 1.0;
  double scale = 1.0;
  Duration duration = const Duration(milliseconds: 3500);
  Curve curve = Curves.easeIn;
  void change() {
    setState(() {
      rotation = 7.0;
      opacity = 0.0;
      scale = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 0), () {
      change();
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("THE VOID"
            // TextStyle(color: Colors.black),
            ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: duration,
              curve: curve,
              child: AnimatedRotation(
                turns: rotation,
                duration: duration,
                curve: curve,
                // This is the text
                child: AnimatedScale(
                  scale: scale,
                  duration: duration,
                  curve: curve,
                  child: widget.savedText,
                ),
              ),
            ),
            duration: duration,
            curve: curve,
          ),
        ],
      )),
    );
  }
}
