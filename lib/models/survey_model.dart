import 'dart:convert';

class Survey {


String full_name;
String details;


 String get fullname => full_name;

 set fullname(String value) => full_name = value;

 String get getDetails => details;

 set setDetails(String details) => this.details = details;



  Survey({
    this.full_name,
    this.details,
  });


  Survey copyWith({
    String full_name,
    String details,
  }) {
    return Survey(
      full_name: full_name ?? this.full_name,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'full_name': full_name,
      'details': details,
    };
  }

  static Survey fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Survey(
      full_name: map['full_name'],
      details: map['details'],
    );
  }

  String toJson() => json.encode(toMap());

  static Survey fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Survey(full_name: $full_name, details: $details)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Survey &&
      o.full_name == full_name &&
      o.details == details;
  }

  @override
  int get hashCode => full_name.hashCode ^ details.hashCode;
 }
