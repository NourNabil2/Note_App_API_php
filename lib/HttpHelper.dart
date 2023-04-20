import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'  ;
import 'package:path/path.dart';
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
      var response = await post(Uri.parse(URL), body: data
      ) ;
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



  postFile(String URL, Map data , File file) async
  {
    var req = MultipartRequest('POST',Uri.parse(URL));
    int length = await file.length()  ;
    var stream = ByteStream(file.openRead());
    var multyfile = MultipartFile('file',stream,length,filename: basename(file.path) );
    req.files.add(multyfile);


    data.forEach((key, value)

    {
      req.fields[key]=value;
    }

    );


    var myrequest = await req.send();
    var respone = await Response.fromStream(myrequest);

    if (myrequest.statusCode == 200)
      {
return jsonDecode(respone.body);
      }
    else
      {
      print('erorr request!!!!');
  }



  }
}