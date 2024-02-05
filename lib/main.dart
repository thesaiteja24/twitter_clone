import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/rendering.dart';
import 'package:twitter_clone/pages/first.dart';
import 'package:twitter_clone/pages/fourth.dart';
import 'package:twitter_clone/pages/second.dart';
import 'package:twitter_clone/pages/third.dart';
import 'package:twitter_clone/pages/fifth.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();S
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/first': (context) => const FirstPage(),
        '/fourth': (context) => const FourthPage(),
        '/fifth': (context) => const FifthPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // Named Navigation
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/first");
              },
              child: const Text("First Page"),
            ),

            // Simple Navigation
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
              child: const Text("Second Page"),
            ),

            // Navigation With data using Basic Navigation
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ThirdPage(name: 'Sai Teja'),
                  ),
                );
              },
              child: const Text("Third Page"),
            ),

            // Navigatin With data using named navigation
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/fourth", arguments: "Sai Teja");
              },
              child: const Text("Fourth Page"),
            ),
            TextButton(
              onPressed: () async {
                final response = await (Navigator.pushNamed(context, "/fifth",
                    arguments: "Sai Teja"));
                print(response);
              },
              child: const Text("Fifth Page"),
            ),
          ],
        ),
      ),
    );
  }
}
