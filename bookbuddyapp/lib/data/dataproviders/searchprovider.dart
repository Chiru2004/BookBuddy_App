import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchDataProvider 
{
Future<List<dynamic>> getSearchData(String searchquery) async{
   
var request =http.Request('GET',Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$searchquery&maxResults:18&key=AIzaSyCVBge_LrjN3F8MQpi6ajwSsxh04G8jcMc'));
http.StreamedResponse response=await request.send().timeout(const Duration(seconds: 20));
final value=jsonDecode(await response.stream.bytesToString());

   return value['items'];
}
}