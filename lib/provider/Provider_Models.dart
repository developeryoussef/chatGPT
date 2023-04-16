import 'package:chatgpt/serveses/ApiServecies.dart';
import 'package:flutter/cupertino.dart';

import '../models/modesmodel.dart';

class ModelsProvider with ChangeNotifier{
  List<ModelsModel> modelList =[];

  List<ModelsModel> get getModelsList{
    return modelList;

  }
  String currentModel = "text-davinci-003";
  String get getCurrentModel{
    return currentModel;
  }
  void setcurrentModel (String newModel){
    currentModel= newModel;
    notifyListeners();
  }

  Future<List<ModelsModel>> getAllModels()async{
    modelList= await ApiServices.getModels();

    return modelList;

  }
}