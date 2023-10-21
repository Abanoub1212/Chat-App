import 'package:chatapp/Pages/Register_page.dart';
import 'package:chatapp/Pages/chat_page.dart';
import 'package:chatapp/Widgets/Constants.dart';
import 'package:chatapp/Widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Widgets/custom_button.dart';
import '../helper/show_snack_bar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;

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
                              child: Text("Log In",
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
                          hintText: 'Email',
                          onChanged: (data) {
                            email = data;
                          },
                        ),
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
                            title: 'Log In',
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                isLoading = true;
                                setState(() {});
                                try {
                                  await loginUser();
                                  showSnackBar(context, "Successfully Log In");
                                  Navigator.pushReplacementNamed(context, ChatPage.id,arguments: email);
                                } on FirebaseAuthException catch (ex) {
                                  if (ex.code == 'user-not-found') {
                                    showSnackBar(context,
                                        "No user found for that email!");
                                  } else if (ex.code == 'wrong-password') {
                                    showSnackBar(context,
                                        "Wrong password provided for that user! ");
                                  }
                                }
                                isLoading = false;
                                setState(() {});

                              } else {
                              }

                            }
                            ),
                        // TextButton(
                        //     onPressed: () {},
                        //     child: const Text(
                        //       "Forget your password?",
                        //       style: TextStyle(
                        //         color: kPrimaryColor,
                        //         fontFamily: 'Roboto',
                        //         fontSize: 16,
                        //       ),
                        //     )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don\'t have an account?",
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, RegisterPage.id);
                                },
                                child: const Text(
                                  "Sign Up",
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

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
