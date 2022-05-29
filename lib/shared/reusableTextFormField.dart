import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_show_app/shared/appColors.dart';
import 'package:flutter_show_app/shared/appTextStyles.dart';
import 'package:flutter_show_app/shared/sizeConfig.dart';

///text form fields for sign up, sign in, resetPassword can be used in whole app
class ReusableTextFormField extends StatefulWidget {
  final String hintTextFormField;
  final TextInputType textInputType;
  final bool isObscureText;
  final GlobalKey<FormFieldState> formFieldKey;
  //final String validator;
  final FocusNode focusNode;
  final dynamic validatorFunction;
  final TextEditingController textController;
  final TextCapitalization textCapitalization;
  final bool formatter;

  ReusableTextFormField(
    this.hintTextFormField,
    this.textInputType,
    this.formFieldKey, //this.validator,
    this.focusNode,
    this.validatorFunction,
    this.textController,
    this.textCapitalization, {
    this.isObscureText = false,
    this.formatter = false,
  });

  @override
  _ReusableTextFormFieldState createState() =>
      _ReusableTextFormFieldState();
}

class _ReusableTextFormFieldState extends State<ReusableTextFormField> {
  bool passwordVisible = true;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      obscureText: widget.isObscureText ? passwordVisible : false,
      validator: widget.validatorFunction,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.textInputType,
      inputFormatters: !widget.formatter
          ? null
          : [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9s_.@]')),
            ],
      focusNode: widget.focusNode,
      key: widget.formFieldKey,
      // onChanged: (value) => widget.formFieldKey.currentState.validate(),
      decoration: InputDecoration(
        //labelText: widget.hintTextFormField,
        hintText: widget.hintTextFormField,
        labelStyle: AppTextStyles.newStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
        contentPadding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.black54),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Color.fromRGBO(184, 162, 162, 1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.black54),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: AppColors.mainGreenColor),
        ),
        suffixIcon: widget.isObscureText
            ? IconButton(
                onPressed: () {
                  if (passwordVisible) {
                    setState(() {
                      passwordVisible = false;
                    });
                  } else {
                    setState(() {
                      passwordVisible = true;
                    });
                  }
                },
                icon: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                ),
              )
            : null,
      ),
    );
  }
}
