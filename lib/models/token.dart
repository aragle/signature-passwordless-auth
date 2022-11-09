// class Token {
//   int id;
//   String title;
//   String Company_name;
//   String account_name;
//   String secret_code;
//   String otp;
//   String otp_length;
//   int status; // 0 - Incomplete, 1 - Complete

//   Token(
//       {this.title,
//       this.Company_name,
//       this.account_name,
//       this.secret_code,
//       this.otp,
//       this.otp_length,
//       this.status});

//   Token.withId(
//       {this.id,
//       this.title,
//       this.Company_name,
//       this.account_name,
//       this.secret_code,
//       this.otp,
//       this.otp_length,
//       this.status});

//   Map<String, dynamic> toMap() {
//     final map = Map<String, dynamic>();
//     if (id != null) {
//       map['id'] = id;
//     }
//     map['title'] = title;
//     map['Company_name'] = Company_name;
//     map['account_name'] = account_name;
//     map['secret_code'] = secret_code;
//     map['otp'] = otp;
//     map['otp_length'] = otp_length;
//     map['status'] = status;
//     return map;
//   }

//   factory Token.fromMap(Map<String, dynamic> map) {
//     return Token.withId(
//       id: map['id'],
//       title: map['title'],
//       Company_name: map['Company_name'],
//       account_name: map['account_name'],
//       secret_code: map['secret_code'],
//       otp: map['otp'],
//       otp_length: map['otp_length'],
//       status: map['status'],
//     );
//   }
// }
