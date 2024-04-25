import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchDataProvider 
{
Future<List<dynamic>> getSearchData(String searchquery) async{
   
var request =http.Request('GET',Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$searchquery&maxResults:12&key=AIzaSyCVBge_LrjN3F8MQpi6ajwSsxh04G8jcMc'));
http.StreamedResponse response=await request.send().timeout(const Duration(seconds: 20));
final value=jsonDecode(await response.stream.bytesToString());

// final url=Uri.parse('https://www.googleapis.com/books/v1/volumes?q=subject:${subject}&key=AIzaSyCVBge_LrjN3F8MQpi6ajwSsxh04G8jcMc');
// dynamic response = await http.get(url);
// final value = jsonDecode(response);
// print(value['items'].runtimeType);
 //  print(value['items']);
   return value['items'];
}
}