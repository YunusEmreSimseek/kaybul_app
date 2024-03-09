import 'package:equatable/equatable.dart';
import 'package:kaybul_app/products/models/base_firebase_model.dart';

final class UserModel with EquatableMixin, IdModel, BaseFirebaseModel<UserModel> {
  final String? name;
  final String? phoneNo;
  final String? email;
  final String? password;

  @override
  final String? id;
  UserModel({
    this.name,
    this.phoneNo,
    this.email,
    this.password,
    this.id,
  });

  @override
  List<Object?> get props => [
        name,
        phoneNo,
        email,
        password,
        id,
      ];

  UserModel copyWith({
    String? name,
    String? phoneNo,
    String? email,
    String? password,
    String? id,
  }) {
    return UserModel(
      name: name ?? this.name,
      phoneNo: phoneNo ?? this.phoneNo,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNo': phoneNo,
      'email': email,
      'password': password,
      'id': id,
    };
  }

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String?,
      phoneNo: json['phoneNo'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      id: json['id'] as String?,
    );
  }
}
