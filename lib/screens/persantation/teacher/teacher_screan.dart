
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherScrean extends StatefulWidget {
  const TeacherScrean({Key? key}) : super(key: key);

  @override
  State<TeacherScrean> createState() => _TeacherScreanState();
}

class _TeacherScreanState extends State<TeacherScrean> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(body: Container(
      width: size.width,
      height: size.height,
      color: Colors.grey.shade300,

      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('teachers').snapshots(),
        builder: (cotext, snapshot) {
          if (!snapshot.hasData) {


            return CircularProgressIndicator();
          }

          return GestureDetector(


            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,

              itemBuilder: (context, index) {
                print(snapshot.data!.docs.length.toString());
                DocumentSnapshot routineSnapshot = snapshot.data!.docs[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),


                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: GestureDetector(

                        onTap: () {
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [


                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(routineSnapshot['teacherName'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                SizedBox(height: 10,),

                              ],
                            ),
                            SizedBox(width: 20,),

                            IconButton(
                              icon: Icon(Icons.delete,size: 30,),
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('daily_routines')
                                    .doc(routineSnapshot.id)
                                    .delete();
                              },
                            ),
                          ],
                        )

                      /*ListTile(

                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                              color: Colors.green,
                              width: 2.0,
                              ),
                                  ),
                                title: Text(routineSnapshot['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                                subtitle: Row(
                                  children: [
                                    Icon(Icons.access_time_filled),
                                    SizedBox(width: 3,),
                                    Text('$timeString-$timeStringEnd'),
                                  ],
                                ),

                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('daily_routines')
                                            .doc(routineSnapshot.id)
                                            .delete();
                                      },
                                    ),
                                  ],
                                ),
                              ),*/
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    ),);
  }
}
