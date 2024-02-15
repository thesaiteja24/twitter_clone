import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, LocalUser>((ref) {
  return UserNotifier();
});

class LocalUser {
  const LocalUser({required this.id, required this.user});

  final String id;
  final FirebaseUser user;

  LocalUser copyWith({
    String? id,
    FirebaseUser? user,
  }) {
    return LocalUser(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }
}

class UserNotifier extends StateNotifier<LocalUser> {
  UserNotifier()
      : super(
          const LocalUser(
            id: "error",
            user: FirebaseUser(email: "error"),
          ),
        );
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> logIn(String email) async {
    QuerySnapshot response = await _firestore
        .collection("users")
        .where('email', isEqualTo: email)
        .get();
    if (response.docs.isEmpty) {
      print("No firestore user associated to authenticatede email");
      return;
    }
    if (response.docs.length != 1) {
      print("More than one user detected");
    }
    state =
        LocalUser(id: response.docs[0].id, user: FirebaseUser(email: email));
  }

  Future<void> signUp(String email) async {
    DocumentReference response = await _firestore.collection("users").add(
          FirebaseUser(email: email).toMap(),
        );
    state = LocalUser(id: response.id, user: FirebaseUser(email: email));
  }

  void logOut() {
    state = const LocalUser(
      id: "error",
      user: FirebaseUser(email: "error"),
    );
  }
}
