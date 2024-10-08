import 'package:eco_grow/features/web/about/about_page.dart';
import 'package:eco_grow/features/web/blog/blog_page.dart';
import 'package:eco_grow/features/web/contact/contact_page.dart';
import 'package:eco_grow/features/web/donate/donate_page.dart';
import 'package:eco_grow/features/web/home/home_page.dart';
import 'package:flutter/material.dart';

class MainModel {
  final String title;
  final Widget page;

  MainModel({required this.title, required this.page});
}
