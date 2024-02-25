import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/tweet.dart';
import 'package:twitter_clone/pages/create.dart';
import 'package:twitter_clone/providers/tweet_provider.dart';
import 'package:twitter_clone/providers/user_provider.dart';
import 'package:twitter_clone/pages/settings.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LocalUser currentUser = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(currentUser.user.profilePic),
              ),
            ),
          );
        }),
      ),
      body: ref.watch(feedProvider).when(
          data: (List<Tweet> tweets) {
            return ListView.builder(
                itemCount: tweets.length,
                itemBuilder: (context, count) {
                  return ListTile(
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(tweets[count].profilePic),
                    ),
                    title: Text(
                      tweets[count].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      tweets[count].content,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  );
                });
          },
          error: (error, stackTrace) => const Center(child: Text("error")),
          loading: () => const CircularProgressIndicator()),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Image.network(currentUser.user.profilePic),
              ListTile(
                title: Text(
                  "Hello, ${currentUser.user.name}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              ListTile(
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Settings()));
                },
              ),
              ListTile(
                title: const Text("Sign Out"),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  ref.read(userProvider.notifier).logOut();
                },
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CreateTweet()));
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
