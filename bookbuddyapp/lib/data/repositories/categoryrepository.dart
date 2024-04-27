import 'package:bookbuddyapp/data/dataproviders/categoryprovider.dart'; //

//
class CategoryRepository {
  final CategoryDataProvider api = CategoryDataProvider();

  Future<List<dynamic>> getBooksforCategory(String subject) async {
    List<dynamic> wholedata = await api.getCategoriesdata(subject); //
    return wholedata;
  }
}
