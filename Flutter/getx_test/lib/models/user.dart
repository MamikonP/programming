class UserModel {
  final int id;
  String email;
  String firstName;
  String lastName;
  String avatarUrl;

  UserModel(this.id, this.email, this.firstName, this.lastName, this.avatarUrl);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['id'],
      json['email'],
      json['first_name'],
      json['last_name'],
      json['avatar'],
    );
  }

  UserModel copyWith(
      {int? id,
      String? email,
      String? firstName,
      String? lastName,
      String? avatarUrl}) {
    return UserModel(
        id ?? this.id,
        email ?? this.email,
        firstName ?? this.firstName,
        lastName ?? this.lastName,
        avatarUrl ?? this.avatarUrl);
  }
}
