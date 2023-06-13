import '../models/category_model.dart';

List<CategoryModel> getCategories()
{
  List<CategoryModel> category= <CategoryModel>[];
  CategoryModel categoryModel=new CategoryModel();

  //1
  categoryModel.categoryname="Business";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80";
  category.add(categoryModel);

  //2
  categoryModel=new CategoryModel();
  categoryModel.categoryname="Entertainment";
  categoryModel.imageUrl="https://media.istockphoto.com/id/1049022558/photo/cheering-crowd-at-a-concert.jpg?s=2048x2048&w=is&k=20&c=WVyJm8nzMM0tpPgVvPJZPZkysFX02ED0F_DKjcbp-Mk=";
  category.add(categoryModel);

  //4
  categoryModel=new CategoryModel();
  categoryModel.categoryname="Health";
  categoryModel.imageUrl="https://media.istockphoto.com/id/1208604845/vector/healthy-lifestyle-and-self-care-concept.jpg?s=2048x2048&w=is&k=20&c=8sNpfieHx07WPfgZzqP_xcBQ5toLolMwQrVgV7b2pY0=";
  category.add(categoryModel);

  //5
  categoryModel=new CategoryModel();
  categoryModel.categoryname="Science";
  categoryModel.imageUrl="https://media.istockphoto.com/id/935221094/vector/design-concept-of-word-science-website-banner.jpg?s=2048x2048&w=is&k=20&c=DEc59WhyzHL5Cj3TQCoda8t699vrOj03MgbmC9YOmyg=";
  category.add(categoryModel);

  //6
  categoryModel=new CategoryModel();
  categoryModel.categoryname="Sports";
  categoryModel.imageUrl="https://media.istockphoto.com/id/1141191007/vector/sports-set-of-athletes-of-various-sports-disciplines-isolated-vector-silhouettes-run-soccer.jpg?s=2048x2048&w=is&k=20&c=j78F5MiMsepd2mOFHVNyG08YtDipM0MfIGooieemrEE=";
  category.add(categoryModel);

  //7
  categoryModel=new CategoryModel();
  categoryModel.categoryname="Technology";
  categoryModel.imageUrl="https://media.istockphoto.com/id/1295900106/photo/data-scientists-male-programmer-using-laptop-analyzing-and-developing-in-various-information.jpg?s=2048x2048&w=is&k=20&c=fBQm0fvR7I5s8xT-BhnSbhl8OoZJIi_Bqh7Whwrk95g=";
  category.add(categoryModel);
  
  return category;

}