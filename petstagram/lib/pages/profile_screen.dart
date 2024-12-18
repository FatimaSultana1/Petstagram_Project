import 'package:flutter/material.dart';
import 'package:petstagram/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Example data (replace with your actual data)
  int postLen = 20;
  int followers = 20;
  int following = 20;
  String username = 'username';
  String bio = 'This is the user bio.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text(username),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // The row containing the avatar and an expanded column
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      backgroundImage: const NetworkImage(
                        'https://mir-s3-cdn-cf.behance.net/project_modules/disp/6844e096352685.5eac4787a92c1.jpg',
                      ),
                      radius: 40,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          // Row for stats
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildStatColumn(postLen, "posts"),
                              buildStatColumn(followers, "followers"),
                              buildStatColumn(following, "following"),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Row for buttons (optional)
                          // For now, you can leave it empty or add a Follow/Sign Out button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Sign Out'),
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // User info
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(bio),
                ),
                const SizedBox(height: 16),
                const Divider(),
                // You can add a future builder or grid of posts below, similar to the reference snippet
                // For example, if you later want to add posts:
                // FutureBuilder(
                //   future: FirebaseFirestore.instance.collection('posts').where('uid', isEqualTo: YOUR_USER_ID).get(),
                //   builder: (context, snapshot) {
                //     if (!snapshot.hasData) {
                //       return const Center(child: CircularProgressIndicator());
                //     }
                //     // GridView.builder for posts here
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
