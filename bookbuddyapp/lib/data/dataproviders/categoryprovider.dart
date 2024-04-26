import 'dart:convert';
import 'dart:developer' as devlog;
import 'package:bookbuddyapp/key.dart';
import 'package:http/http.dart' as http;


class CategoryDataProvider 
{


Future<List<dynamic>> getCategoriesdata(String subject) async{
   
   
    var request =http.Request('GET',Uri.parse('https://www.googleapis.com/books/v1/volumes?q=subject:${subject}&maxResults=24&key=AIzaSyCVBge_LrjN3F8MQpi6ajwSsxh04G8jcMc'));
http.StreamedResponse response=await request.send().timeout(const Duration(seconds: 20));
final value=jsonDecode(await response.stream.bytesToString());
// final url=Uri.parse('https://www.googleapis.com/books/v1/volumes?q=subject:${subject}&key=AIzaSyCVBge_LrjN3F8MQpi6ajwSsxh04G8jcMc');
//  dynamic response = await http.get(url);
//  final value = jsonDecode(response);

 print(value['items'].length);
   return value['items'];
}
}