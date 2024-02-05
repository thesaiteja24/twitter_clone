import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final String? name;
  const ThirdPage({super.key, this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Hi, $name'),
      ),
    );
  }
}
