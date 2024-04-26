import 'dart:convert';
import 'dart:developer';
import 'package:bookbuddyapp/data/models/category.dart';
import 'package:bookbuddyapp/data/dataproviders/categoryprovider.dart';

class CategoryRepository{

final CategoryDataProvider api = CategoryDataProvider();

Future<List<dynamic>> getBooksforCategory(String subject) async
{
  
  List<dynamic> wholedata = await api.getCategoriesdata(subject);
//
//  List<category_data> newlist=[];
//  for(final data in wholedata)
//  {
//   newlist.add(category_data.fromJson(data));
//  }
//  print(newlist.length);
//   //no chnages
  return wholedata;
}
}