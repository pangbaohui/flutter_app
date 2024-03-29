import 'dart:async';
import 'dart:convert';//模型转换
import 'package:flutter_app/model/home_model.dart';
import 'package:http/http.dart' as http;
const HOME_URL='http://www.devio.org/io/flutter_app/json/home_page.json';

//首页大接口
class HomeDao{
  static Future<HomeModel> fetch() async{
    final response = await http.get(HOME_URL); //获取接口数据
    if(response.statusCode == 200){
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    }else{
      throw Exception('接口请求失败');
    }
  }
}