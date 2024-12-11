import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:petstagram/pages/login_page.dart';
import 'package:petstagram/pages/signup_page.dart';
// import 'package:petstagram/responses/mobile_screen.dart';
// import 'package:petstagram/responses/reponsive_layout.dart';
// import 'package:petstagram/responses/web_screen.dart';
import 'package:petstagram/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
       await Firebase.initializeApp(options:const FirebaseOptions(apiKey: 'AIzaSyCuQ3WpqoyMFLAIRPDa6MAhN_zOYLMw06A',
        appId: '1:784000467297:web:707c7f21c65192ce850520', 
        messagingSenderId: '784000467297', projectId: 'petinsta-d2f1a',
        storageBucket: 'petinsta-d2f1a.firebasestorage.app'));

 
  }
  else{
  await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Petstagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor) ,
      // home: const ResponsiveLayout(webScreenLayout: WebScreenLayout(), mobileScreenLayout: MobileScreenLayout()),
      home : const SignUpPage(),
  
    );
  }
}
