import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'THE VOID',
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
        // primarySwatch: Colors.white,
        primaryColor: const Color(0xff9ad5f4),
        scaffoldBackgroundColor: const Color(0xff487B9a),
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 25.0),
        ),
      ),
      home: const MyHomePage(title: 'THE VOID'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  // void clearText(){
  //   TextField.clear()
  // }
  var fieldControl = TextEditingController();
  var currentSaved = "";
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
        actions: [
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   'HELLO WORLD',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            Text(
              'Enter troubles here',
              style: Theme.of(context).textTheme.bodyText1,
            ),

            TextField(
              controller: fieldControl,
              maxLines: null,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                  fillColor: Color(0xff0A1127),
                  filled: true,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              TextButton(
                child: const Text('SUBMIT'),
                onPressed: () {
                  // debugPrint(fieldControl.text);
                  currentSaved = fieldControl.text;
                  fieldControl.text = "";
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
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
              TextButton(
                child: const Text('REPLACE'),
                onPressed: () {
                  fieldControl.text = currentSaved;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SendToVoid(
                          savedText: Text(
                        currentSaved,
                        style: Theme.of(context).textTheme.bodyText1,
                      ))));
        },
        tooltip: 'Vault',
        child: const Icon(Icons.savings_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Settings Page

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go Back!"),
          ),
        ])));
  }
}

class VaultView extends StatelessWidget {
  const VaultView({Key? key, required this.savedText}) : super(key: key);

  final Text savedText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vault"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          savedText,
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go Back!"),
          )
        ],
      )),
    );
  }
}

class SendToVoid extends StatefulWidget {
  const SendToVoid({Key? key, required this.savedText}) : super(key: key);
  final Text savedText;
  @override
  _SendToVoidState createState() => _SendToVoidState();
}

class _SendToVoidState extends State<SendToVoid> {
  double rotation = 0.0;
  double opacity = 1.0;
  void change() {
    setState(() {
      rotation = 10.0;
      opacity = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vault"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            child: Opacity(
              opacity: opacity,
              child: widget.savedText,
            ),
            duration: const Duration(seconds: 3),
            curve: Curves.easeInOutBack,
          ),
          ElevatedButton(
            onPressed: () {
              change();
            },
            child: const Text("Send to void"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go Back!"),
          )
        ],
      )),
    );
  }
}

// IGNORE THE REST

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key? key, required this.controller})
      :

        // Each animation defined here transforms its value during the subset
        // of the controller's duration defined by the animation's interval.
        // For example the opacity animation transforms its value during
        // the first 10% of the controller's duration.

        opacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.100,
              curve: Curves.ease,
            ),
          ),
        ),
        width = Tween<double>(
          begin: 50.0,
          end: 150.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.125,
              0.250,
              curve: Curves.ease,
            ),
          ),
        ),
        height = Tween<double>(begin: 50.0, end: 150.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.250,
              0.375,
              curve: Curves.ease,
            ),
          ),
        ),
        padding = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 16.0),
          end: const EdgeInsets.only(bottom: 75.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.250,
              0.375,
              curve: Curves.ease,
            ),
          ),
        ),
        borderRadius = BorderRadiusTween(
          begin: BorderRadius.circular(4.0),
          end: BorderRadius.circular(75.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.375,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        color = ColorTween(
          begin: Colors.indigo[100],
          end: Colors.orange[400],
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.500,
              0.750,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius?> borderRadius;
  final Animation<Color?> color;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            border: Border.all(
              color: Colors.indigo[300]!,
              width: 3.0,
            ),
            borderRadius: borderRadius.value,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  const StaggerDemo({Key? key}) : super(key: key);

  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Animation'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: StaggerAnimation(controller: _controller.view),
          ),
        ),
      ),
    );
  }
}
