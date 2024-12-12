import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petstagram/resources/auth_methods.dart';
import 'package:petstagram/utils/utils.dart';
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
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();

  }

  void selectImage() async{
   Uint8List im = await pickImage(ImageSource.gallery);
   setState(() {
     _image = im;
   });
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
                flex: 1,
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
                width: 180, // Adjust width
                height: 180, // Adjust height
              ),
              // const SizedBox(height: 14),
              Stack(
                children: [
                  _image!=null? CircleAvatar(radius: 64, backgroundImage: MemoryImage(_image!),)
                  : const CircleAvatar(radius: 64, backgroundImage: NetworkImage('https://www.shutterstock.com/image-vector/vector-illustration-orange-cat-suitable-260nw-2474150129.jpg')),
                  Positioned( bottom: -10, left: 80, child: IconButton(onPressed: selectImage, icon:  const Icon(Icons.add_a_photo, ),))
                ],
              ),
              const SizedBox(height: 20,),
              TextFieldInput( textEditingController: _usernameController, hintText: 'Enter your username', textInputType:  TextInputType.text),
              const SizedBox(height: 20,),
              TextFieldInput( textEditingController: _emailController, hintText: 'Enter your email', textInputType:  TextInputType.emailAddress),
              const SizedBox(height: 20),
              TextFieldInput( textEditingController: _passwordController, hintText: 'Enter your password', textInputType:  TextInputType.text, isPass: true),
              const SizedBox(height: 20),
              TextFieldInput( textEditingController: _bioController, hintText: 'Enter your bio', textInputType:  TextInputType.text),
              const SizedBox(height: 20,),
              
              InkWell(
                onTap: () async {
                    String res = await AuthMethods().signUpUser(
                      email: _emailController.text, 
                      password: _passwordController.text, 
                      username: _usernameController.text, 
                      bio: _bioController.text,
                      file: _image!,);
              
                      print(res);
                }, 
                child: Container(
                  child: const Text('Sign up'), 
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(4),),),
                  color:Color.fromARGB(255, 207, 69, 74),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(child: Container(),flex: 1,),
              
              Row(           
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Already have an account? ", style: TextStyle(color: Colors.black)),
                    padding: const EdgeInsets.symmetric(vertical: 8,),
                    
                  ),
                  GestureDetector( onTap: (){},
                    child: Container(
                      child: const Text("Log In.", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black ),),
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