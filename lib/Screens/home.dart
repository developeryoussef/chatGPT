import 'dart:developer';
import 'package:chatgpt/Screens/chat_Widget.dart';
import 'package:chatgpt/serveses/AllServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../constans/constant.dart';
import '../models/ChatModel.dart';
import '../provider/Provider_Models.dart';
import '../serveses/ApiServecies.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> chat = [];
  bool isTyping = false;
  late FocusNode focusNode;
  late TextEditingController textController;
  late ScrollController scrollController;
  @override
  void initState() {
    textController = TextEditingController();
    scrollController = ScrollController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bora',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/mybot.png',
              height: 30,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await Services.showModelSheet(context: context);
              },
              icon: const Icon(Icons.more_vert_rounded))
        ],
        backgroundColor: cardColor,
        elevation: 2,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 8),
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return ChatWidget(
                          chatIndex: chatList[index].chatIndex,
                          msg: chatList[index].msg.toString(),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                      itemCount: chatList.length)),
              if (isTyping) ...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                )
              ],
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: textController,
                  // scrollController: scrollController,
                  focusNode: focusNode,
                  onFieldSubmitted: (value) async {
                    setState(() {});
                    await sendMessageFCT(
                      modelsProvider: modelsProvider,
                    );
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: cardColor,
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () async {
                          setState(() {});
                          await sendMessageFCT(
                            modelsProvider: modelsProvider,
                          );
                        }),
                    hintText: 'send Massage',
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void scrollToEnd() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 702), curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT({required ModelsProvider modelsProvider}) async {
    try {
      if (isTyping) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("please inter your message"),
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 750),
        ));
        return;
      }
      if (textController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("please inter your message"),
          backgroundColor: Colors.amber,
          duration: Duration(milliseconds: 750),
        ));
        return;
      }
      setState(() {
        isTyping = true;
        focusNode.unfocus();
        chatList.add(ChatModel(msg: textController.text, chatIndex: 0));
        textController.clear();
      });
      chatList.addAll(await ApiServices.sendMassage(
          message: textController.text,
          modelId: modelsProvider.getCurrentModel));
      setState(() {});
    } catch (error) {
      log("error$error");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Inccorect API Key"),
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 750),
      ));
    } finally {
      setState(() {
        scrollToEnd();
        isTyping = false;
      });
    }
  }
}
