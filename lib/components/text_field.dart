// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:property_managment/components/color.dart';
class CustomTextField extends StatefulWidget {
  final String hintText;
  final hintStyle;
  final bool? readOnly;
  final bool? enabled;
  final String? errorText;
  final focusNode;
  final bool isObscure;
  final height;
  final bool isIcon;
  final TextEditingController? textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final Color cursorColor;
  final Color borderColor;
  final Color focusedColor;
  final Color? textcolor;
  final Color inputFilledColrValue;
  final double borderRadius;
  final ValueChanged? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged? onChanged;
  final VoidCallbackonTap;
  final bool autoFocus;
  final  validator;
  final contentPadding;
  final keyboardType;
  final maxLine;
  final obscureText;
  final suffixIcon;
  final decoration;
  final prefixIcon;
  final avtive;
  
  final onTap;
  const CustomTextField(
    {this.avtive='',
      this.hintText ='',
     this.errorText,
      this.isObscure = false,
      this.enabled ,
      this.readOnly,
      this.textController,
      this.height,
      final InputDecoration,
      this.onTap,
      this.focusNode,
      this.isIcon = true,
      this.padding = const EdgeInsets.only(left:0),
      this.hintColor = PRIMARY_COLOR,
      this.iconColor = basicBlackColor  ,
      this.onFieldSubmitted,
      this.onChanged,
      this.autoFocus = false,
      this.validator,
      this.onSaved,
      this.hintStyle,
      this.contentPadding,
      this.obscureText,
      this.keyboardType,
      this.maxLine,
      
      this.suffixIcon,
      this.prefixIcon,
      this.textcolor,
      this.cursorColor = FIELD_BORDER_COLOR, 
      this.borderColor = FIELD_BORDER_COLOR,
      this.focusedColor = FIELD_BORDER_COLOR,
      this.inputFilledColrValue = blueShade,
      this.borderRadius = 0.1, this.VoidCallbackonTap, this.decoration, 


    }
  );
  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: widget.padding,
          child: TextFormField(
            
           
             
            cursorColor: widget.cursorColor,
            // readOnly: widget.readOnly,
            enabled: widget.enabled,
            // obscureText: widget.obscureText,
            maxLines: widget.maxLine,
            keyboardType: widget.keyboardType, 
            style:TextStyle(
              color: PRIMARY_COLOR,
            ),     
            controller: widget.textController,
            onFieldSubmitted: widget.onFieldSubmitted,
            onChanged: widget.onChanged,
            validator: widget.validator,
            onTap: widget.onTap,
            onSaved: widget.onSaved,
            decoration: InputDecoration(
            
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                borderSide: BorderSide(color: Colors.red, width: 0.1),
              ),
              // focusColor:widget.borderColor ,
              focusedBorder:  OutlineInputBorder(
              
               borderRadius: BorderRadius.all(Radius.circular(9.0)),
                borderSide: BorderSide(color:FIELD_BORDER_COLOR, width: 1.0),
              ),
              
              enabledBorder: OutlineInputBorder(
                
                borderRadius: BorderRadius.all(Radius.circular(9.0)),
                borderSide: BorderSide(width: 1, color: FIELD_BORDER_COLOR),
              ),
              contentPadding: widget.contentPadding,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              fillColor:WHITE_COLOR,
              filled: true, 
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
            ),
          )
        )
      ],
    );
  }
}