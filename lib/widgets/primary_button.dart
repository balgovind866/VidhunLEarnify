import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.onTap,
      required this.child,
      this.width = double.infinity})
      : super(key: key);

  final GestureTapCallback onTap;
  final Widget child;
  final double width;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width, 50),
          backgroundColor: Color(0xFF128ba3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 12,
          shadowColor: Colors.black),
      onPressed: onTap,
      child: child
    );

    /*Container(
      width: width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 33, 150, 243),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(padding: const EdgeInsets.all(16), child: child),
        ),
      ),
    );*/
  }
}
