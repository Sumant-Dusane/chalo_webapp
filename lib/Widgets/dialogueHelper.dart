import 'package:flutter/material.dart';
import 'deleteConfirmation.dart';

class DialogueHelper{
  static exit(context) => showDialog(context: context, builder: (context) => ConfirmDeleteRoute());
}