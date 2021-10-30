import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Main driver thing

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'THE VOID',

      // Theme for whole app

      theme: ThemeData(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            // Row of Buttons
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              // Button 1
              TextButton(
                child: const Text('SUBMIT'),
                onPressed: () {
                  currentSaved = fieldControl.text;
                  fieldControl.text = "";
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
      // Vault button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Vault screen (temporarily void screen)
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
      ),
    );
  }
}

// Settings Page
// Theres literally nothing on here

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
          // Go Back
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go Back!"),
          ),
        ])));
  }
}

// Vault screen

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
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 3000),
              curve: Curves.easeInOutBack,
              child: widget.savedText,
            ),
            duration: const Duration(milliseconds: 0),
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

// Seriously ignore this

// But don't delete it

// It's for animation reference

// Stop reading this Jacob

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
