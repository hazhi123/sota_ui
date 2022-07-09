import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import 'text_widget.dart';

const String textConst = 'text';
const String dropdownConst = 'dropdown';
const String datetimeConst = 'datetime';

class FieldsFormSui extends StatelessWidget {
  final String name;
  final String type;
  final String? hint, label, text;
  final int? maxLength;
  final bool isPassword,
      isNumber,
      isEmail,
      isRequired,
      tBold,
      tWhite,
      hBold,
      isMulti,
      expands,
      lBold;
  final Widget? suffixIcon, prefixIcon;
  final Color color, tColor, hColor, lColor, canvasColor;
  final Color? iColor;
  final dynamic minLines, lSize, hSize, tSize, initialValue, items;
  final EdgeInsets? contentPadding;
  final DateFormat? format;
  final InputType? inputType;

  const FieldsFormSui({
    Key? key,
    required this.name,
    required this.type,
    this.items,
    this.text,
    this.tBold = false,
    this.tWhite = false,
    this.tSize = 14.0,
    this.tColor = Colors.black,
    this.hint,
    this.inputType,
    this.format,
    this.hBold = false,
    this.hColor = Colors.black,
    this.hSize = 14.0,
    this.label,
    this.lBold = false,
    this.lColor = Colors.black,
    this.iColor,
    this.lSize = 14.0,
    this.isPassword = false,
    this.isNumber = false,
    this.isEmail = false,
    this.isMulti = false,
    this.isRequired = false,
    this.expands = false,
    this.suffixIcon,
    this.prefixIcon,
    this.color = Colors.black,
    this.canvasColor = Colors.black,
    this.maxLength,
    this.contentPadding,
    this.minLines,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget field = FormBuilderTextField(name: 'field');

    switch (type) {
      case textConst:
        field = textfield(context);
        break;
      case dropdownConst:
        field = dropdownfield(context);
        break;
      case datetimeConst:
        field = datetimeField(context);
        break;
      default:
    }

    return field;
  }

  textfield(context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // canvasColor: canvasColor,
        disabledColor: color,
      ),
      child: FormBuilderTextField(
        name: name,
        obscureText: isPassword,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          iconColor: color,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          labelStyle: TextStyle(
            color: lColor,
            fontSize: lSize.toDouble(),
            fontWeight: lBold ? FontWeight.bold : FontWeight.normal,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: hColor,
            fontSize: hSize.toDouble(),
            fontWeight: hBold ? FontWeight.bold : FontWeight.normal,
          ),
          contentPadding: contentPadding,
        ),
        style: TextStyle(
          color: tWhite ? Colors.white : tColor,
          fontSize: tSize.toDouble(),
          fontWeight: tBold ? FontWeight.bold : FontWeight.normal,
        ),
        onChanged: (val) {},
        valueTransformer: (text) => num.tryParse(text!),
        validator: FormBuilderValidators.compose([
          if (isRequired) FormBuilderValidators.required(),
          if (isNumber) FormBuilderValidators.numeric(),
          if (isEmail) FormBuilderValidators.email(),
        ]),
        maxLength: maxLength,
        maxLines: isMulti ? null : 1,
        minLines: isMulti ? minLines ?? 4 : null,
        expands: expands,
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : isNumber
                ? TextInputType.number
                : isMulti
                    ? TextInputType.multiline
                    : TextInputType.text,
      ),
    );
  }

  dropdownfield(context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: canvasColor,
        disabledColor: color,
      ),
      child: FormBuilderDropdown(
        name: name,
        initialValue: initialValue,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          iconColor: Colors.white,
          prefixIcon: prefixIcon,
          hintText: hint,
          hintStyle: TextStyle(
            color: hColor,
            fontSize: hSize.toDouble(),
            fontWeight: hBold ? FontWeight.bold : FontWeight.normal,
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: lColor,
            fontSize: lSize.toDouble(),
            fontWeight: lBold ? FontWeight.bold : FontWeight.normal,
          ),
          contentPadding: contentPadding,
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: iColor ?? color,
          size: 30,
        ),
        isDense: true,
        hint: text == null
            ? null
            : TextSui(
                text!,
                size: tSize.toDouble(),
                color: tWhite ? Colors.white : tColor,
                bold: tBold,
              ),
        style: TextStyle(
          color: tColor,
          fontSize: tSize,
          fontWeight: tBold ? FontWeight.bold : FontWeight.normal,
        ),
        validator: FormBuilderValidators.compose([
          if (isRequired) FormBuilderValidators.required(),
        ]),
        items: items,
      ),
    );
  }

  datetimeField(context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // canvasColor: canvasColor,
        disabledColor: color,
      ),
      child: FormBuilderDateTimePicker(
        name: name,
        inputType: inputType ?? InputType.date,
        format: format ?? DateFormat('dd-MM-yyyy'),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          iconColor: color,
          prefixIcon: prefixIcon,
          labelText: label,
          labelStyle: TextStyle(
            color: lColor,
            fontSize: lSize.toDouble(),
            fontWeight: lBold ? FontWeight.bold : FontWeight.normal,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: hColor,
            fontSize: hSize.toDouble(),
            fontWeight: hBold ? FontWeight.bold : FontWeight.normal,
          ),
          contentPadding: contentPadding,
        ),
        style: TextStyle(
          color: tWhite ? Colors.white : tColor,
          fontSize: tSize.toDouble(),
          fontWeight: tBold ? FontWeight.bold : FontWeight.normal,
        ),
        initialValue: initialValue ?? DateTime.now(),
        validator: FormBuilderValidators.compose([
          if (isRequired) FormBuilderValidators.required(),
        ]),
      ),
    );
  }
}
