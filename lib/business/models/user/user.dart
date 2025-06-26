/*
class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? role;

  // Spécifique à l’organisateur
  String? nomOrganis;

  // Spécifique au public
  List<int>? interets;

  // Token d’authentification
  String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.nomOrganis,
    this.interets,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      nomOrganis: json['nom_organis'] as String?,
      interets: json['interets'] != null
          ? List<int>.from(json['interets'])
          : null,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
    };

    if (nomOrganis != null) data['nom_organis'] = nomOrganis;
    if (interets != null) data['interets'] = interets;

    return data;
  }

  bool get isOrganisateur => role == 'organisateur';
  bool get isPublic => role == 'public';
}
*/

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation; // ✅ Ajouté
  String? role;

  // Spécifique à l’organisateur
  String? nomOrganis;

  // Spécifique au public
  List<int>? interets;

  // Token d’authentification
  String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation, // ✅ Ajouté
    this.role,
    this.nomOrganis,
    this.interets,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> map = Map<String, dynamic>.from(json);
    return User(
      id: map['id'] as int?,
      name: map['name'] as String?,
      email: map['email'] as String?,
      role: map['role'] as String?,
      nomOrganis: map['nom_organis'] as String?,
      interets: map['interets'] != null
          ? List<int>.from(map['interets'])
          : null,
      token: map['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation, // ✅ Ajouté ici
      'role': role,
    };

    if (nomOrganis != null) data['nom_organis'] = nomOrganis;
    if (interets != null) data['interets'] = interets;

    return data;
  }

  bool get isOrganisateur => role == 'organisateur';
  bool get isPublic => role == 'public';
}
