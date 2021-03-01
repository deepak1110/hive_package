import 'dart:convert';

import 'package:hive/hive.dart';

part 'userEntity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String username;
  @HiveField(4)
  String image;
  @HiveField(5)
  String accessToken;
  @HiveField(6)
  String refreshToken;

  UserEntity({
    this.name = "",
    this.email = "",
    this.username = '',
    this.id = 0,
    this.accessToken = "",
    this.image,
    this.refreshToken,
  });

  String toRawJson() => json.encode(toJson());
  factory UserEntity.fromRawJson(String str) =>
      UserEntity.fromJson(json.decode(str));

  // Create from JSON data
  UserEntity.fromDBJson(Map<String, dynamic> json)
      : name = json['data']['name'] == null ? "" : json['data']['name'],
        email = json['data']['email'] == null ? "" : json['data']['email'],
        username =
            json['data']['username'] == null ? "" : json['data']['username'],
        // mobile = json['data']['mobile'] == null ? "" : json['data']['mobile'],
        id = json['data']['id'] == null ? "" : json['data']['id'],
        image = json['data']['id'] == null ? "" : json['data']['id'].toString();

  UserEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        username = json['username'],
        accessToken = json['token'];
  // Convert to JSON to make it easier when we store it in the database
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "token": accessToken
      };
}
