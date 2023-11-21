
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_deshboard/constant/routes_constants.dart';

import '../blocStudent/auth/auth_cubit.dart';
import '../blocStudent/auth/auth_state.dart';
import '../home_page.dart';
import '../login_screen.dart';

class FlexScreen extends StatefulWidget {
  const FlexScreen({Key? key}) : super(key: key);

  @override
  State<FlexScreen> createState() => _FlexScreenState();
}

class _FlexScreenState extends State<FlexScreen> {


  @override
  void initState() {
  BlocProvider.of<AuthCubit>(context).loggedIn();
  getuid();
    // TODO: implement initState
    super.initState();
  }
void getuid(){


}

  @override
  Widget build(BuildContext context) {


    return Scaffold(
     body: BlocBuilder<AuthCubit, AuthState>(
       builder: (context, authState) {

        Future.delayed(Duration(seconds: 5), () {
          if (authState is Authenticated && authState.uid != null) {
            // User is authenticated, navigate to the home page
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage(uid: authState.uid)),
            );
          } else {
            // User is not authenticated, show the login screen
            Navigator.of(context).pushReplacementNamed(RouteList.LoginScrean);
          }
        });

           return Padding(
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
           );


         }



     ),

    );
  }
}
