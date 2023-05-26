class StaffModel {
  final String? fullName;
  final String? email;
  final String? address;
  final List<String> skills;

  StaffModel({
    this.fullName,
    this.email,
    this.address,
    this.skills = const [],
  });

  StaffModel copyWith({
    String? fullName,
    String? email,
    String? address,
    List<String>? skills,
  }) =>
      StaffModel(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        address: address ?? this.address,
        skills: skills ?? this.skills,
      );

  factory StaffModel.fromJson(Map<String, dynamic> json) => StaffModel(
    fullName: json["fullName"],
    email: json["email"],
    address: json["address"],
    skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
    "address": address,
    "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
  };
}
