import 'dart:convert';
import 'dart:developer';
import 'package:bookbuddyapp/data/models/category.dart';
import 'package:bookbuddyapp/data/dataproviders/categoryprovider.dart';

class CategoryRepository{

final CategoryDataProvider api = CategoryDataProvider();

Future<List<category_data>> getBooksforCategory(String subject) async
{
  
  List<dynamic> wholedata = await api.getCategoriesdata(subject);
 
 // Map<String,dynamic> wholedata = jsonDecode(rawdata);
 List<category_data> newlist=[];
 for(final data in wholedata)
 {
  newlist.add(category_data.fromJson(data));
 }
 print(newlist.length);
  // final List<Map<String,dynamic>> listofcategories = wholedata;
  
  // final List<category_data> finaldata=[];

  // for(Map<String,dynamic> data in listofcategories)
  // {
  //  finaldata.add(category_data.fromJson(data));
  // }
  // log(finaldata.length.toString());
  return newlist;
}
}