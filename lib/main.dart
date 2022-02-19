import 'package:beergame/screens/game_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'image/image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter',
      theme: ThemeData(
        primaryColor: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
            .copyWith(secondary: Colors.blue),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final groupController = TextEditingController();
  final roleController = TextEditingController();

  void _checkInput() {
    if (groupController.value == "" && roleController.value == "") {
      setState(() {
        //TODO:Add Mysql Checking
      });
    }
    //-------------
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const GameScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Beergame"),
          foregroundColor: Colors.white,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    _aboutDialog();
                  },
                  child: const Text("ABOUT"),
                )),
          ],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: null,
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 2.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    alignment: Alignment.center,
                    width: 450.0,
                    height: 300.0,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: Row(
                          children: const [
                            Text(
                              "Login",
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              hoverColor: Colors.orange.shade100,
                              border: OutlineInputBorder(),
                              hintText: "Enter Group Id ..."),
                          controller: groupController,

                          toolbarOptions:
                              const ToolbarOptions(copy: false, cut: false),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              hoverColor: Colors.orange.shade100,
                              border: OutlineInputBorder(),
                              hintText: "Enter Role ..."),
                          controller: roleController,
                          toolbarOptions:
                              const ToolbarOptions(copy: false, cut: false),
                        ),
                      ),
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: OutlinedButton(
                              onPressed: _checkInput,
                              style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(200, 80))),
                              child: const Text("Confirm", style: TextStyle(fontSize: 30),)),
                        )
                      ], mainAxisAlignment: MainAxisAlignment.end)
                      //Group
                    ]),
                  )
                ]),
          ),
        ));
  }

  void checkGroup() {
    if (kDebugMode) {
      print("Group Selected: ${groupController.text}");
    }
  }

  @override
  void dispose() {
    groupController.dispose();
    roleController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _aboutDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('About'),
            content: const SizedBox(
              width: 20.0,
              child: AboutImage(),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: const Text('Close')),
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }
}
