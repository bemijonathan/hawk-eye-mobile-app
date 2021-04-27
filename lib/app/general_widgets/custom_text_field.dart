import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextInputForm extends StatelessWidget {
  const CustomTextInputForm({
    Key key,
    this.keyboardType,
    this.obscureText,
    // this.obscuringCharacter,
    this.controller,
    this.onSubmitted,
    this.focusNode,
    this.onChanged,
    this.inputTitle,
    this.hintText,
    this.onTap,
    this.enable = true,
    this.validate = false,
    this.errorText = 'TextField should not be empty',
  }) : super(key: key);

  final TextInputType keyboardType;
  final bool obscureText;
  // final String obscuringCharacter;
  final TextEditingController controller;
  final Function(String value) onSubmitted;
  final FocusNode focusNode;
  final Function(String value) onChanged;
  final String inputTitle;
  final String hintText;
  final Function onTap;
  final bool validate;
  final bool enable;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 18.h,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                inputTitle == null ? '' : inputTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xff7A809B),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Container(
            // height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff3F3F4419),
                    blurRadius: 1,
                  )
                ],
                color: Colors.white),
            child: new TextField(
              cursorHeight: 20.h,
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff170F3D),
                fontWeight: FontWeight.w500,
              ),
              enabled: enable,
              textCapitalization: TextCapitalization.sentences,

              decoration: new InputDecoration(
                errorText: validate ? errorText : null,

                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.w, color: Color(0xff4F25FF)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.w, color: Color(0xffDEDEDF)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1.w,
                    color: Color(0xffDEDEDF),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Color(0xffD60000))),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(width: 1, color: Color(0xffD60000))),
                hintText: hintText == null ? '' : hintText,
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff646A86).withOpacity(.35),
                ),

                // helperText: 'Keep it short, this is just a demo.'
                // labelText: 'Life story',
                //       prefixIcon: const Icon(
                //         Icons.person,
                //         color: Colors.green,
                //       ),
                //       prefixText: ' ',
                //       suffixText: 'USD',
                //       suffixStyle: const TextStyle(color: Colors.green),
              ),
              keyboardType: keyboardType,
              obscureText: obscureText == null ? false : obscureText,
              // obscuringCharacter: obscuringCharacter,
              controller: controller,
              onTap: onTap,
              onSubmitted: onSubmitted,
              focusNode: focusNode,

              onChanged: onChanged,
              cursorColor: Color(0xff4F25FF),
            ),
          ),
        ],
      ),
    );
  }
}
