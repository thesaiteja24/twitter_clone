import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
            user: FirebaseUser(
                email: "error", name: 'error', profilePic: 'error'),
          ),
        );
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _stroage = FirebaseStorage.instance;

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
    state = LocalUser(
        id: response.docs[0].id,
        user: FirebaseUser.fromMap(
            response.docs[0].data() as Map<String, dynamic>));
  }

  Future<void> signUp(String email) async {
    DocumentReference response = await _firestore.collection("users").add(
          FirebaseUser(
                  email: email,
                  name: 'No Name',
                  profilePic: "https://www.gravatar.com/avatar/?d=mp")
              .toMap(),
        );
    DocumentSnapshot snapshot = await response.get();
    state = LocalUser(
        id: response.id,
        user: FirebaseUser.fromMap(snapshot.data() as Map<String,
            dynamic>)); // Firebase defines this data as an object but it a map so 'as map' is used
  }

  Future<void> updateName(String newName) async {
    await _firestore.collection("users").doc(state.id).update(
      {"name": newName},
    );
    state = state.copyWith(user: state.user.copyWith(name: newName));
  }

  Future<void> updateImg(File img) async {
    Reference ref = _stroage.ref().child("users").child(state.id);
    TaskSnapshot snapshot = await ref.putFile(img);
    String profilePicURL = await snapshot.ref.getDownloadURL();

    await _firestore.collection("users").doc(state.id).update(
      {"profilePic": profilePicURL},
    );
    state =
        state.copyWith(user: state.user.copyWith(profilePic: profilePicURL));
  }

  void logOut() {
    state = const LocalUser(
      id: "error",
      user: FirebaseUser(email: "error", name: "error", profilePic: "error"),
    );
  }
}
