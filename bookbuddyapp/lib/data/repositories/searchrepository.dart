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

  // final List<Map<String,dynamic>> listofcategories = wholedata;
  
  // final List<category_data> finaldata=[];

  // for(Map<String,dynamic> data in listofcategories)
  // {
  //  finaldata.add(category_data.fromJson(data));
  // }
  // log(finaldata.length.toString());
  return wholedata;
}
}