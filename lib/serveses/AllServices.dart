import 'package:chatgpt/Widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';

import '../constans/constant.dart';

class Services {
  static Future<void> showModelSheet({required BuildContext context}) async {
 await showModalBottomSheet(
  clipBehavior:Clip.hardEdge,
  shape: const RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(top: Radius.circular(20), )
  ),
  backgroundColor: scaffoldColor,
  context: context, builder: (context) {
  return Padding(
  padding: const EdgeInsets.all(18.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: const [
  Text('Chosen Model : ', style: TextStyle(fontSize: 16,color:  Colors.white),),

    ModelDropdown()

  ],
  ),
  );
  },);

}
}