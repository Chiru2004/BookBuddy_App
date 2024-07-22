import 'package:bookbuddyapp/Presentation/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await dotenv.load();
  await Hive.initFlutter();
  runApp(const BookBuddyApp());
}
