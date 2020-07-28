import 'dart:convert';

class RegUser {
   String first_name;
   String last_name;
   String email;
 String password;
   String gender;
   String phone_number;
   String image;
   String res_state;
   String res_home_address;
 String get firstname => first_name;

 set firstname(String value) => first_name = value;

 String get lastname => last_name;

 set lastname(String value) => last_name = value;

 String get getEmail => email;

 set setEmail(String email) => this.email = email;

 String get getPassword => password;

 set setPassword(String password) => this.password = password;

 String get getGender => gender;

 set setGender(String gender) => this.gender = gender;


 String get phonenumber => phone_number;

 set phonenumber(String value) => phone_number = value;

 String get getImage => image;

 set setImage(String image) => this.image = image;

 String get resstate => res_state;

 set resstate(String value) => res_state = value;

 String get reshome_address => res_home_address;

 set reshome_address(String value) => res_home_address = value;

 
  RegUser({
    this.first_name,
    this.last_name,
    this.email,
    this.password,
    this.gender,
    this.phone_number,
    this.image,
    this.res_state,
    this.res_home_address,
  });

  RegUser copyWith({
    String first_name,
    String last_name,
    String email,
    String password,
    String gender,
    String phone_number,
    String image,
    String res_state,
    String res_home_address,
  }) {
    return RegUser(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      phone_number: phone_number ?? this.phone_number,
      image: image ?? this.image,
      res_state: res_state ?? this.res_state,
      res_home_address: res_home_address ?? this.res_home_address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'gender': gender,
      'phone_number': phone_number,
      'image': image,
      'res_state': res_state,
      'res_home_address': res_home_address,
    };
  }

  static RegUser fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return RegUser(
      first_name: map['first_name'],
      last_name: map['last_name'],
      email: map['email'],
      password: map['password'],
      gender: map['gender'],
      phone_number: map['phone_number'],
      image: map['image'],
      res_state: map['res_state'],
      res_home_address: map['res_home_address'],
    );
  }

  String toJson() => json.encode(toMap());

  static RegUser fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(first_name: $first_name, last_name: $last_name, email: $email, password: $password, gender: $gender, phone_number: $phone_number, image: $image, res_state: $res_state, res_home_address: $res_home_address)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is RegUser &&
      o.first_name == first_name &&
      o.last_name == last_name &&
      o.email == email &&
      o.password == password &&
      o.gender == gender &&
      o.phone_number == phone_number &&
      o.image == image &&
      o.res_state == res_state &&
      o.res_home_address == res_home_address;
  }

  @override
  int get hashCode {
    return first_name.hashCode ^
      last_name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      gender.hashCode ^
      phone_number.hashCode ^
      image.hashCode ^
      res_state.hashCode ^
      res_home_address.hashCode;
  }
}