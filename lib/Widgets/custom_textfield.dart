import 'package:chatapp/Widgets/Constants.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  CustomFormTextField({super.key, this.hintText, this.onChanged});
  String? hintText;
  Function(String)? onChanged;
  TextEditingController controller = TextEditingController();
  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  bool passwordVisible=false;
  final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  final phoneRegExp = new RegExp(r"^\+?0[0-9]{10}$");
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  void initState(){
    super.initState();
    passwordVisible = true;
  }
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator:  (data) {
        if(data!.isEmpty){
          return "Field is required";
        }
        if(widget.hintText == 'Name'){
          if(data.length < 5 || !nameRegExp.hasMatch(data) != true){
            return "Invalid Name,The Name must be above 5 character";
          }
        }
        if(widget.hintText == 'Phone'){
          if(data.length != 11 || phoneRegExp.hasMatch(data) != true){
            return "Invalid PhoneNumber,The length must be 11 number";
          }
        }
        if(widget.hintText == 'Email'){
          if(emailRegExp.hasMatch(data) != true){
            return "Invalid Email address,The email must have @email_address.com";
          }
        }
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor,width: 2)
          ),
          enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor)
          ),
          border:  OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor)),
          label: Text(
            widget.hintText!,
            style: const TextStyle(color: kPrimaryColor, fontFamily: 'Roboto'),
          ),
          // helperText: widget.helperText,
          prefixIcon: widget.hintText == 'Email'
              ? Icon(Icons.email_outlined)
              : widget.hintText == 'Password'
                  ? Icon(Icons.lock_outline_rounded)
                  : widget.hintText == 'Name'
                      ? Icon(Icons.person_outline_rounded)
                      : Icon(Icons.phone),
          prefixIconColor: kPrimaryColor,

          suffixIcon: widget.hintText == 'Password'?IconButton(onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },icon: Icon(passwordVisible==false?Icons.visibility_off:Icons.visibility),):null,
          suffixIconColor: widget.hintText == 'Password'?kPrimaryColor:null,
          ),
      obscureText: widget.hintText != 'Password'?passwordVisible=false:passwordVisible,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      style: const TextStyle(color: kPrimaryColor),
      cursorColor: kPrimaryColor,
    );
  }
}
