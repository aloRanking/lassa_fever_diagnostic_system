import 'package:dio/dio.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fluSecure;
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/models/token.dart';

//import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class UserRepository {
  static String _baseUrl = 'https://lassa-fever-diagnosis.herokuapp.com/api/v1/lfds';

  final storage = new fluSecure.FlutterSecureStorage();

  String loginUrl = '$_baseUrl/authenticate';
  String registerURL = '$_baseUrl/register';
  String getUserURL = '$_baseUrl/user';

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

      if (response.statusCode == 200) {
        var jwt = Token.fromJson(response.data);
        String receivedToken = jwt.token;

        return receivedToken;
      } else {
        return null;
      }
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
