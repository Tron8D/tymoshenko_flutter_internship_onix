import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_intership_onix/data/remote/response/user_preferences.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('preferences');

  Future<UserPreferences?> getPreferences(String uid) async {
    try {
      var _document = collection.doc(uid);
      var _preferenceObject = await _document.get();

      return UserPreferences.fromJson(_preferenceObject);
    } catch (e) {
      return null;
    }
  }

  void addPreferences(String uid, UserPreferences userPreferences) {
    collection.doc(uid).set(userPreferences.toJson());
  }

  void updatePreferences(String uid, UserPreferences userPreferences) async {
    await collection.doc(uid).update(userPreferences.toJson());
  }
}
