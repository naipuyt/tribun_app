class NewsArticles {
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final Source? source;

 

  factory NewsArticles.fromJson(Map<String, dynamic> json) {
    return NewsArticles(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      source: json['source'] != null ? Source.fromJson(json['source']) : null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'source': source,
    };
  }

   NewsArticles({required this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content, this.source});
}

class Source {
  final String? id;
  final String? name;

  Source({this.id, this.name});

  //berfungsi untuk merapikan format data yang didapatkan dari server yang awalnya bertipe data .json menjadi data yang dimengerti oleh bahasa pemograman yang digunakan
  // yang akan dikemablikan oleh API atau server ketika kita melakukan atau membuat sebuah req, diantara nya : status http 100, 200 dll, data yang berformat json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name' : name,
    };
  }
}