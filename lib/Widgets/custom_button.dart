import 'package:chatapp/Widgets/Constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.onTap,
    required this.title
  });
  VoidCallback? onTap;

  String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        // onHover: (value) {
        //   return ;
        // },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: kPrimaryColor,
        ),
        child: Text(
          title,
          style:const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Roboto'
          ),
        ),
      ),
    );
  }
}
