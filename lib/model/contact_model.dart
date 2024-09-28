import 'package:flutter/material.dart';

class ContactModel {
  final String title;
  final IconData icon;

  ContactModel({required this.title, required this.icon});

  static List<ContactModel> contactModels = [
    ContactModel(title: '0798334803', icon: Icons.phone_android),
    ContactModel(title: 'ntminh16201@gmail.com', icon: Icons.email_outlined),
    ContactModel(
        title: 'Duy Phước, Duy Xuyên, Quảng Nam', icon: Icons.map_outlined)
  ];
}
