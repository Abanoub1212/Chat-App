import 'package:chatapp/Pages/login_page.dart';
import 'package:chatapp/Widgets/Constants.dart';
import 'package:chatapp/models/message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/custom_chatbuble.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  String? Data;
  final _controller = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings!.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt!, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 50,
                  ),
                  Text('Chat'),
                ],
              ),
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(onPressed: () {
                  Navigator.pushNamed(context, LoginPage.id);
                }, icon: Icon(Icons.exit_to_app_outlined))
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(
                              message: messagesList[index],
                            )
                          : ChatBubleForFriend(
                              message: messagesList[index],
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onChanged: (data) {
                      Data = data;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: kPrimaryColor)),
                      suffixIcon: IconButton(
                        onPressed: () {
                          messages.add({
                            kMessage: Data,
                            kCreatedAt: DateTime.now(),
                            'id': email,
                          });
                          controller.clear();
                          _controller.animateTo(
                            0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        icon: Icon(Icons.send),
                        color: kPrimaryColor,
                      ),
                      hintText: 'Send Message',
                    ),
                    style: const TextStyle(color: kPrimaryColor),
                    cursorColor: kPrimaryColor,
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: kPrimaryColor,
            body: Center(
              child: Image.asset(
                'assets/images/scholar.png',
                height: 150,
              ),
            ),
          );
        }
      },
    );
  }
}
