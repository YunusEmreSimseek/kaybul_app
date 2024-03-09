import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kaybul_app/products/enums/firebase_collections.dart';
import 'package:kaybul_app/products/models/user_model.dart';

abstract class IUserService {
  Future<UserModel?> fetchSignedInUserDetails(String email);
  CollectionReference<Object?> get _userCollectionReference => FirebaseCollections.user.reference;
}

final class UserService extends IUserService {
  @override
  Future<UserModel?> fetchSignedInUserDetails(String email) async {
    final response = await _userCollectionReference
        .where("email", isEqualTo: email)
        .withConverter(
          fromFirestore: (snapshot, options) => UserModel().fromFirebase(snapshot),
          toFirestore: (value, options) {
            return value.toJson();
          },
        )
        .get();
    if (response.docs.isNotEmpty) {
      final user = response.docs.map((e) => e.data()).first;
      return user;
    }
    if (response.docs.isEmpty) {
      return null;
    }
    return null;
  }
}
