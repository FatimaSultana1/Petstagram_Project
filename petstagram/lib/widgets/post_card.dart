import 'package:flutter/material.dart';
import 'package:petstagram/utils/colors.dart';


class PostCard  extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(
        vertical: 10
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16
            ).copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage('https://mir-s3-cdn-cf.behance.net/project_modules/disp/2760ab96352685.5eac47879b914.jpg'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('username', style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ), ),),

                   IconButton(onPressed: () {

                    showDialog(
                      context: context,
                       builder: (context) => Dialog(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                            vertical : 16,
                          ),
                          shrinkWrap: true,
                          children: [
                            'Delete',
                          ].map(
                            (e) => InkWell(
                              onTap: () {},
                              child : Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                                  child: Text(e),
                              ),
                            ),
                          ).toList(),
                        ),
                       ));

                   }, icon: const  Icon(Icons.more_vert),
                   ) ,
              ],
            ),

            // Image Section
          ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.35,
              width : double.infinity,
              child : Image.network('https://www.tasteofthewildpetfood.com/wp-content/uploads/2023/03/dog-walking-outside-031523-1024x537.jpg',
              fit : BoxFit.cover,
              )
               ),

          // Like Comment Section

          Row(
            children: [
              IconButton(onPressed: () {},
               icon: const Icon(
                Icons.pets,
                color: Color.fromARGB(255, 209, 88, 128),
               ),
               ),

              IconButton(onPressed: () {},
               icon: const Icon(
                Icons.comment_outlined
               ),
               ),

             IconButton(onPressed: () {},
               icon: const Icon(
                Icons.send
               ),
               ),
            ],
          ),

          //Description and comments

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,      
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  '125 Likes',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top : 8,
                  ),

                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: primaryColor),
                      children: [
                        TextSpan(
                          text : 'Username',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
         
                        )
                      ]

                    )
                    ),
                ),
                InkWell(
                  onTap: () {},
                
                child : Container(
                  padding: const EdgeInsets.symmetric(vertical: 4) ,
                  child: Text('View all 50 comments', style: const TextStyle(
                    fontSize: 16,
                    color: secondaryColor
                  ),),
                )
                )
              ],
            ),
          )

        ],
      ),
      );
  }
}


