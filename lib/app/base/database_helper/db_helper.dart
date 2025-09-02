// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:test_project/domain/entity/cart/cart_entity.dart';
// import 'package:test_project/domain/entity/product_list/product_list_entity.dart';
//
// class DatabaseHelper {
//   DatabaseHelper._privateConstructor();
//
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'app_database.db');
//     return openDatabase(path,
//         version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
//   }
//
//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         full_name TEXT,
//         email TEXT UNIQUE,
//         password TEXT,
//         address TEXT,
//         latitude REAL,
//         longitude REAL
//       )
//     ''');
//     await db.execute('''
//       CREATE TABLE products (
//         prod_id TEXT PRIMARY KEY,
//         prod_code TEXT,
//         bar_code TEXT,
//         prod_name TEXT,
//         prod_short_name TEXT,
//         uom TEXT,
//         unit_id TEXT,
//         prod_combo TEXT,
//         is_focused TEXT,
//         group_ids TEXT,
//         category_ids TEXT,
//         unit_from_value TEXT,
//         unit_to_value TEXT,
//         uom_alternate_name TEXT,
//         uom_alternate_id TEXT,
//         alt_uom_from_decimal TEXT,
//         alt_uom_to_decimal TEXT,
//         under_warranty TEXT,
//         prod_hsn_id TEXT,
//         prod_hsn_code TEXT,
//         prod_price TEXT,
//         prod_mrp TEXT,
//         prod_buy TEXT,
//         prod_sell TEXT,
//         prod_free_item TEXT,
//         prod_rk_price TEXT,
//         prod_image_small TEXT,
//         prod_image_extra_small TEXT,
//         prod_image_medium TEXT,
//         prod_image_large TEXT,
//         prod_image_extra_large TEXT,
//         prod_image_custom TEXT
//       )
//     ''');
//     await db.execute('''
//       CREATE TABLE product_images (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         prod_id TEXT,
//         size TEXT,
//         url TEXT,
//         FOREIGN KEY (prod_id) REFERENCES products (prod_id)
//       )
//     ''');
//     await db.execute('''
//       CREATE TABLE taxes (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         prod_id TEXT,
//         direction TEXT,
//         scope TEXT,
//         tax_val_date TEXT,
//         tax_val_country TEXT,
//         tax_val_from_rate TEXT,
//         tax_val_to_rate TEXT,
//         tax_val_state TEXT,
//         tax_val_behav TEXT,
//         tax_val_taxPercentage REAL,
//         tax_val_exemption TEXT,
//         tax_val_OwnId TEXT,
//         tax_name TEXT,
//         tax_percent REAL,
//         gst_type TEXT,
//         tax_id TEXT,
//         tax_parent TEXT,
//         tax_apply_on TEXT,
//         FOREIGN KEY (prod_id) REFERENCES products (prod_id)
//       )
//     ''');
//     await db.execute('''
//       CREATE TABLE orders (
//         order_id INTEGER PRIMARY KEY AUTOINCREMENT,
//         user_id INTEGER,
//         product_name TEXT,
//         amount REAL,
//         order_date TEXT,
//         status TEXT,
//         is_synced INTEGER DEFAULT 0,
//         FOREIGN KEY (user_id) REFERENCES users (id)
//       )
//     ''');
//     await db.execute('''
//       CREATE TABLE order_items (
//         order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
//         order_id INTEGER,
//         product_id TEXT,
//         product_name TEXT,
//         quantity INTEGER,
//         price REAL,
//         total_price REAL,
//         tax_percent REAL,
//         total_tax REAL,
//         FOREIGN KEY (order_id) REFERENCES orders (order_id),
//         FOREIGN KEY (product_id) REFERENCES products (prod_id)
//       )
//     ''');
//     await db.execute('''
//       CREATE TABLE cart (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         cart_id INTEGER,
//         user_id INTEGER,
//         prod_id TEXT,
//         prod_name TEXT,
//         quantity INTEGER,
//         prod_price REAL,
//         total_price REAL,
//         tax_percent REAL,
//         total_tax REAL,
//         FOREIGN KEY (user_id) REFERENCES users (id),
//         FOREIGN KEY (prod_id) REFERENCES products (prod_id)
//       )
//     ''');
//   }
//
//   Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
//     if (oldVersion < 2) {
//       await db.execute('ALTER TABLE order_items RENAME TO order_items_old;');
//       await db.execute('''
//         CREATE TABLE order_items (
//           order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
//           order_id INTEGER,
//           product_id TEXT,
//           product_name TEXT,
//           quantity INTEGER,
//           price REAL,
//           total_price REAL,
//           tax_percent REAL,
//           total_tax REAL,
//           FOREIGN KEY (order_id) REFERENCES orders (order_id),
//           FOREIGN KEY (product_id) REFERENCES products (prod_id)
//         )
//       ''');
//       await db.execute('''
//         INSERT INTO order_items (order_item_id, order_id, product_id, product_name, quantity, price, total_price, tax_percent, total_tax)
//         SELECT order_item_id, order_id, CAST(product_id AS TEXT), product_name, quantity, price, total_price, tax_percent, total_tax
//         FROM order_items_old;
//       ''');
//       await db.execute('DROP TABLE order_items_old;');
//     }
//
//     if (oldVersion < 3) {
//
//     }
//   }
//
//   Future<int> insertUser(Map<String, dynamic> user) async {
//     final db = await database;
//     return db.insert("users", user);
//   }
//
//   Future<Map<String, dynamic>?> getUserByEmailAndPassword(
//       String email, String password) async {
//     final db = await database;
//     final result = await db.query('users',
//         where: 'email = ? AND password = ?', whereArgs: [email, password]);
//     return result.isNotEmpty ? result.first : null;
//   }
//
//   Future<List<ProductEntity>> getAllProducts() async {
//     final db = await database;
//     final result = await db.query("products");
//     return result.map((map) => map.toProductEntity()).toList();
//   }
//
//   Future<ProductEntity?> getProductById(int id) async {
//     final db = await database;
//     final result =
//         await db.query("products", where: "prod_id = ?", whereArgs: [id]);
//     return result.isNotEmpty ? result.first.toProductEntity() : null;
//   }
//
//   Future<int> insertProduct(Map<String, dynamic> productMap) async {
//     final db = await database;
//     return db.insert("products", productMap);
//   }
//
//   Future<int> getOrCreateCartId(int userId) async {
//     final db = await database;
//     final existingCart = await db.rawQuery(
//         "SELECT DISTINCT cart_id FROM cart WHERE user_id = ? AND cart_id IS NOT NULL LIMIT 1",
//         [userId]);
//     if (existingCart.isNotEmpty && existingCart.first['cart_id'] != null) {
//       return existingCart.first['cart_id'] as int;
//     }
//     final newCartId = DateTime.now().millisecondsSinceEpoch;
//     return newCartId;
//   }
//
//   Future<int?> addToCart(Map<String, dynamic> cartItem) async {
//     final db = await database;
//     final userId = cartItem["user_id"] as int;
//     final prodId = cartItem["prod_id"] as String;
//     final quantity = cartItem["quantity"] as int;
//     final prodPrice = double.parse(cartItem["prod_price"].toString());
//     final totalPrice = double.parse(cartItem["total_price"].toString());
//     final taxPercent = double.parse(cartItem["tax_percent"].toString());
//     final totalTax = double.parse(cartItem["total_tax"].toString());
//     final prodName = cartItem["prod_name"] as String;
//     final cartId = await getOrCreateCartId(userId);
//     final existingProduct = await db.query("cart",
//         where: "cart_id = ? AND prod_id = ?", whereArgs: [cartId, prodId]);
//     if (existingProduct.isNotEmpty) {
//       final currentQuantity = existingProduct.first["quantity"] as int;
//       final newQuantity = currentQuantity + quantity;
//       return db.update("cart", {"quantity": newQuantity},
//           where: "cart_id = ? AND prod_id = ?", whereArgs: [cartId, prodId]);
//     }
//     return db.insert("cart", {
//       "cart_id": cartId,
//       "user_id": userId,
//       "prod_id": prodId,
//       "prod_name": prodName,
//       "quantity": quantity,
//       "prod_price": prodPrice,
//       "total_price": totalPrice,
//       "tax_percent": taxPercent,
//       "total_tax": totalTax
//     });
//   }
//
//   Future<void> increaseQuantityOfCartItem({CartItemEntity? cartItem}) async {
//     final db = await database;
//     await db.update(
//       'cart',
//       {
//         'quantity': (cartItem?.quantity ?? 0) + 1,
//         'total_price':
//             ((cartItem?.prodPrice ?? 0) * ((cartItem?.quantity ?? 0) + 1)),
//         'total_tax':
//             (((cartItem?.prodPrice ?? 0) * ((cartItem?.quantity ?? 0) + 1)) *
//                 ((cartItem?.taxPercent ?? 0) / 100)),
//       },
//       where: 'id = ?',
//       whereArgs: [cartItem?.id],
//     );
//   }
//
//   Future<void> decreaseQuantityOfCartItem({CartItemEntity? cartItem}) async {
//     final db = await database;
//     final newQuantity = (cartItem?.quantity ?? 0) - 1;
//     if (newQuantity <= 0) {
//       await db.delete('cart', where: 'id = ?', whereArgs: [cartItem?.id]);
//     } else {
//       await db.update(
//         'cart',
//         {
//           'quantity': newQuantity,
//           'total_price': (cartItem?.prodPrice ?? 0) * newQuantity,
//           'total_tax': ((cartItem?.prodPrice ?? 0) * newQuantity) *
//               ((cartItem?.taxPercent ?? 0) / 100),
//         },
//         where: 'id = ?',
//         whereArgs: [cartItem?.id],
//       );
//     }
//   }
//
//   Future<Map<String, dynamic>> getCart({int? userId}) async {
//     final db = await database;
//     final cartIdResult = await db.rawQuery(
//         "SELECT DISTINCT cart_id FROM cart WHERE user_id = ? AND cart_id IS NOT NULL LIMIT 1",
//         [userId]);
//     if (cartIdResult.isEmpty) {
//       return {"cart_items": []};
//     }
//     final cartId = cartIdResult.first['cart_id'] as int;
//     final cartItems =
//         await db.query("cart", where: "cart_id = ?", whereArgs: [cartId]);
//     return {"cart_items": cartItems};
//   }
//
//   Future<int> getCartItemCount(int userId) async {
//     final db = await database;
//     final result = await db.rawQuery(
//         "SELECT COUNT(*) as count FROM cart WHERE user_id = ?", [userId]);
//     return result.first['count'] as int;
//   }
//
//   Future<void> clearCart(int userId) async {
//     final db = await database;
//     await db.delete("cart", where: "user_id = ?", whereArgs: [userId]);
//   }
//
//   Future<int> placeOrder({int? userId}) async {
//     final db = await database;
//     final cartIdResult = await db.rawQuery(
//       'SELECT DISTINCT cart_id FROM cart WHERE user_id = ? AND cart_id IS NOT NULL LIMIT 1',
//       [userId],
//     );
//     if (cartIdResult.isEmpty) {
//       throw Exception("No items in cart to place order");
//     }
//     final cartId = cartIdResult.first['cart_id'] as int;
//     final cartItems = await db.rawQuery(
//       'SELECT prod_id, prod_name, quantity, prod_price, total_price, tax_percent, total_tax FROM cart WHERE cart_id = ?',
//       [cartId],
//     );
//     if (cartItems.isEmpty) {
//       throw Exception("No items in cart to place order");
//     }
//     double totalAmount = 0;
//     final productNames = cartItems
//         .map((item) => item['prod_name'] as String)
//         .toList()
//         .join(', ');
//     for (var item in cartItems) {
//       totalAmount += (item['total_price'] as num?)?.toDouble() ?? 0;
//     }
//     final orderId = await db.rawInsert(
//       '''
//       INSERT INTO orders (user_id, product_name, amount, order_date, status, is_synced)
//       VALUES (?, ?, ?, ?, ?, ?)
//       ''',
//       [
//         userId,
//         productNames,
//         totalAmount,
//         DateTime.now().toIso8601String(),
//         'pending',
//         0,
//       ],
//     );
//     for (var item in cartItems) {
//       await db.rawInsert(
//         '''
//         INSERT INTO order_items (order_id, product_id, product_name, quantity, price, total_price, tax_percent, total_tax)
//         VALUES (?, ?, ?, ?, ?, ?, ?, ?)
//         ''',
//         [
//           orderId,
//           item['prod_id'],
//           item['prod_name'],
//           item['quantity'],
//           item['prod_price'],
//           item['total_price'],
//           item['tax_percent'],
//           item['total_tax'],
//         ],
//       );
//     }
//     await db.rawDelete('DELETE FROM cart WHERE user_id = ?', [userId]);
//     return orderId;
//   }
//
//   Future<List<Map<String, dynamic>>> getOrdersWithItems({int? userId}) async {
//     final db = await database;
//     final result = await db.rawQuery(
//       '''
//       SELECT
//         o.order_id, o.user_id, o.product_name, o.amount, o.order_date,
//         o.status, o.is_synced,
//         oi.order_item_id, oi.product_id, oi.product_name AS item_product_name,
//         oi.quantity, oi.price, oi.total_price, oi.tax_percent, oi.total_tax
//       FROM orders o
//       LEFT JOIN order_items oi ON o.order_id = oi.order_id
//       WHERE o.user_id = ?
//       ORDER BY o.order_date DESC
//       ''',
//       [userId],
//     );
//     final Map<int, Map<String, dynamic>> ordersMap = {};
//     for (var row in result) {
//       final orderId = row['order_id'] as int;
//       if (!ordersMap.containsKey(orderId)) {
//         ordersMap[orderId] = {
//           'order_id': orderId,
//           'user_id': row['user_id'],
//           'product_name': row['product_name'],
//           'amount': row['amount'],
//           'order_date': row['order_date'],
//           'status': row['status'],
//           'is_synced': row['is_synced'],
//           'order_items': [],
//         };
//       }
//       if (row['order_item_id'] != null) {
//         ordersMap[orderId]!['order_items'].add({
//           'order_item_id': row['order_item_id'],
//           'order_id': row['order_id'],
//           'product_id': row['product_id'],
//           'product_name': row['item_product_name'],
//           'quantity': row['quantity'],
//           'price': row['price'],
//           'total_price': row['total_price'],
//           'tax_percent': row['tax_percent'],
//           'total_tax': row['total_tax'],
//         });
//       }
//     }
//     return ordersMap.values.toList();
//   }
// }
