import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

dynamic database;
late final String? globalEmailId;
//List<Map<String, dynamic>> list = [];
List listOfCards = [];

class CardInfo {
  int cardId;
  String cardUserId;
  String emailId;
  String cardTitle;
  String cardPassword;
  String? cardWebsite;
  String? cardDescription;

  CardInfo({
    this.cardId = 0,
    required this.cardUserId,
    required this.emailId,
    required this.cardTitle,
    required this.cardPassword,
    this.cardWebsite,
    this.cardDescription,
  });

  Map<String, dynamic> cardDataIntoMap() {
    return {
      'cardUserId': cardUserId,
      'emailId': emailId,
      'cardTitle': cardTitle,
      'cardPassword': cardPassword,
      'cardWebsite': cardWebsite,
      'cardDescription': cardDescription,
    };
  }
}

class LoginInfo {
  String emailId;
  String userName;
  String userPassword;

  LoginInfo({
    required this.emailId,
    required this.userName,
    required this.userPassword,
  });

  Map<String, dynamic> loginDataIntoMap() {
    return {
      'emailId': emailId,
      'userName': userName,
      'userPassword': userPassword,
    };
  }
}

//Created 2 Tables for in Same Database
Future createDatabase() async {
  print("CREATE DATABASE , ${listOfCards}");
  database = await openDatabase(
      join(await getDatabasesPath(), 'PasswordDriver.db'),
      version: 1, onCreate: (db, version) async {
    await db.execute('''CREATE TABLE LoginInfo(
    emailId TEXT PRIMARY KEY,
    userName TEXT,
    userPassword TEXT
    )''');

    print("LoginDatabase Successfully Created");

    await db.execute('''CREATE TABLE CardInfo(
    cardId INTEGER PRIMARY KEY,
    cardUserId TEXT,
    emailId TEXT,
    cardTitle TEXT,
    cardPassword TEXT,
    cardWebsite TEXT,
    cardDescription TEXT,
    FOREIGN KEY (emailId) REFERENCES LoginInfo(emailId))''');
  });
  //await getCardDetailsList();
  print("AFTER CREATING DATABASE , ${listOfCards}");
}

// //INSERT INTO USER LOGIN TABLE
Future<void> insertLoginData(LoginInfo user) async {
  final localDB = await database;
  await localDB.insert(
    'LoginInfo',
    user.loginDataIntoMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  print("Login DATA SUCCESFULLY INSERTED IN DATABASE ");
}

// //CHECK THE EMAIL ID IS PRESENT IN USE DATABASE>>>
// //IF EMAIL ID IS PRESENT THEN CHECK THE PASSWORD FOR THAT EMAIL ID AND PASSWORD ENTERED BY USE IS MATCH OR NOT
Future<bool> loginAuthentication(String email, String password) async {
  final db = await database;
  final List<Map<String, dynamic>> result = await db.query(
    'LoginInfo',
    where: 'emailId = ?',
    whereArgs: [email],
  );

  if (result.isEmpty) {
    // No user found with the provided email
    return false;
  }

  // User found, check if the password matches
  final user = result.first;
  if (user['userPassword'] == password) {
    globalEmailId = email;
    print("GLOBAL EMAIL - $globalEmailId");
    return true;
  } else {
    return false;
  }
}

//INSERT INTO CARD TABLE
Future<void> insertCardData(CardInfo card) async {
  final localDB = await database;
  print("INSERT DATA - , ${listOfCards}");

  await localDB.insert(
    "CardInfo",
    card.cardDataIntoMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  print("IN INSERT DATA : ${database.query('CardInfo')}");
  await getCardDetailsList();
}

//Get The List Of Cards
Future getCardDetailsList() async {
  final localDB = await database;

  print("CREATE LIST, $localDB , ${await localDB.query(
    'CardInfo',
    where: 'emailId = ?',
    whereArgs: [globalEmailId],
  )}");
  List<Map<String, dynamic>> list = await localDB.query(
    "CardInfo",
    where: 'emailId = ?',
    whereArgs: [globalEmailId],
  );

  listOfCards = List.generate(list.length, (index) {
    return CardInfo(
      cardId: list[index]['cardId'],
      cardUserId: list[index]['cardUserId'],
      emailId: list[index]['emailId'],
      cardTitle: list[index]['cardTitle'],
      cardPassword: list[index]['cardPassword'],
      cardWebsite: list[index]['cardWebsite'],
      cardDescription: list[index]['cardDescription'],
    );
  });
}

// //DELETE THE CARD FROM DATABASE
Future<void> deleteCardFromDatabase(CardInfo card) async {
  final localDB = await database;
  print("DELETE DATABASE , ${listOfCards}");

  await localDB.delete(
    'CardInfo',
    where: 'cardId = ?',
    whereArgs: [card.cardId],
  );
  await getCardDetailsList();
}

//UPDATE THE CARD FROM DATABASE
Future updateCardInDatabase(CardInfo card) async {
  final localDB = await database;
  print("UPDATE DATABASE , ${listOfCards}");
  print("CARD ID IN UPDATE FUNCTION ${card.cardId}");

  // if (listOfCards.isEmpty || card.cardId < 0 || card.cardId >= listOfCards.length) {
  //   print("Error: Invalid cardId or empty list");
  //   return; // Exit function or handle error as needed
  // }

  await localDB.update('CardInfo', card.cardDataIntoMap(),
      where: 'cardId = ?', whereArgs: [card.cardId]);
  await getCardDetailsList();
  print("UPDATE DATABASE , $listOfCards");
}
