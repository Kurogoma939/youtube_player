import 'package:flutter/material.dart';

class ScreenZ extends StatelessWidget {
  const ScreenZ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Screen Z'),
      ),
      body: const Center(
        child: Text('Welcome to Screen Z'),
      ),
    );
  }
}
