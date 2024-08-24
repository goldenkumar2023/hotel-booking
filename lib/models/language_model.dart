class Language {
  final String code;
  final String name;
  final String flag;

  Language(this.code, this.name, this.flag);

  // Factory constructor to create a Language object from a JSON map
  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      json['code'] as String,
      json['name'] as String,
      json['flag'] as String,
    );
  }

  // Method to convert a Language object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'flag': flag,
    };
  }
}
