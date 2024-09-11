import 'package:recess/core/api_client.dart';
import 'package:recess/core/url.dart';
import '../models/settings_model/experts_bookmark_model.dart';

class BookMarkExpertService {

Future<List<BookmarkedExpert>?> getBookmarkedUserById(Map<String, dynamic> data) async {
  try {
    String url = Url.getbookmarkeduserbyid;
    final response = await ApiService().authPost(url, data);

    if (response != null) {
      // print('Responsekkkkk$response');
      // var data = response['data']['data']; 
      // return BookmarkedExpert.fromJson(data);
        print('Responsekkkkk$response');
      var dataList = response['data']['data'] as List<dynamic>;
      List<BookmarkedExpert> bookmarkedExperts = dataList
          .map((item) => BookmarkedExpert.fromJson(item as Map<String, dynamic>))
          .toList();
      return bookmarkedExperts;
    } else {
      print('Empty response received');
      return null;
    }
  } catch (e) {
    print('An error occurred userbookmark service: $e');
    return null;
  }
}






}
