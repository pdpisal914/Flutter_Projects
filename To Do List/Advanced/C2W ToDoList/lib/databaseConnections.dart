import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

dynamic database;
late final String globalEmailId;
//List<Map<String, dynamic>> list = [];
List listOfCards = [];

class CardInfo {
  int cardId;
  String emailId;
  String cardTitle;
  String cardDescription;
  String cardDate;

  int isTaskCompleted = 1;

  CardInfo(
      {this.cardId = 0,
      required this.cardTitle,
      required this.emailId,
      required this.cardDescription,
      required this.cardDate,
      this.isTaskCompleted = 1});

  Map<String, dynamic> cardDataIntoMap() {
    return {
      'cardTitle': cardTitle,
      'emailId':emailId,
      'cardDescription': cardDescription,
      'cardDate': cardDate,
      'isTaskCompleted': isTaskCompleted,
    };
  }
}

class UserInfo {
  String emailId;
  String userName;
  String userPassword;

  UserInfo({
    required this.emailId,
    required this.userName,
    required this.userPassword,
  });

  Map<String, dynamic> userdataIntoMap() {
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
  database = await openDatabase(join(await getDatabasesPath(), 'ToDoListDB.db'),
      version: 1, onCreate: (db, version) async {
    await db.execute('''CREATE TABLE UserDetailsTable(
    emailId TEXT PRIMARY KEY,
    userName TEXT,
    userPassword TEXT
    )''');

    print("UserData Successfully Created");

    await db.execute('''CREATE TABLE ToDoListTable(
    cardId INTEGER PRIMARY KEY,
    emailId Text,
    cardTitle TEXT,
    cardDescription TEXT,
    cardDate TEXT,
    isTaskCompleted INT,
    FOREIGN KEY (emailId) REFERENCES UserDetailsTable(emailId))''');
  });
  //await getCardDetailsList();
  print("AFTER CREATING DATABASE , ${listOfCards}");
}

//INSERT INTO USER LOGIN TABLE
Future<void> insertUserData(UserInfo user) async {
  final localDB = await database;
  await localDB.insert(
    'UserDetailsTable',
    user.userdataIntoMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  print("USER DATA SUCCESFULLY INSERTED IN DATABASE ");
}

//CHECK THE EMAIL ID IS PRESENT IN USE DATABASE>>>
//IF EMAIL ID IS PRESENT THEN CHECK THE PASSWORD FOR THAT EMAIL ID AND PASSWORD ENTERED BY USE IS MATCH OR NOT
Future<bool> loginAuthentication(String email, String password) async {
  final db = await database;
  final List<Map<String, dynamic>> result = await db.query(
    'UserDetailsTable',
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
    print("GLOBAL EMAIL $globalEmailId");
    return true;
  } else {
    return false;
  }
}

//INSERT INTO CARD TABLE
Future<void> insertCardData(CardInfo card) async {
  final localDB = await database;
  print("INSERT DATA , ${listOfCards}");

  await localDB.insert(
    "ToDoListTable",
    card.cardDataIntoMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  print("IN INSERT DATA : ${database.query('ToDoListTable')}");
  await getCardDetailsList();
}

//Get The List Of Cards
Future getCardDetailsList() async {
  final localDB = await database;

  print("CREATE LIST, $localDB , ${await localDB.query(
    'ToDoListTable',
    where: 'emailId = ?',
    whereArgs: [globalEmailId],
  )}");
  List<Map<String, dynamic>> list = await localDB.query(
    "ToDoListTable",
    where: 'emailId = ?',
    whereArgs: [globalEmailId],
  );

  listOfCards = List.generate(list.length, (index) {
    return CardInfo(
      cardId: list[index]['cardId'],
      emailId: list[index]['emailId'],
      cardTitle: list[index]['cardTitle'],
      cardDescription: list[index]['cardDescription'],
      cardDate: list[index]['cardDate'],
      isTaskCompleted: list[index]['isTaskCompleted'],
    );
  });
}

//DELETE THE CARD FROM DATABASE
Future<void> deleteCardFromDatabase(CardInfo card) async {
  final localDB = await database;
  print("DELETE DATABASE , ${listOfCards}");

  await localDB.delete(
    'ToDoListTable',
    where: 'cardId = ?',
    whereArgs: [card.cardId],
  );
  await getCardDetailsList();
}

//UPDATE THE CARD FROM DATABASE
Future updateCardInDatabase(CardInfo card) async {
  final localDB = await database;
  print("UPDATE DATABASE , ${listOfCards}");

  await localDB.update('ToDoListTable', card.cardDataIntoMap(),
      where: 'cardId = ?', whereArgs: [card.cardId]);
  await getCardDetailsList();
}
