import 'package:bookbuddyapp/data/dataproviders/searchprovider.dart';
//

class SearchRepository {
  final SearchDataProvider api = SearchDataProvider();

  Future<List<dynamic>> getBooksforSearch(String searchquery) async {
    List<dynamic> wholedata = await api.getSearchData(searchquery);
    return wholedata; //
  }
}
