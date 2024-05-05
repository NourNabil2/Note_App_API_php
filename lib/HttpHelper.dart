import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'  ;
import 'package:path/path.dart';


String _basicAuth = 'Basic ' +
    base64Encode(utf8.encode(
        'Nour:Nour123456789'));

Map<String, String> myheaders = {
  'authorization': _basicAuth
};


class Http {

  static getdata(String URL) async
  {
    try{
      var response = await get(Uri.parse(URL),headers: myheaders ,) ;
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


  static postdata(String URL, Map data) async
  {
    try{
      var response = await post(Uri.parse(URL), headers: myheaders ,body: data
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



  static postFile(String URL, Map data , File file) async
  {
    var req = MultipartRequest('POST',Uri.parse(URL));
    int length = await file.length()  ;
    var stream = ByteStream(file.openRead());
    var multyfile = MultipartFile('file',stream,length,filename: basename(file.path) );
    req.files.add(multyfile);
    req.headers.addAll(myheaders);

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