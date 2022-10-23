
import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String message,
}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}
