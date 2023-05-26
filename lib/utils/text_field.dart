import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vesti_exercise/utils/constants.dart';
import 'package:vesti_exercise/utils/sized_box.dart';

class TextInputNoIcon extends StatelessWidget {
  const TextInputNoIcon(
      {super.key,
      this.text,
      this.onSaved,
      this.onChanged,
      this.inputType,
      this.controller,
      this.inputFormatters,
      this.validator,
      this.textCapitalize,
      this.maxLine,
      this.obscure = false,
      this.hintText,
      this.focusNode,
      this.onTap,
      this.fillColor,
      this.onEditingComplete,
      this.outlinedBorder = false,
      this.extraText = false,
      this.extraTextString});

  final String? text, hintText, extraTextString;
  final bool obscure, outlinedBorder, extraText;
  final int? maxLine;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalize;
  final FocusNode? focusNode;
  final VoidCallback? onTap, onEditingComplete;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: TextFormField(
        keyboardType: inputType,
        style: textTheme.bodySmall!.copyWith(color: kPrimaryBlack),
        obscuringCharacter: "*",
        cursorColor: mediumGreen,
        focusNode: focusNode,
        textCapitalization: textCapitalize ?? TextCapitalization.words,
        obscureText: obscure,
        onSaved: onSaved,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        maxLines: maxLine ?? 1,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: mediumGreen, fontSize: 10),
          labelStyle: TextStyle(color: kPrimaryGrey, fontSize: 10),
          labelText:text ,
          isDense: true,
          filled: extraText ? false : true,
          hintText: hintText,
          hintStyle: textTheme.titleMedium,
          fillColor:fillColor,
          border: OutlineInputBorder(),
          errorMaxLines: 1,
          errorStyle: textTheme.titleSmall!.copyWith(
              color: Colors.red, fontSize: 10, fontWeight: FontWeight.w300),
          enabledBorder: OutlineInputBorder(
            borderSide: outlinedBorder
                ? BorderSide(color: mediumGreen,width: 0.5)
                : BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(kPadding),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: outlinedBorder
                ? BorderSide(color: mediumGreen,width: 0.5)
                : BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(kPadding),
          ),
          errorBorder: OutlineInputBorder(
              borderSide: outlinedBorder
                  ? BorderSide(color: Colors.red)
                  : BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(kSmallPadding)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: outlinedBorder
                  ? BorderSide(color: Colors.red)
                  : BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(kSmallPadding)),
        ),
        onTap: onTap,
      ),
    );
  }
}
