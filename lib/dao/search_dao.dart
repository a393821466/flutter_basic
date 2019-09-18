// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/search_model.dart';

// class SreachDao{
//   static Future<SearchModel> fetch(String url) async{
//     final response=await http.get(url);
//     if(response.statusCode==200){
//       Utf8Decoder utf8decoder=Utf8Decoder();
//       var result=json.decode(utf8decoder.convert(response.bodyBytes));
//       return SearchModel.fromJson(result);
//     }else{
//       throw Exception('Failed to load SearchModel.json');
//     }
//   }
// }
