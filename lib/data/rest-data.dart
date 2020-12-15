import 'dart:async';
import 'package:bersihkebun/models/user.dart';
import 'package:bersihkebun/data/database-helper.dart';

class RestData {
  static final Base_Url = "";
  static final Login_Url = Base_Url + "/";

  Future<User> login( String username, String password) async {
    String flagLogged = "logged";
    //simulate internet connection by selecting the local database to check if user has already been registered
    var user = new User(null, username, password, null);
    var db = new DatabaseHelper();
    var userRetorno = new User(null,null,null,null);
    userRetorno = await db.selectUser(user);
    if(userRetorno != null){
      flagLogged = "logged";
      return new Future.value(new User(null, username, password,flagLogged));
    }else {
      flagLogged = "not";
      return new Future.value(new User(null, username, password,flagLogged));
    }
  }
}
