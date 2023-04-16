import 'package:flutter/material.dart';

const Color scaffoldColor = Color(0xff343641);
const Color cardColor = Color(0xff444654);
String baseUrl ='https://api.openai.com/v1';
String apiKey ='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';

//
// final chatMassages = [
//   {
//     "msg": "hello how are you 0",
//     "chatIndex": 0,
//   },
//   {
//     "msg": "hello how are you 1",
//     "chatIndex": 1,
//   },
//   {
//     "msg": "hello how are you 2",
//     "chatIndex": 2,
//   },
//   {
//     "msg":
//         "hello how are you 3 hello how are you 4 hello how are you 4 hello how are you 4 hello how are you 4",
//     "chatIndex": 3,
//   },
//   {
//     "msg":
//         "hello how are you 4 hello how are you 4 hello how are you 4 hello how are you 4 hello how are you 4 hello how are you 4 hello how are you 4 hello how are you 4",
//     "chatIndex": 4,
//   }
// ];

/**
List<String> models = [
  'model1',
  'model2',
  'model3',
  'model4',
  'model5',
  'model6',
];

List<DropdownMenuItem<String>>? get getModelsItem {
  List<DropdownMenuItem<String>>? modelsItems =
      List<DropdownMenuItem<String>>.generate(
          models.length,
          (index) => DropdownMenuItem(
            value: models[index],
                  child: Text(
                models[index],
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )));
  return modelsItems;
}
*/
// ListTile(
// title: Text(
// chat[index],
// style: const TextStyle(color: Colors.white, fontSize: 20),
// ),
// leading: const CircleAvatar(
// backgroundColor: Colors.grey,
// radius: 25, child: Icon(Icons.account_circle_outlined,color: Colors.white,)),
// );

// else {
// return
// Container(
//
// color: Colors.grey.shade600,
// child: ListTile(
// title: Text(
// chat[index],
// style:
// const TextStyle(color: Colors.white, fontSize: 20),
// ),
// leading: const CircleAvatar(
// backgroundColor: Colors.blue,
// radius: 25,
// child:
// Icon(Icons.ac_unit_outlined,color: Colors.white,)),
// ),
// );
//
// }
