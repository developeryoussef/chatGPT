import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chatgpt/constans/constant.dart';
import 'package:http/http.dart' as http;

import '../models/ChatModel.dart';
import '../models/modesmodel.dart';

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/models'),
          headers: {'Authorization': 'Bearer $apiKey'});
      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print('jsonResponse[error] ${jsonResponse['error']['message']}');
        throw HttpException(jsonResponse['error']['message']);
      }
// print('jsonResponse $jsonResponse');
      List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
        print("temp ${value['id']}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      print('error when get models from api ${error.toString()}');
      rethrow;
    }
  }

  //second massage
  static Future<List<ChatModel>> sendMassage(
      {required String message, required String modelId}) async {
    try {
      print(modelId);
      var response = await http.post(
        Uri.parse('$baseUrl/completions'),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(
            {"model": modelId, "prompt": message, "max_tokens": 100}),
      );
      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print('jsonResponse[error] ${jsonResponse['error']['message']}');
        throw HttpException(jsonResponse['error']['message']);
      }
// print('jsonResponse $jsonResponse');
//       List temp=[];
//       for(var value in jsonResponse['data']){
//         temp.add(value);
//         print("temp ${value['id']}" );
//       }
//       return ModelsModel.modelsFromSnapshot(temp);
      List<ChatModel> chatList = [];
      if (jsonResponse['choices'].length > 0) {
        chatList = List.generate(
            jsonResponse['choices'].length,
            (index) => ChatModel(
                msg:(jsonResponse['choices'][0]['text']) ,
                chatIndex: 1
            )
        );
         print('jsonResponse[choices]${(jsonResponse['choices'][0]['text'])}');
      }
      return chatList;
    } catch (error) {
      print('error when get models from api ${error.toString()}');
      rethrow;
    }
  }
}
