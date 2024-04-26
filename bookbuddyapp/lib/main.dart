import 'package:bookbuddyapp/Presentation/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const BookBuddyApp());
}
