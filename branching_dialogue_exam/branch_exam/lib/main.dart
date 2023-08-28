import 'package:flutter/material.dart';

import './dialogue_start.dart';
import './constant.dart';

void main() {
  runApp(const DialoguePlayer());
}

class DialoguePlayer extends StatelessWidget {
  const DialoguePlayer({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DialoguePlayer',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'DialoguePlayer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                love,
                style: TextStyle(fontSize: 10),
              ),
              const CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
              const Text('Are you ready ?'),
              Container(
                width: 200,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DialogueStart();
                        },
                      ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.thumb_up),
                        Text('START'),
                        Icon(Icons.thumb_up)
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
