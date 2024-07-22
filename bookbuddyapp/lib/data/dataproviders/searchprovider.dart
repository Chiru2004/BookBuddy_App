import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SearchDataProvider 
{
Future<List<dynamic>> getSearchData(String searchquery) async{
   
var request =http.Request('GET',Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$searchquery&maxResults:18&key=${dotenv.get('API_key')}')); // insert the API key here
http.StreamedResponse response=await request.send().timeout(const Duration(seconds: 20));
final value=jsonDecode(await response.stream.bytesToString());

   return value['items'];
}
}