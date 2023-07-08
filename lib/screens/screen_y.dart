import 'package:flutter/material.dart';

class ScreenY extends StatelessWidget {
  const ScreenY({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Screen Y'),
      ),
      body: const Center(
        child: Text('Welcome to Screen Y'),
      ),
    );
  }
}
