import 'package:flutter/material.dart';

class FifthPage extends StatelessWidget {
  const FifthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fifth Page'),
        ),
        body: TextButton(
          child: const Text('POP'),
          onPressed: () {
            Navigator.of(context).pop('This is returning data');
          },
        ));
  }
}
