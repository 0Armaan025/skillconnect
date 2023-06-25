import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../common/constants.dart';
import '../../../common/utils.dart';
import '../../../credentials/supabase.credentials.dart';
import '../../home_screen/screens/home_screen.dart';
import '../models/user.dart';

class AuthRepository {
  //sign up here

  void signUp(BuildContext context, UserModel model) async {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: model.email, password: model.password)
        .then((value) async {
      //add user to firestore
      uid = firebaseAuth.currentUser?.uid ?? '';

      final response = await SupaBaseCredentials()
          .supabaseClient
          .storage
          .from('avatars')
          .upload('public${uid}/${uid}profile.png', imageFile!,
              fileOptions:
                  const FileOptions(cacheControl: '3600', upsert: false));

      final String publicUrl = SupaBaseCredentials()
          .supabaseClient
          .storage
          .from('avatars')
          .getPublicUrl('public${uid}/${uid}profile.png');

      print('the pbublic url is $publicUrl');

      UserModel newModel = UserModel(
          uid: uid,
          name: model.name,
          email: model.email,
          details: model.details,
          password: model.password,
          skills: model.skills,
          profilePictureUrl: publicUrl);

      imageFile = null;

      firestore
          .collection('users')
          .doc(uid)
          .set(newModel.toMap())
          .then((value) {
        moveScreen(context, HomeScreen(), isPushReplacement: true);
      }).catchError((e) {});
    });
  }

  void logIn(BuildContext context, String email, String password) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uid = firebaseAuth.currentUser?.uid ?? '';

      moveScreen(context, HomeScreen(), isPushReplacement: true);
    }).onError((error, stackTrace) {
      showSnackBar(context, error.toString());
    });
  }
}
