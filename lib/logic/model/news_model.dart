class NewsModel {
  final String author, urlToImage, title;

  const NewsModel(this.author, this.urlToImage, this.title);

  NewsModel.fromJson(Map<String, dynamic> newsJson)
      : this.author = newsJson['author'],
        this.urlToImage = newsJson['urlToImage'],
        this.title = newsJson['title'];
}