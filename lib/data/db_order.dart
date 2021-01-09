import 'dart:io';
import 'package:bersihkebun/models/order.dart';
import 'package:bersihkebun/models/user.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_Order {
  static final DB_Order _instance = new DB_Order.internal();
  factory DB_Order() => _instance;

  static Database _dbOrder;

  //table user


  //table order
  final String tableOrder = "Order";
  final String columnOrdername = "ordername";
  final String columnUser = "user";
  final String columnAlamat = "alamat";
  final String columnPrice = "price";
  final String columnLuasLahan = "luaslahan";
  final String columnJenisLayanan = "jenislayanan";



  Future<Database> get db async {
    if (_dbOrder != null) {
      return _dbOrder;
    }
    _dbOrder = await initDbOrder();
    return _dbOrder;
  }

  DB_Order.internal();

  initDbOrder() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "db_orderBersihkebun.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db_order, int version) async {
    await db_order.execute(
        "CREATE TABLE Order (id INTEGER PRIMARY KEY, ordername TEXT, user TEXT, alamat TEXT, price INTEGER, luaslahan TEXT, jenislayanan TEXT)"
    );
    print("Table is created");
  }


  //insertion

  Future<int> saveOrder(Order order) async {
    var dbClient = await db;
    print(order.ordername);
    int res = await dbClient.insert("null", order.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Order');
    print(list);
    return res;
  }

  //deletion

  Future<int> deleteOrder(Order order) async {
    var dbClient = await db;
    int res = await dbClient.delete("Order");
    return res;
  }

  //selection

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
