import 'package:flutter/material.dart';

wpSui(BuildContext context, {int? size}) {
  if (size == null) return MediaQuery.of(context).size.width;
  return MediaQuery.of(context).size.width / 100 * size;
}

hpSui(BuildContext context, {int? size}) {
  if (size == null) return MediaQuery.of(context).size.height;
  return MediaQuery.of(context).size.height / 100 * size;
}

spSui(BuildContext context, {int? size}) {
  if (size == null) return MediaQuery.of(context).size;
  return MediaQuery.of(context).size.height / 100 * size;
}

orSui(BuildContext context) {
  return MediaQuery.of(context).orientation;
}
