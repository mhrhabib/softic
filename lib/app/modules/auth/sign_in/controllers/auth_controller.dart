import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart'as dio;
import 'package:softic/app/modules/auth/sign_in/repository/auth_repository.dart';

import '../../../../general/routes/app_routes.dart';


class AuthContoller extends GetxController{
  TextEditingController userConntroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var rememberMe = false.obs;

  final storage = GetStorage();


  Future<void> loginWithEmail()async{
    try{
      Map data ={
        'username': userConntroller.text,
        'password': passwordController.text,
        'rememberMe': rememberMe.value,
      };
    dio.Response response  = await AuthRepository.login(payload: data);
      if(response.statusCode == 200){
        var data = await response.data;
        print(data);
        var stringData = jsonEncode(data);
        print(stringData);
        var token = jsonDecode(stringData);
        print(token);
        await storage.write('token', token['id_token']);

        userConntroller.clear();
        passwordController.clear();
        Get.toNamed(Routes.main);

      }else{
        throw " login error";
      }
    }catch(error){
      Get.back();
      showDialog(context: Get.context!, builder: (context) => SimpleDialog(
        title: Text("Error"),
        children: [Text(error.toString())],
      ), );
    }
  }
  
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    userConntroller.dispose();
    passwordController.dispose();
  }

}