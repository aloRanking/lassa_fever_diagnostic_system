import 'package:dio/dio.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fluSecure;
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/models/survey_model.dart';
import 'package:lassafeverdiagnosticsystem/models/token.dart';

//import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class UserRepository {
  static String _baseUrl = 'https://lassa-fever-diagnosis.herokuapp.com/api/v1/lfds';
  //static String _baseUrl = 'http://localhost:8080/api/v1/lfds';

  final storage = new fluSecure.FlutterSecureStorage();

  String loginUrl = '$_baseUrl/authenticate';
  String registerURL = '$_baseUrl/register';
  String getUserURL = '$_baseUrl/user';
  String surveyURL = '$_baseUrl/survey';
  String updateURL = '$_baseUrl/user';
  

/* static BaseOptions options = BaseOptions(
   baseUrl: "$_baseUrl",
    connectTimeout: 5000,
    receiveTimeout: 3000,
); */

  final Dio _dio = Dio();

  Future<String> authenticate({
    @required String user,
    @required String pass,
  }) async {
    try {
      Response response = await _dio.post(
        loginUrl,
        data: {'password': pass, 'username': user},
      );
      print(response);

      
        var jwt = Token.fromJson(response.data);
        String receivedToken = jwt.token;

        return receivedToken;
      
    } catch (e) {
      var err = Token.withError("$e");

      return null;
    }
  }

  Future<bool> createMember({RegUser user}) async{
    try {
      Response response = await _dio.post(
        registerURL,
        data: user.toJson(),
      );
      //print(response);
      if (response.statusCode == 201 ||response.statusCode == 200) {
        return true;
        
      } else {

        return false;
      }

   
    } catch (e) {
     

      return false;
    }

  }

  Future<RegUser> getUserByMail(String userEmail) async{

    String value = await storage.read(key: 'token');

 try {
      Response response = await _dio.post(
        getUserURL,
        data: { 'email': userEmail},
        options: Options(
       headers: {'Authorization': 'Bearer $value'}
     )
      );
      print(response);

      if (response.statusCode == 200) {

        return RegUser.fromJson(response.toString());
        
      }

   
    } catch (e) {
     

      return null;
    }



  }

  Future<String> postSurvey({
     Survey survey
  }) async {

    String value = await storage.read(key: 'token');

    try {
      Response response = await _dio.post(
        surveyURL,
        data: {
          'full_name': survey.fullname,
          'details': survey.getDetails
        },
        options: Options(
       headers: {'Authorization': 'Bearer $value'}
      )
      );
      print(response);

      if (response.statusCode == 200) {
        var surveyResponse = response.data.toString();

        return surveyResponse;
       
      } else {
        return null;
      }
    } catch (e) {
     

      return null;
    }
  }

   Future<bool> updateMember({
     RegUser regUser, int id
  }) async {

    String value = await storage.read(key: 'token');

    try {
      Response response = await _dio.put(
        '$updateURL/$id',
        data:{
    "first_name": regUser.firstname,
    "last_name":regUser.lastname,
    "email": regUser.getEmail,
    "password" : regUser.getPassword,

    "gender": regUser.getGender,
    "phone_number":regUser.phonenumber,
    "image": regUser.getImage,
  
    "res_state":regUser.resstate,
    "res_home_address":regUser.reshome_address,

},
        options: Options(
       headers: {'Authorization': 'Bearer $value'}
      )
      );
      print(response);

      if (response.statusCode == 202) {
        var surveyResponse = response.data.toString();

       // return surveyResponse;
       return true;
       
      } else {
        return false;
      }
    } on DioError catch(e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if(e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        //print(e.response.request);

        return false;
    } else{
        // Something happened in setting up or sending the request that triggered an Error
       // print(e.request);
        print(e.message);
        return false;
    }
  }

  }




/*  Future<MenuResponse> getAllMenus() async{

   String value = await storage.read(key: 'token');
   print(value);

   try {
     Response response = await _dio.get(
     getMenuListUrl,
     options: Options(
       headers: {'Authorization': 'Bearer $value'}
     )
     

   );
   print(response);
   return MenuResponse.fromJson(response.data);


   } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MenuResponse.withError("$error");
    }





  } */


  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    //await Future.delayed(Duration(seconds: 1));
    await storage.delete(key: 'token');
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain

    await storage.write(key: 'token', value: token);
    //await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<String> hasToken() async {
    String value = await storage.read(key: 'token');
    return value;
   /*  if (value==null) {
      return false;
    } else {
      return true;
    } */
  }

 
}
