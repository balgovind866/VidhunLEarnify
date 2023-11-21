import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loadingIndicatorProgressBar({String? data}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          backgroundColor: Colors.orange,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          data==null?"Setting up your account please wait..":data,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}