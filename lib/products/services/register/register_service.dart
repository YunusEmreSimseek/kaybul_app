import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaybul_app/products/enums/firebase_collections.dart';
import 'package:kaybul_app/products/models/user_model.dart';

abstract class IRegisterService {
  Future<bool> register({required UserModel user});
  Future<void> addIdIntoUser({required String email});
  CollectionReference<Object?> get userCollectionReference => FirebaseCollections.user.reference;
}

final class RegisterService extends IRegisterService {
  @override
  Future<void> addIdIntoUser({required String email}) async {
    final response = await userCollectionReference
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
      await userCollectionReference.doc(user.id).update(user.toJson());
    }
  }

  @override
  Future<bool> register({required UserModel user}) async {
    if (user.email == null || user.password == null) return false;
    final responseAuth =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email!, password: user.password!);
    if (responseAuth.user == null) return false;
    final response = await userCollectionReference.add(user.toJson());
    if (response.id.isEmpty) {
      return false;
    }
    return true;
  }
}
