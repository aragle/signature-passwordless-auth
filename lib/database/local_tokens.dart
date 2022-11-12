import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:signature/models/token.dart';
import 'package:sqflite/sqflite.dart';

class TokenDatabase {
  static final TokenDatabase instance = TokenDatabase._instance();
  static Database? _db;
  Future<Database?> get db async {
    _db ??= await _initiateDatabase();
    return _db;
  }

  TokenDatabase._instance();

  String tokenTable = 'token_table';
  String colId = 'id';
  String colIssuerName = 'issuer_name';
  String colAccountName = 'account_name';
  String colSecretCode = 'secret_code';
  String colType = 'type';
  String colOtpLength = 'otp_length';
  String colStatus = 'status';

  // id | issuer_name | account_name | secret_code | type | otp_length | status
  // 1  | Google      | Google       | 123456789   | TOTP | 6          | 1
  // 2  | Facebook    | Facebook     | 123456789   | TOTP | 6          | 1
  // 3  | Twitter     | Twitter      | 123456789   | TOTP | 6          | 1
  // 4  | Github      | Github       | 123456789   | TOTP | 6          | 1
  // 5  | Instagram   | Instagram    | 123456789   | TOTP | 6          | 1

  Future<Database> _initiateDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}/local_tokens.db';
    final tokenListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return tokenListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $tokenTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colIssuerName TEXT, $colAccountName TEXT, $colSecretCode TEXT, $colType TEXT, $colOtpLength TEXT, $colStatus INTEGER)',
    );
  }

  Future<List<Map<String, dynamic>>> getTokenMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(tokenTable);
    return result;
  }

  Future<List<Token>> getTokenList() async {
    final List<Map<String, dynamic>> tokenMapList = await getTokenMapList();
    final List<Token> tokenList = [];
    for (var tokenMap in tokenMapList) {
      tokenList.add(Token.fromMap(tokenMap));
    }
    tokenList.sort(
        (tokenA, tokenB) => tokenA.issuerName.compareTo(tokenB.issuerName));
    return tokenList;
  }

  Future<int> insertToken(Token token) async {
    Database? db = await this.db;
    final int result = await db!.insert(tokenTable, token.toMap());
    return result;
  }

  Future<int> updateToken(Token token) async {
    Database? db = await this.db;
    final int result = await db!.update(
      tokenTable,
      token.toMap(),
      where: '$colId = ?',
      whereArgs: [token.id],
    );
    return result;
  }

  Future<int> deleteToken(int id) async {
    Database? db = await this.db;
    final int result = await db!.delete(
      tokenTable,
      where: '$colId = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<int> deleteAllTask() async {
    Database? db = await this.db;
    final int result = await db!.delete(tokenTable);
    return result;
  }
}
