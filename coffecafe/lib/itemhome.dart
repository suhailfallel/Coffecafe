import 'package:coffecafe/model/itemmodel.dart';
import 'package:coffecafe/service/itemapi.dart';
import 'package:coffecafe/storage/cartstorage.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:coffecafe/storage/cartstorage.dart';

import 'main.dart';

class Itemhome extends StatefulWidget {
  final String api;
  const Itemhome({Key? key, required this.api}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Itemhome> {
  late List<Item>? ItemModel = [];
  late Database db;
  @override
  void initState() {
    super.initState();
    getData();
    initDatabase();
  }

  void initDatabase() async {
   db = await openDatabase(
    join(await getDatabasesPath(), 'my_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT, price INTEGER, quantity INTEGER)',
      );
    },
    version: 1,
  );
}

  void getData() async {
    ItemModel = (await ApiService().getUsers(widget.api))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoffeCafe'),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => Myapp()));
          }, 
          icon: const Icon(Icons.logout))
        ],
      ),
      body: ItemModel == null || ItemModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: ItemModel!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ShowDialog(context, ItemModel![index]);
                  },
                  child: Card(
                    child: Column(
                      children: [
                      Container(
                        height: 100,
                        width: 200,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Name : ${ItemModel![index].name.toString()} \n\nRate : ${ItemModel![index].rate.toString()} AED/-"),
                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  void ShowDialog(BuildContext context, Item item) {
    int quantity = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Enter quantity:'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  quantity = int.tryParse(value) ?? 0;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  item.quantity = quantity;
                  CartModel model = CartModel(
                    id: item.id, 
                    name: item.name,  
                    price: item.rate * quantity, 
                    quantity: quantity);
                  addToDatabase(model);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Checkout'),
            ),
          ],
        );
      },
    );
  }

  void addToDatabase(CartModel item) async {
    await db.insert(
      'items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}