class Token {
  late int id;
  String issuerName;
  String accountName;
  String secretCode;
  String type;
  int otpLength;
  int status;

  Token(
      {required this.issuerName,
      required this.accountName,
      required this.secretCode,
      required this.type,
      required this.otpLength,
      required this.status});

  Token.withId(
      {required this.id,
      required this.issuerName,
      required this.accountName,
      required this.secretCode,
      required this.type,
      required this.otpLength,
      required this.status});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['issuer_name'] = issuerName;
    map['account_name'] = accountName;
    map['secret_code'] = secretCode;
    map['type'] = type;
    map['otp_length'] = otpLength;
    map['status'] = status;

    return map;
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token.withId(
        id: map['id'],
        issuerName: map['issuer_name'],
        accountName: map['account_name'],
        secretCode: map['secret_code'],
        type: map['type'],
        otpLength: map['otp_length'],
        status: map['status']);
  }
}
