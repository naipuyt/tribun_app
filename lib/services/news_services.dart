import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tribun_app/models/news_response.dart';
import 'package:tribun_app/utils/constants.dart';

class NewsService {
  static const String _baseUrl = Constants.baseUrl;
  static final String _apiKey = Constants.apiKey;

  /// Mendapatkan berita top headline
  Future<NewsResponse> getTopHeadlines({
    String country = Constants.defaultCounty,
    String? category,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      // 🔹 Siapkan parameter query
      final Map<String, String> queryParams = {
        'apiKey': _apiKey,
        'country': country,
        'page': page.toString(),
        'pageSize': pageSize.toString(),
      };

      if (category != null && category.isNotEmpty) {
        queryParams['category'] = category;
      }

      // 🔹 Gabungkan base URL + endpoint + query parameters
      final uri = Uri.parse('$_baseUrl${Constants.topHeadlines}')
          .replace(queryParameters: queryParams);

      // 🔹 Kirim request ke API
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return NewsResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load news, status code: ${response.statusCode}');
      }
    } catch (e) {
      // 🔹 Tambahkan log agar tahu error sebenarnya
      print('Error while fetching top headlines: $e');
      throw Exception('Another problem occurs, please try again later');
    }
  }

  /// Mencari berita berdasarkan query (kata kunci)
  Future<NewsResponse> searchNews({
    required String query,
    int page = 1,
    int pageSize = 20,
    String? sortBy,
  }) async {
    try {
      final Map<String, String> queryParams = {
        'apiKey': _apiKey,
        'q': query,
        'page': page.toString(),
        'pageSize': pageSize.toString(),
      };

      if (sortBy != null && sortBy.isNotEmpty) {
        queryParams['sortBy'] = sortBy;
      }

      final uri = Uri.parse('$_baseUrl${Constants.everything}')
          .replace(queryParameters: queryParams);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return NewsResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load search results, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error while searching news: $e');
      throw Exception('Another problem occurs, please try again later');
    }
  }
}
