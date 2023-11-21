
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:student_deshboard/constant/routes_constants.dart';
import 'package:student_deshboard/domain/entity/student_entites.dart';
import 'package:student_deshboard/screens/persantation/assignment/assignment_page.dart';
import 'package:student_deshboard/screens/persantation/dateSheet_screan/datesheet_page.dart';
import 'package:student_deshboard/screens/persantation/free_screan/free_pages.dart';
import 'package:student_deshboard/screens/persantation/teacher/bloc/teacher_cubit.dart';
import 'package:student_deshboard/screens/persantation/teacher/teacher_screan.dart';
import 'package:student_deshboard/screens/profile_page.dart';

import '../constants.dart';
import '../widgets/student_data.dart';
import 'blocStudent/student_bloc_cubit.dart';
import 'login_screen.dart';

class HomePage extends StatefulWidget {
 final String uid;
  const HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
FirebaseAuth auth=FirebaseAuth.instance;

  @override
  void initState() {
    print('hell hoem');
    print(widget.uid);
    BlocProvider.of<StudentBlocCubit>(context).getStudentProfile(widget.uid);
    BlocProvider.of<TeacherCubit>(context).getTeacher();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var Height=MediaQuery.of(context).size.height;
    var Weight=MediaQuery.of(context).size.width;
    return Scaffold(

      body: BlocBuilder<StudentBlocCubit,StudentBlocState>(
        builder: (BuildContext context, state) {
          if(state is StudentLoaded) {
            print(state.students.length.toString());
            final List<StudentEntity> studentData=state.students;
            String? fullName = studentData[0].fullName;
            String capitalizedFullName = fullName!.toLowerCase().split(' ').map((word) {
              if (word.isNotEmpty) {
                return word[0].toUpperCase() + word.substring(1);
              }
              return '';
            }).join(' ');
            return Column(
              children: [
                Container(
                  width: Weight,
                  height: Height / 2.6,
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StudentName(
                                studentName: '${capitalizedFullName}',
                              ),
                              kHalfSizedBox,
                              StudentClass(
                                  studentClass: 'Branch:-${studentData[0].course} | Roll no:-${studentData[0].rollNumber} '),
                              kHalfSizedBox,
                              StudentYear(studentYear: '2020-2021'),
                            ],
                          ),
                          kHalfSizedBox,
                          StudentPicture(
                              picAddress: '${studentData[0].profileImageUrl}',
                              onPress: () {

                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => MyProfileScreen(studentData: studentData,)));
                                // go to profile detail screen here
                                // Navigator.pushNamed(context, MyProfileScreen.routeName);}
                                // ),
                              }),
                        ],
                      ),
                      sizebox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StudentDataCard(
                            onPress: () {
                              //go to attendance screen
                            },
                            title: 'Attendance',
                            value: '90.02%',
                          ),
                          StudentDataCard(
                            onPress: () {
                              //go to fee due screen
                              // Navigator.pushNamed(context, FeeScreen.routeName);
                            },
                            title: 'Fees Due',
                            value: '600\$',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Container(
                      width: Weight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60),
                          topLeft: Radius.circular(60),


                        ),

                      ),
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: 20,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  HomeCard(
                                    onPress: () {
                                      print(widget.uid.toString());
                                    },
                                    icon: 'assert/icons/quiz.svg',
                                    title: 'Take Quiz',
                                  ),
                                  HomeCard(
                                    onPress: () {
                                      //go to assignment screen here
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AssignmentScreen()));

                                    },
                                    icon: 'assert/icons/assignment.svg',
                                    title: 'Assignments',
                                  ),


                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  HomeCard(
                                    onPress: () {

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FeeScreen()));
                                    },
                                    icon: 'assert/icons/holiday.svg',
                                    title: 'Holidays',
                                  ),
                                  HomeCard(
                                    onPress: () {},
                                    icon: 'assert/icons/timetable.svg',
                                    title: 'Time Table',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  HomeCard(
                                    onPress: () {},
                                    icon: 'assert/icons/result.svg',
                                    title: 'Result',
                                  ),
                                  HomeCard(
                                    onPress: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DateSheetScreen()));
                                    },
                                    icon: 'assert/icons/datesheet.svg',
                                    title: 'DateSheet',
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  HomeCard(
                                    onPress: () {},
                                    icon: 'assert/icons/ask.svg',
                                    title: 'Ask',
                                  ),
                                  HomeCard(
                                    onPress: () {},
                                    icon: 'assert/icons/gallery.svg',
                                    title: 'Gallery',
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  HomeCard(
                                    onPress: () {},
                                    icon: 'assert/icons/resume.svg',
                                    title: 'Leave\nApplication',
                                  ),
                                  HomeCard(
                                    onPress: () {

                                    },
                                    icon: 'assert/icons/lock.svg',
                                    title: 'Change\nPassword',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  HomeCard(
                                    onPress: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherScrean()));
                                    },
                                    icon: 'assert/icons/event.svg',
                                    title: 'Events',
                                  ),
                                  HomeCard(
                                    onPress: () async {
                                      SharedPreferences prefs = await SharedPreferences
                                          .getInstance();
                                      prefs.clear();
                                      Navigator.pop(context);
                                    },
                                    icon: 'assert/icons/logout.svg',
                                    title: 'Logout',
                                  ),
                                ],
                              ),
                            ],
                          )),


                    ),
                  ),
                ),
              ],
            );

          }else{
            return Center(
              child: Text('Not student record Found Please Contect me'),

            );
          }

      },),


    );
  }
}
class HomeCard extends StatelessWidget {
  const HomeCard({Key? key,
    required this.onPress,
    required this.icon,
    required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 40.w,
        height: 15.h,
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: SizerUtil.deviceType == DeviceType.tablet ? 25.sp : 35.sp,
              width: SizerUtil.deviceType == DeviceType.tablet ? 25.sp : 35.sp,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool userAvailable = false;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      String? studentId = sharedPreferences.getString('studentId');
      if (studentId != null && studentId.isNotEmpty) {
        setState(() {
          userAvailable = true;
        });
      } else {
        setState(() {
          userAvailable = false;
        });
      }
    } catch (e) {
      // Handle exceptions if necessary, for example, log the error
      print('Error fetching user data: $e');
      setState(() {
        userAvailable = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return userAvailable ?  LoginScrean():HomePage() ;
  }
}*/
