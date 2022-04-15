import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_intership_onix/src/data/remote/user_preferences.dart';

abstract class PreferencesDatabase {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('preferences');

  Future<UserPreferences?> getPreferences(String uid);

  void addPreferences(String uid, UserPreferences userPreferences);

  void updatePreferences(String uid, UserPreferences userPreferences);
}
