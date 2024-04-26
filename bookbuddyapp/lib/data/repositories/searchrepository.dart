import 'package:bookbuddyapp/data/dataproviders/searchprovider.dart';
import 'package:bookbuddyapp/data/models/category.dart';
import 'package:bookbuddyapp/data/models/search.dart';

class SearchRepository{

final SearchDataProvider api = SearchDataProvider();

Future<List<dynamic>> getBooksforSearch(String searchquery) async
{
  
List<dynamic> wholedata = await api.getSearchData(searchquery);

//Map<String,dynamic> wholedata = jsonDecode(rawdata);
 
 List<searchmodel> newlist=[];

print(wholedata[0]['volumeInfo']['title']);

// newlist= wholedata.map((e) {
//   return searchmodel.fromJson(e);
// }).toList();



 print("helllooooooooooooooooooooooo");
print(newlist.length);
//
  return wholedata;
}
}