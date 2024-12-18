import 'package:flutter/material.dart';
import 'package:petstagram/pages/add_post_page.dart';
import 'package:petstagram/pages/feed_page.dart';
import 'package:petstagram/pages/search_page.dart';
import 'package:petstagram/pages/profile_screen.dart';


const webScreenSize = 600;


const homeScreenItems = [
          FeedPage(),
          SearchPage(),
          // Text('Search'),
          AddPostPage(),
          Text('notify'),
          ProfileScreen(),

];