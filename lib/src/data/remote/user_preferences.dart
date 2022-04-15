import 'package:cloud_firestore/cloud_firestore.dart';

class UserPreferences {
  final int topCard;
  final int bottomCard;

  UserPreferences({required this.topCard, required this.bottomCard});

  factory UserPreferences.fromJson(DocumentSnapshot<Object?> json) =>
      UserPreferences(
        topCard: json['topCard'] as int,
        bottomCard: json['bottomCard'] as int,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'topCard': topCard,
        'bottomCard': bottomCard,
      };
}
