import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'model/cart_model.dart';

class DBHelper {
  static Database? _database;

  Future<Database?> get database async {
    _database ??= await initDatabase();
    return _database!;

//    _database = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY, productId VARCHAR UNIQUE, productName TEXT , initialPrice FLOAT, productPrice FLOAT,quantity INTEGER,image TEXT)');
  }

  Future<CartModel> insert(CartModel cartModel) async {
    var dbClient = await database;
    await dbClient?.insert('cart', cartModel.toMap());
    return cartModel;
  }

  Future<List<CartModel>> getCartList() async {
    var dbClient = await database;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('cart');
    return queryResult.map((e) => CartModel.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await database;
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuantity(CartModel cartModel) async {
    var dbClient = await database;
    return await dbClient!.update('cart',cartModel.toMap() , where: 'id = ? ', whereArgs: [cartModel.id]);
  }

}
