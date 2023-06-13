import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samachaar/helper/data.dart';
import 'package:samachaar/models/article_model.dart';
import 'package:samachaar/models/category_model.dart';

import '../helper/news.dart';
import 'article_view.dart';
import 'category_news.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles=<ArticleModel>[];
  bool _loading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    categories=getCategories();
    getNews();
  }

  getNews() async
  {
     News newsClass=News();
     await newsClass.getNews();
     articles=newsClass.news;
     setState(() {
       _loading=false;
     });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
              "Hot",
              style:
              TextStyle(color: Colors.red, fontWeight: FontWeight.w600,fontSize: 30),
            ),
            Text(
              " News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,fontSize: 30),
            )
      ],)),
      body: _loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
         
        child: Column(
          children: [
        
          /// CATEGORIES
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 70,
            child: ListView.builder(
              itemCount:categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)
              {
                 return CategoryTile(
                  imageUrl: categories[index].imageUrl, 
                  categoryname: categories[index].categoryname, 
                );
              }
          ),
          ),
        
        
          /// BLOGS
          Container(
              padding: EdgeInsets.all(10),
            child: ListView.builder(
              // physics: ClampingScrollPhysics(),
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: articles.length,
              itemBuilder: (context,index)
              {
                 return BlogTile(imageUrl: articles[index].urlToImage, title: articles[index].title!, desc: articles[index].description,url: articles[index].url!,);
              },
            ),
          ),
        
        ],),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  String  imageUrl="",categoryname="";
  CategoryTile({ required this.imageUrl,required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=> CategoryNews(category:categoryname.toLowerCase())));
      },
      child: Container(
   
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
           ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(imageUrl:imageUrl,width: 120,height: 60, fit: BoxFit.cover,)),
           Container(
           
            alignment: Alignment.center,
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black26,
            ),
            child: Text(categoryname,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  String imageUrl,title,desc,url;
  BlogTile({required this.imageUrl,required this.title,required this.desc,required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>ArticleView(
        blogUrl:url
        )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageUrl)),
          SizedBox(height: 8,),
          Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Colors.black87),),
          SizedBox(height: 8,),
          Text(desc,style: TextStyle(color: Colors.black54),)
        ]),
      ),
    );
  }
}