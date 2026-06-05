class PatientauthModel {
  final String name;
  final String email;
  final String password;
  final String phone;

  PatientauthModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  /// Convert object → JSON (for API later)
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    };
  }

  /// Convert JSON → object (for future use)
  factory PatientauthModel.fromJson(Map<String, dynamic> json) {
    return PatientauthModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      phone: json["phone"] ?? "",
    );
  }
}