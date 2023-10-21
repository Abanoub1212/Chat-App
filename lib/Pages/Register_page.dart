import 'package:chatapp/Pages/chat_page.dart';
import 'package:chatapp/Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Widgets/custom_textfield.dart';
import '../Widgets/Constants.dart';
import '../Widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email, password, name, phoneNumber;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset(
                  kLogo,
                  height: 120,
                ),
              ),
              const Text(
                "Scholar Chat",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  height: 500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView(
                      padding: EdgeInsets.only(bottom: 30, top: 0),
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text("Sign Up",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 22,
                                    fontFamily: 'Roboto',
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomFormTextField(
                            hintText: 'Name',
                            onChanged: (data) {
                              name = data;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormTextField(
                            hintText: 'Phone',
                            onChanged: (data) {
                              phoneNumber = data;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormTextField(
                            hintText: 'Email',
                            onChanged: (data) {
                              email = data;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomFormTextField(
                            hintText: 'Password',
                            onChanged: (data) {
                              password = data;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            title: 'Sign Up',
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                isLoading = true;
                                setState(() {});
                                try {
                                  await registerUser();
                                  showSnackBar(context, "Successfully Sign Up");
                                  Navigator.pushReplacementNamed(
                                      context, ChatPage.id,
                                      arguments: email);
                                } on FirebaseAuthException catch (ex) {
                                  if (ex.code == 'weak-password') {
                                    showSnackBar(context,
                                        "The password provided is too weak!!");
                                  } else if (ex.code ==
                                      'email-already-in-use') {
                                    showSnackBar(context,
                                        "The account already exists for that email!!");
                                  }
                                }
                                isLoading = false;
                                setState(() {});
                              } else {
                              }

                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Color(0xFFA2F3E4),
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
