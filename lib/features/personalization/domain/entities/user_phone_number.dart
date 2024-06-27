class UserPhoneNumber {
  String code; //+20
  String isoCode; //en
  String number;
  UserPhoneNumber({
    required this.code,
    required this.isoCode,
    required this.number,
  });

  String get completeNumber => '$code$number';

  factory UserPhoneNumber.fromJson(Map<String, dynamic>? json) =>
      UserPhoneNumber(
        code: json != null ? json['code'] : '',
        isoCode: json != null ? json['isoCode'] : '',
        number: json != null ? json['number'] : '',
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'isoCode': isoCode,
        'number': number,
      };
}
