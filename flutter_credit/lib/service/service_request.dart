import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_credit/config/service_url.dart';
import 'package:flutter/material.dart';


/*
 * 网络请求封装get请求
 */
Future getRequest(url,{formData}) async{
  print(url+"11111222");
    try{
      Response response;
      Dio dio = new Dio();
      dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
      if(formData==null){
        response = await dio.get(servicePath[url]);
      }else{
        response = await dio.get(servicePath[url],queryParameters: formData);
      }
      if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception("接口或者服务器异常。。。。。");
      }
  }catch(e){
      print(e);
    }
}


/*
 * 网络请求封装post请求
 */
Future postRequest(url,{formData}) async{
  print(url);

  try{

    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if(formData==null){
      response = await dio.post(servicePath[url]);
    }else{
      response = await dio.post(servicePath[url],data: formData);
    }
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception("接口或者服务器异常。。。。。");
    }
  }catch(e){
    print(e);
  }
}

