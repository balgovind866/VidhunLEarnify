
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_deshboard/constant/routes_constants.dart';

import '../login_screen.dart';

class FlexScreen extends StatefulWidget {
  const FlexScreen({Key? key}) : super(key: key);

  @override
  State<FlexScreen> createState() => _FlexScreenState();
}

class _FlexScreenState extends State<FlexScreen> {
  @override
  Widget build(BuildContext context) {
Future.delayed(Duration(seconds: 5),(){
  Navigator.of(context).pushReplacementNamed(RouteList.Auth);
});
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Row(
         children: [

           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('School',style: Theme.of(context).textTheme.bodyText1,),
               Text('Brain',style: Theme.of(context).textTheme.bodyText1,),

             ],
           ),
           Container(
             height: 150,
               child: Image.asset('assert/images/splash.png')),

         ],
       ),
     ),
    );
  }
}
