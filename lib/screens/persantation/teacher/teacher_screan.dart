
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';

import '../../../constants.dart';
import '../../../domain/entity/teacher_entities.dart';
import 'bloc/teacher_cubit.dart';
import 'bloc/teacher_state.dart';

class TeacherScrean extends StatefulWidget {
  const TeacherScrean({Key? key}) : super(key: key);

  @override
  State<TeacherScrean> createState() => _TeacherScreanState();
}

class _TeacherScreanState extends State<TeacherScrean> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pop();
        return true;
      },

      child: SafeArea(
        child: Scaffold(appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('Owr Facality'),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();

          }, icon: Icon(Icons.arrow_back),),
        ),

          body: Container(
          width: size.width,
          height: size.height,
          color: Colors.grey.shade300,

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<TeacherCubit, TeacherState>(
              builder: (context, state) {
                if (state is TeacherLoaded) {

                  return Container(
                    width: size.width,
                    height: size.height,


                    child: GridView.builder(
                      itemCount: state.teachers.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                      ),
                      itemBuilder: (context, index) {
                        final List<TeacherEntity> teacherData = state.teachers;





                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(8),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                    radius: 70,
                                    child: ImageNetwork(
                                      image: teacherData[index].teacherImage.toString() ,
                                      height: 150,
                                      width: 150,
                                      duration: 1500,
                                      curve: Curves.easeIn,
                                      onPointer: true,
                                      debugPrint: false,
                                      fullScreen: false,
                                      fitAndroidIos: BoxFit.cover,
                                      fitWeb: BoxFitWeb.cover,
                                      borderRadius: BorderRadius.circular(70),
                                      onLoading: const CircularProgressIndicator(
                                        color: Colors.indigoAccent,
                                      ),
                                      onError: const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        debugPrint("©gabriel_patrick_souza");
                                      },
                                    )
                                  /*Image.network(
                                          teacherData[index].teacherImage.toString(),
                                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  value: loadingProgress.expectedTotalBytes != null
                                                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                                      : null,
                                                ),
                                              );
                                            }
                                          },
                                          errorBuilder: (context, error, stackTrace) {
                                            return Text('Error loading image');
                                          },
                                        ),*/
                                ),

                                SizedBox(height: 12),
                                Text(
                                  'Teacher Name :- ${teacherData[index].teacherName}',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Subject: Mathematics',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Experience: 5 years',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Qualification: M.Sc in Mathematics',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ) ;
                } else if (state is TeacherLoading) {
                  // Loading indicator while data is being fetched
                  return CircularProgressIndicator();
                } else if (state is TeacherFailure) {
                  // Handle error state if necessary
                  return Text('Failed to load teacher data');
                } else {
                  // Handle other states if needed
                  return Center(
                    child: Text('Unknown state'),
                  );
                }
              },
            ),
          ),
        ),),
      ),
    );
  }
}
