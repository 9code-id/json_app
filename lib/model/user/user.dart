import 'dart:convert';

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? dob,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        dob: dob ?? this.dob,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "dob": dob,
      };

  String get2DigitChar() {
    var name2DigitChar = firstName![0].toUpperCase() +
        (lastName == null ? "" : lastName![0].toUpperCase());
    return name2DigitChar;
  }
}
