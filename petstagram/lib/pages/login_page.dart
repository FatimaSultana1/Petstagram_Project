import 'package:flutter/material.dart';
// import 'package:petstagram/utils/colors.dart';
import 'package:petstagram/widgets/text_field_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea(child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                          Flexible(
                flex: 2,
                child: Container(),
              ),
              // const SizedBox(height: 64),
              // const Text(
              //   'Petstagram',
              //   style: TextStyle(
              //     fontFamily: 'Algerian',
              //     fontSize: 42,
              //     fontWeight: FontWeight.bold,
              //     color: Color.fromARGB(255, 207, 69, 74)
              //   ),
              // ),
              Image.asset(
                'assets/images/pet.png',
                width: 200, // Adjust width
                height: 200, // Adjust height
              ),

              const SizedBox(height: 30,),
              TextFieldInput( textEditingController: _emailController, hintText: 'Enter your email', textInputType:  TextInputType.emailAddress),
              
              const SizedBox(height: 30),
              TextFieldInput( textEditingController: _passwordController, hintText: 'Enter your password', textInputType:  TextInputType.text, isPass: true),
              const SizedBox(height: 30),
              InkWell(
                child: Container(
                  child: const Text('Log in'), 
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(4),),),
                  color:Color.fromARGB(255, 207, 69, 74),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Flexible(child: Container(),flex: 2,),
              
              Row(           
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an account? "),
                    padding: const EdgeInsets.symmetric(vertical: 8,),
                  ),
                  GestureDetector( onTap: (){},
                    child: Container(
                      child: const Text("Sign up.", style: TextStyle(fontWeight: FontWeight.bold),),
                      padding: const EdgeInsets.symmetric(vertical: 8,),
                  ),),
                
                ],
              )
          ],
        ),
      ))
    );
  }
}