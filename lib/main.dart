import 'package:chatapp/Pages/Register_page.dart';
import 'package:chatapp/Pages/chat_page.dart';
import 'package:chatapp/Pages/login_page.dart';
import 'package:chatapp/Pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}
class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        LoginPage.id:(context) => LoginPage(),
        RegisterPage.id:(context) => RegisterPage(),
        SplashPage.id:(context) => SplashPage(),
        ChatPage.id:(context) => ChatPage(),
      },
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.id,
    );
  }
}
