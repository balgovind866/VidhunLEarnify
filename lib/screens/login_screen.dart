


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_deshboard/constants.dart';

import '../widgets/primary_button.dart';
import '../widgets/text_input.dart';
import 'home_page.dart';

class LoginScrean extends StatefulWidget {
  const LoginScrean({Key? key}) : super(key: key);

  @override
  State<LoginScrean> createState() => _LoginScreanState();
}

class _LoginScreanState extends State<LoginScrean> {
  TextEditingController UserId=TextEditingController();
  TextEditingController PasswordEmail=TextEditingController();

  late SharedPreferences sharedPreferences;

 bool _passswordVisible=false;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _submitted=false;
  bool _isloading=false;

  Future<void> _login() async {
    String userid = UserId.text.trim();
    String password = PasswordEmail.text.trim();
    setState(() {
      _submitted = true;
      _isloading = true;
    });

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection("student")
          .where("id", isEqualTo: userid)
          .get();

      try {
        if (snap.docs.isNotEmpty && snap.docs[0]['password'] == password) {
          sharedPreferences!.setString('studentId', userid);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password is not correct!')),
          );
        }
      } catch (e) {
        String error = 'Error occurred!';
        print(e.toString());
        if (e is RangeError && e.toString().contains('Invalid value: Valid value range is empty: 0')) {
          error = 'Student ID does not exist';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      } finally {
        setState(() {
          _isloading = false;
        });
      }
    }
  }
  @override
  void dispose(){
    UserId.dispose();
    PasswordEmail.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passswordVisible=true;
    initSharedPreferences();

  }
  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          body: Form(
            key: _formKey,

            child: ListView(
              children: [
                Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.5 ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assert/images/splash.png',height: 150,width: 150,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hi',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w200,
                          fontSize: 36,
                        )),
                        Text('Student',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize:36 )),
                      ],
                    ),
                    Text('Sign in to continue',style: Theme.of(context).textTheme.subtitle2,),

                  ],
                ),
              ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height ,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(58),
                      topRight: Radius.circular(58),
                    ),


                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          TextFormField(
                            controller:UserId ,
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            decoration:  InputDecoration(
                              labelText: 'Moblie Number/Email',
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: TextStyle(fontSize: 15.0,color: Color(0xFF128ba3),height: 0.5),
            hintStyle: TextStyle(fontSize: 15,color: Color(0xFF128ba3),height: 0.5),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey
                                ),


                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,

                                )
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.2
                                )
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1.2
                                  )
                              ),

                            ),
                            validator: (value) =>
                            value!.isEmpty ? 'Email is required' : null,

                          ),

                          TextFormField(
                            controller: PasswordEmail,
                            obscureText: _passswordVisible,
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.start,
                            style:  TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            decoration:  InputDecoration(
                              suffixIcon: IconButton(



                               icon: Icon(
                                  _passswordVisible ?Icons.visibility_off_outlined:Icons.visibility_rounded
                              ), onPressed: () {
                                 setState(() {
                                   _passswordVisible=!_passswordVisible;
                                 });
                              },),
                              labelText: 'Password',
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelStyle: TextStyle(fontSize: 15.0,color: Color(0xFF128ba3),height: 0.5),
                              hintStyle: TextStyle(fontSize: 15,color: Color(0xFF128ba3),height: 0.5),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey
                                ),



                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,

                                  )
                              ),
                              errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1.2
                                  )
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1.2
                                  )
                              ),


                            ),
                            validator: (value) =>
                            value!.isEmpty ? 'Password is required' : null,

                          ),
                          SizedBox(height: 20,),
                          //TextInput(hintText: 'inter', controller: UserId,),
                          PrimaryButton(onTap: _login,

                           child:!_isloading? Text('SIGN IN',style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold
                          ) ,):SizedBox(
                             height: 15,
                             width: 15,
                             child: CircularProgressIndicator(
                               color: Colors.white,
                             ),),
                          width: MediaQuery.of(context).size.width,),
                          sizebox,
                          GestureDetector(
                            onTap: (){
                              print('hello');
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                                child: Text('Forget Password',textAlign: TextAlign.end,style: TextStyle(
                                  color: Color(0xFF128ba3),
                                  fontSize: 17,
                                ),)),
                          ),
                        ],
                      )
                    ),
                ),
            ]),
          ),
      ),
    );
  }
}
