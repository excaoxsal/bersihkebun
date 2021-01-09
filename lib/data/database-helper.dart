import 'dart:io';
import 'package:bersihkebun/models/order.dart';
import 'package:bersihkebun/models/user.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  //table user
  final String tableUser = "User";
  final String columnName = "name";
  final String columnUserName = "username";
  final String columnPassword = "password";

  //table order
  final String tableOrder = "Order";
  final String columnOrdername = "ordername";
  final String columnUser = "user";
  final String columnAlamat = "alamat";
  final String columnPrice = "price";
  final String columnLuasLahan = "luaslahan";
  final String columnJenisLayanan = "jenislayanan";



  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, name TEXT, username TEXT, password TEXT, flaglogged TEXT)"
        "CREATE TABLE Order(id INTEGER PRIMARY KEY, ordername TEXT, user TEXT, alamat TEXT, price INTEGER, luaslahan TEXT, jenislayanan TEXT ,flaglogged TEXT"
    );
    print("Table is created");
  }
  void _onCreateOrder(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Order(id INTEGER PRIMARY KEY, ordername TEXT, user TEXT, alamat TEXT, price INTEGER, luaslahan TEXT, jenislayanan TEXT ,flaglogged TEXT)");
    print("Table is created");
  }

  //insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    print(user.name);
    int res = await dbClient.insert("User", user.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    print(list);
    return res;
  }
  Future<int> saveOrder(Order order) async {
    var dbClient = await db;
    print(order.ordername);
    int res = await dbClient.insert("Order", order.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Order');
    print(list);
    return res;
  }

  //deletion
  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }
  Future<int> deleteOrder(Order order) async {
    var dbClient = await db;
    int res = await dbClient.delete("Order");
    return res;
  }

  //selection
  Future<User> selectUser(User user) async{
    print("Select User");
    print(user.username);
    print(user.password);
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableUser,
        columns: [columnUserName, columnPassword],
        where: "$columnUserName = ? and $columnPassword = ?",
        whereArgs: [user.username,user.password]);
    print(maps);
    if (maps.length > 0) {
      print("User Exist !!!");
      return user;
    }else {
      return null;
    }
  }
  Future<Order> selectOrder(Order order) async{
    print("Select Order");
    print(order.ordername);
    print(order.jenislayanan);
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableOrder,
        columns: [columnOrdername, columnJenisLayanan],
        where: "$columnUser = ?",
        whereArgs: [order.user]);
    print(maps);
    if (maps.length > 0) {
      print("Order Exist !!!");
      return order;
    }else {
      return null;
    }
  }
}
