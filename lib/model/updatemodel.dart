class Updatemodel {
  Updatemodel({
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  String name;
  String email;
  String gender;
  String status;

  factory Updatemodel.fromJson(Map<String,dynamic> json) =>
      Updatemodel(
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      };
}