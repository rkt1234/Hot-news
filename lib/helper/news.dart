import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel>  news=[];
  Future<void> getNews() async
  {
    var url=Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=ed42ab388414425da381a011c93116c2");
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=="ok")
    {
      jsonData["articles"].forEach((element)
      {
        if(element["urlToImage"]!=null && element["description"]!=null)
        {
          print(element["urlToImage"]);
          print(element["description"]);
           ArticleModel articlemodel=ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'].toString(),
            url: element['url'],
            urlToImage: element['urlToImage'].toString(),
           // publishedAt: element['publishedAt'],
            content: element['content']
           );
           news.add(articlemodel);
        }
      }
      );
    }
  }
}
class CategoryNewsClass{
  List<ArticleModel>  news=[];
  Future<void> getNews(String category) async
  {
    category=category.toLowerCase();
    print((category.runtimeType));
    print(category);
    print(category.length);
    print("ab se");
    var url=Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=ed42ab388414425da381a011c93116c2");
   // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ed42ab388414425da381a011c93116c2
    var response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    if(jsonData['status']=="ok")
    {
      jsonData["articles"].forEach((element)
      {
        if(element["urlToImage"]!=null && element["description"]!=null)
        {
           print(element["urlToImage"]);
          print(element["description"]);

           ArticleModel articlemodel=ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'].toString(),
            url: element['url'],
            urlToImage: element['urlToImage'].toString(),
           // publishedAt: element['publishedAt'],
            content: element['content']
           );
           news.add(articlemodel);
        }
      }
      );
    }
  }
}
