
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:student_deshboard/constant/routes_constants.dart';
import 'package:student_deshboard/screens/profile_page.dart';

import '../constants.dart';
import '../widgets/student_data.dart';
import 'login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var Height=MediaQuery.of(context).size.height;
    var Weight=MediaQuery.of(context).size.width;
    return Scaffold(

      body: Column(
        children: [
          Container(
            width: Weight,
            height: Height/2.6,
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(
                          studentName: 'Aisha',
                        ),
                        kHalfSizedBox,
                        StudentClass(
                            studentClass: 'Class X-II A | Roll no: 12'),
                        kHalfSizedBox,
                        StudentYear(studentYear: '2020-2021'),
                      ],
                    ),
                    kHalfSizedBox,
                    StudentPicture(
                        picAddress: 'assert/images/student_profile.jpeg',
                        onPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileScreen()));
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
                  child:SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child:Column(
                    children: [
                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {},
                            icon: 'assert/icons/quiz.svg',
                            title: 'Take Quiz',
                          ),
                          HomeCard(
                            onPress: () {
                              //go to assignment screen here

                            },
                            icon: 'assert/icons/assignment.svg',
                            title: 'Assignments',
                          ),


                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {},
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {},
                            icon: 'assert/icons/result.svg',
                            title: 'Result',
                          ),
                          HomeCard(
                            onPress: () {
                            },
                            icon: 'assert/icons/datesheet.svg',
                            title: 'DateSheet',
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          HomeCard(
                            onPress: () {
                              Navigator.of(context).pushReplacementNamed(RouteList.teacher);
                            },
                            icon: 'assert/icons/event.svg',
                            title: 'Events',
                          ),
                          HomeCard(
                            onPress: () {},
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
      ),

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
        height: 18.h,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: SizerUtil.deviceType == DeviceType.tablet ? 40.sp : 50.sp,
              width: SizerUtil.deviceType == DeviceType.tablet ? 40.sp : 50.sp,
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class AuthCheck extends StatefulWidget {
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
    return userAvailable ? HomePage() : LoginScrean();
  }
}
