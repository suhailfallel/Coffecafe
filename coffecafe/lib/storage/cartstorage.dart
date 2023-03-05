import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CartModel {
  int id;
  String name;
  int quantity;
  int price;

  CartModel({
  required this.id, 
  required this.name, 
  required this.quantity, 
  required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}

