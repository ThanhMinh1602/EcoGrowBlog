import 'package:flutter/material.dart';

class ContactModel {
  final String id;
  final String title;
  final IconData icon;

  ContactModel({required this.id, required this.title, required this.icon});

  static List<ContactModel> contactModels = [
    ContactModel(id: '0', title: '0798334803', icon: Icons.phone_android),
    ContactModel(id: '1', title: 'ntminh16201', icon: Icons.email_outlined),
    ContactModel(
        id: '2',
        title: 'Duy Phước, Duy Xuyên, Quảng Nam',
        icon: Icons.map_outlined)
  ];
}
