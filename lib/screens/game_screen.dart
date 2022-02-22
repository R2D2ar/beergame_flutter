import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {


  final _yearController = TextEditingController();
  final _monthController = TextEditingController();
  final _inventoryController = TextEditingController();
  final _backlogController = TextEditingController();
  final _backorderController = TextEditingController();

  @override
  void initState() {
    _yearController.addListener(() {
      fetchData();
    });
    _yearController.text = "jjjj";
    super.initState();
  }

  void fetchData() {
    print(_yearController.value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Controls"), foregroundColor: Colors.white),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: [
            //Todo: Implement the GameView
            Center(
              child: SingleChildScrollView(
                child: gameController(),
              ),
            )
          ]),
    );
  }

  Container gameController() {
    return Container(
        width: 600,
        height: 500,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.orange, width: 2.0)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Information",
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: TextField(
                        controller: _yearController,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            filled: true,
                            hoverColor: Colors.orange.shade100,
                            border: OutlineInputBorder(),
                            hintText: "Year"),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: TextField(
                        controller: _monthController,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            filled: true,
                            hoverColor: Colors.orange.shade100,
                            border: OutlineInputBorder(),
                            hintText: "Month"),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: TextField(
                        controller: _inventoryController,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            filled: true,
                            hoverColor: Colors.orange.shade100,
                            border: OutlineInputBorder(),
                            hintText: "Inventory"),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: TextField(
                        controller: _backorderController,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            filled: true,
                            hoverColor: Colors.orange.shade100,
                            border: OutlineInputBorder(),
                            hintText: "Backorder"),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: TextField(
                        controller: _backlogController,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            filled: true,
                            hoverColor: Colors.orange.shade100,
                            border: OutlineInputBorder(),
                            hintText: "Backlog"),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 2,height: 10, color: Colors.black,),
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextField(
                        controller: _inventoryController,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            filled: true,
                            hoverColor: Colors.orange.shade100,
                            border: OutlineInputBorder(),
                            hintText: "New Order Received"),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextField(
                        controller: _backorderController,
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            filled: true,
                            hoverColor: Colors.orange.shade100,
                            border: OutlineInputBorder(),
                            hintText: "New Delivery"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Actions",
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
              Row(children: [

              ],)

            ],
          ),
        ));
  }

  @override
  void dispose() {
    _yearController.dispose();
    _monthController.dispose();
    _inventoryController.dispose();
    _backlogController.dispose();
    _backorderController.dispose();
    super.dispose();
  }
}
