import 'package:flutter/material.dart';
import 'package:petstagram/providers/user_provider.dart';
import 'package:petstagram/utils/global_vars.dart';
import 'package:provider/provider.dart';


class ResponsiveLayout extends StatefulWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout({
    super.key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  });//: super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return widget.webScreenLayout;
      }
      return widget.mobileScreenLayout;
    });
  }
}
// class ResponsiveLayout extends StatelessWidget {
//   final Widget webScreenLayout;
//   final Widget mobileScreenLayout;
  
//   const ResponsiveLayout ({
//     Key? key,
//     required this.webScreenLayout,
//     required this.mobileScreenLayout,

//   }  ) : super(key: key);
  
  
//   @override
//     Widget build(BuildContext context) {
//       return LayoutBuilder(
//         builder: (context, constraints){
//         if(constraints.maxWidth > webScreenSize){
//             return webScreenLayout;
//         }
//         return mobileScreenLayout;
//       },
//     );
//   }
// }