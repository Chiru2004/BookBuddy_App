import 'package:bookbuddyapp/Presentation/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
void main() async {
  await Hive.initFlutter();
  runApp(const BookBuddyApp());
}
