import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petstagram/providers/user_provider.dart';
import 'package:petstagram/utils/colors.dart';
import 'package:petstagram/utils/utils.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {

  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();

  _selectImage(BuildContext contex) async{
    return showDialog(context: context, builder: (contex){
      return SimpleDialog(
        title: const Text('Create a Post'),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Take a photo') ,
            onPressed: () async{
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.camera,);

              setState(() {
                _file = file;
              });
            },
          ),

         SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Choose from gallery') ,
            onPressed: () async{
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.gallery,);

              setState(() {
                _file = file;
              });
            },
          ),

          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Cancel') ,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final User user = Provider.of<UserProvider>(context).getUser;


    return  _file == null ?Center(
      child: IconButton(
        icon: const Icon(Icons.upload),
        onPressed: () => _selectImage(context),),
    ):

     Scaffold(

      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          
          ),
          title: const  Text('Post to'),
          centerTitle: false,
          actions: [
            TextButton(onPressed: (){}, child: const Text('Post', style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),))
          ],
      ),


      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround ,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  user.photoUrl,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.35,
                child: TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Write a Caption...',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                )
              ),

              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487/451,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: MemoryImage(_file!),
                        fit: BoxFit.fill,
                        alignment: FractionalOffset.topCenter,
                        )
                    ),
                  ),
                  
                  ),

              ),
              const Divider(),
            ],
          )
        ],
      )

    );
  }
}