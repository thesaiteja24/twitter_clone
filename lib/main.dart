import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Twitter Clone'),
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
  final GlobalKey<FormState> _signInKey = GlobalKey();
  // Defining controller for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp emailValid = RegExp(
      r"^ [a-zA-Z0-9.a-zA-Z0-9. 1#$%&'*+-/=?^_ {|]~]+@ [a-zA-Z0-9] +\. [a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        key: _signInKey,
        child: Column(
          children: <Widget>[
            // Reason for using TextFormField is, it has special property called validator
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter an email',
                labelText: 'email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                } else if (!emailValid.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'password',
                hintText: 'Enter a password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter a valid password';
                } else if (value.length < 6) {
                  return 'Minumum Characters: 6';
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_signInKey.currentState!.validate()) {
                    print('Email: ${_emailController.text}'); // Retrieving data
                    print('Password: ${_passwordController.text}');
                  }
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
