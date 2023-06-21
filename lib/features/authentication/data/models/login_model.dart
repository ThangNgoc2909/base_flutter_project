// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String? username;
  final String? password;
  final String? systemKey;
  final String? accessToken;
  final String? refreshToken;
  final User? user;
  final List<Profile>? profile;

  LoginModel({
    this.username,
    this.password,
    this.systemKey,
    this.accessToken,
    this.refreshToken,
    this.user,
    this.profile,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    username: json["username"],
    password: json["password"],
    systemKey: json["system_key"],
    accessToken: json["access_token"],
    refreshToken: json["refresh_token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    profile: json["profile"] == null ? [] : List<Profile>.from(json["profile"]!.map((x) => Profile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "system_key": systemKey,
    "access_token": accessToken,
    "refresh_token": refreshToken,
    "user": user?.toJson(),
    "profile": profile == null ? [] : List<dynamic>.from(profile!.map((x) => x.toJson())),
  };
}

class Profile {
  final int? profileId;
  final String? value;
  final String? profileName;

  Profile({
    this.profileId,
    this.value,
    this.profileName,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    profileId: json["profile_id"],
    value: json["value"],
    profileName: json["profile_name"],
  );

  Map<String, dynamic> toJson() => {
    "profile_id": profileId,
    "value": value,
    "profile_name": profileName,
  };
}

class User {
  final int? id;
  final String? username;
  final String? fullname;
  final String? email;
  final String? accountCode;
  final String? systemKey;
  final int? roomId;

  User({
    this.id,
    this.username,
    this.fullname,
    this.email,
    this.accountCode,
    this.systemKey,
    this.roomId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    fullname: json["fullname"],
    email: json["email"],
    accountCode: json["account_code"],
    systemKey: json["system_key"],
    roomId: json["room_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "fullname": fullname,
    "email": email,
    "account_code": accountCode,
    "system_key": systemKey,
    "room_id": roomId,
  };
}
