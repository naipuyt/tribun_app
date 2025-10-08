import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static const String baseUrl = 'https://newsapi.org/v2/';

  // get API key from env variables
  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  // list of endpoints
  static const String topHeadlines = '/top-headlines';
  static const String everything = '/everything';

  // list of categories
  static const List<String> categories = [
    'general',
    'technology',
    'bussiness',
    'sports',
    'health',
    'science',
    'entertaiment',
  ];
  // default country
  static const String defaultCounty = 'us';


  // app info
  static const String appName = 'News App';
  static const String appVersion = '1.0.0';
}