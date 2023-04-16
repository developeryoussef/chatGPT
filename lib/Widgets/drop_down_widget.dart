import 'package:chatgpt/models/modesmodel.dart';
import 'package:chatgpt/provider/Provider_Models.dart';
import 'package:chatgpt/serveses/ApiServecies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constans/constant.dart';

class ModelDropdown extends StatefulWidget {
  const ModelDropdown({Key? key}) : super(key: key);

  @override
  State<ModelDropdown> createState() => _ModelDropdownState();
}

class _ModelDropdownState extends State<ModelDropdown> {
  String ?currentModel ;
  @override
  Widget build(BuildContext context) {
    final modelsProvider=Provider.of<ModelsProvider>(context,listen: false);
    currentModel =modelsProvider.currentModel;
    return FutureBuilder<List<ModelsModel>>(
      future:  modelsProvider.getAllModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('snapshotError is : ${snapshot.error.toString()}');
        } else if (snapshot.hasData == null || snapshot.data!.isEmpty||snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(color: cardColor,);
        }
          return DropdownButton(
            dropdownColor: scaffoldColor,
            value: currentModel??'davince',
            iconEnabledColor: Colors.white,
            items: List<DropdownMenuItem<String>>.generate(
                snapshot.data!.length,
                    (index) => DropdownMenuItem(
                    value: snapshot.data![index].id,
                    child: Text(
                      snapshot.data![index].id,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 15),
                    ))),
            onChanged: (value) {
              setState(() {
                currentModel = value.toString();
              });
              modelsProvider.setcurrentModel(value.toString());
            },
          );

      },
    );
  }
}

/**DropdownButton(
dropdownColor: scaffoldColor,
value: currentModel,
iconEnabledColor: Colors.white,
items: getModelsItem,

onChanged: (value) {
setState(() {
currentModel= value.toString();
});

},
);*/
