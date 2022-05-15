// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EmployeeData {
  final String? id;
  final String? name;
  final String? image;
  final String? email;
  final String? contactNumber;
  final String? birthday;
  final String? country;

  EmployeeData({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.contactNumber,
    required this.birthday,
    required this.country,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) {
    return EmployeeData(
      id: json['id'],
      name: json['name'],
      image: json['avatar'],
      email: json['email'],
      contactNumber: json['phone'],
      birthday: json['birthday'],
      country: json['country'],
    );
  }

  factory EmployeeData.fromMap(Map<String, dynamic> map) {
    return EmployeeData(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      contactNumber:
          map['contactNumber'] != null ? map['contactNumber'] as String : null,
      birthday: map['birthday'] != null ? map['birthday'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
    );
  }

  EmployeeData copyWith({
    String? id,
    String? name,
    String? image,
    String? email,
    String? contactNumber,
    String? birthday,
    String? country,
  }) {
    return EmployeeData(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      birthday: birthday ?? this.birthday,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'email': email,
      'contactNumber': contactNumber,
      'birthday': birthday,
      'country': country,
    };
  }

  String toJson() => json.encode(toMap());

  // factory EmployeeData.fromJson(String source) =>
  //     EmployeeData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeData(id: $id, name: $name, image: $image, email: $email, contactNumber: $contactNumber, birthday: $birthday, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmployeeData &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.email == email &&
        other.contactNumber == contactNumber &&
        other.birthday == birthday &&
        other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        email.hashCode ^
        contactNumber.hashCode ^
        birthday.hashCode ^
        country.hashCode;
  }
}
