import 'dart:io';
import 'package:bersihkebun/models/order.dart';

import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  //table order
  final String tableOrder = "Pesanan";
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
    String path = join(documentDirectory.path, "dborder.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Pesanan( idorder INTEGER PRIMARY KEY AUTOINCREMENT, ordername TEXT, user TEXT, alamat TEXT, price INTEGER, luaslahan TEXT, jenislayanan TEXT)"
    );
    print("Table is created");
  }

  //insertion

  Future<int> saveOrder(Order order) async {
    var dbClient = await db;
    print(order.ordername);
    int res = await dbClient.insert("Pesanan", order.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Pesanan');
    print(list);
    return res;
  }

  //deletion

  Future<int> deleteOrder(Order order) async {
    var dbClient = await db;
    int res = await dbClient.delete("Pesanan");
    return res;
  }

  //selection

  Future<Order> selectOrder(Order order) async{
    print("Select Pesanan");
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
