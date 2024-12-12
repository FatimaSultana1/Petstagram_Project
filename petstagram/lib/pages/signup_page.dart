import 'package:flutter/material.dart';
// import 'package:petstagram/utils/colors.dart';
import 'package:petstagram/widgets/text_field_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea(child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
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
              const SizedBox(height: 24),
              Stack(
                children: [
                  const CircleAvatar(radius: 64, backgroundImage: NetworkImage('https://plus.unsplash.com/premium_photo-1731693607546-3ed3131f9152?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),),
                  Positioned( bottom: -10, left: 80, child: IconButton(onPressed: () {}, icon:  const Icon(Icons.add_a_photo, ),))
                ],
              ),
              const SizedBox(height: 30,),
              TextFieldInput( textEditingController: _usernameController, hintText: 'Enter your username', textInputType:  TextInputType.text),
              const SizedBox(height: 30,),
              TextFieldInput( textEditingController: _emailController, hintText: 'Enter your email', textInputType:  TextInputType.emailAddress),
              const SizedBox(height: 30),
              TextFieldInput( textEditingController: _passwordController, hintText: 'Enter your password', textInputType:  TextInputType.text, isPass: true),
              const SizedBox(height: 30),
              TextFieldInput( textEditingController: _bioController, hintText: 'Enter your bio', textInputType:  TextInputType.text),
              const SizedBox(height: 30,),
              
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
                    child: const Text("Don't have an account? ", style: TextStyle(color: Colors.black)),
                    padding: const EdgeInsets.symmetric(vertical: 8,),
                    
                  ),
                  GestureDetector( onTap: (){},
                    child: Container(
                      child: const Text("Sign up.", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black ),),
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