import 'package:get/get.dart';
import 'package:news_app_flutter/src/service/headline_service.dart';
import '../model/Headlines.dart';

class HeadLinesController extends GetxController{

  var isLoading = true.obs;
  var articleList = <Article>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getArticles();
  }

   getArticles({String country = "us", String? category}) async{

     isLoading(true);

    try{
      isLoading(true);
      var response = await HeadLineService.getTopHeadlinesNews(country: country,category: category,);

      if(response != null){
        articleList(response);
      }

    }catch (error,stackTrace){
      print('Exception occurred : $error with stackTrace : $stackTrace');
    }finally{
      isLoading(false);
    }
  }


}