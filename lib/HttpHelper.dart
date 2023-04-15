import 'dart:convert';
import 'package:http/http.dart';
class Http {

  getdata(String URL) async
  {
    try{
      var response = await get(Uri.parse(URL)) ;
      if (response.statusCode == 200)
        {
          var body = jsonDecode(response.body);
          return body;
        }else{
        print('erorr ${response.statusCode}');
      }
    }
    catch(e){
      print('erorr ${e}');
    }
  }


  postdata(String URL, Map data) async
  {
    try{
      var response = await post(Uri.parse(URL), body: data ) ;
      if (response.statusCode == 200)
      {
        var body = jsonDecode(response.body);
        return body;
      }else{
        print('erorr ${response.statusCode}');
      }
    }
    catch(e){
      print('erorr!!! ${e}');
    }
  }
}