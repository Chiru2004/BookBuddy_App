import 'dart:convert';
import 'dart:developer' as devlog;
import 'package:bookbuddyapp/key.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


class CategoryDataProvider 
{


Future<List<dynamic>> getCategoriesdata(String subject) async{
   
   
    var request =http.Request('GET',Uri.parse('https://www.googleapis.com/books/v1/volumes?q=subject:${subject}&maxResults=24&key=${dotenv.get('API_key')}')); // insert the API key here
http.StreamedResponse response=await request.send().timeout(const Duration(seconds: 20));
final value=jsonDecode(await response.stream.bytesToString());
   return value['items'];
}
}