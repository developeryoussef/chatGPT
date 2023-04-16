import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatgpt/constans/constant.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
   ChatWidget({required this.chatIndex,required this.msg, });
final String msg;
final int chatIndex;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
bool likedPressed =true;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Material(
          color:widget.chatIndex ==0?scaffoldColor: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.chatIndex ==0 ?    Image.asset('assets/sender.png',height: 30,):Image.asset('assets/bot.png',height: 30,),
                const SizedBox(width: 10,),
                Expanded(
                  child: widget.chatIndex ==0?Text(widget.msg,style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),):DefaultTextStyle(

                    style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),
                    child: AnimatedTextKit(
                        repeatForever: false,
                        isRepeatingAnimation: false,
                        totalRepeatCount: 1,
                        displayFullTextOnTap: true,
                        animatedTexts: [
                      TyperAnimatedText(widget.msg.trim()),
                    ]),
                  ),
                ),
                widget.chatIndex %2 ==0? const SizedBox.shrink():
                    Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton( icon: const Icon(Icons.thumb_up_alt_outlined),onPressed: (){},),
                        const SizedBox(width: 5,),
                        IconButton(icon:likedPressed? const Icon(Icons.thumb_down_alt_outlined ):
                        const Icon(Icons.thumb_down_alt,color: Colors.purple,),onPressed: (){
likedPressed =!likedPressed;
                        },),
                      ],
                    ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
