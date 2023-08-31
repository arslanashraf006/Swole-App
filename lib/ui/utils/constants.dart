import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
class AppConstants{
  static  File? image;
  static  ImagePicker picker = ImagePicker();
  static DateTime? date;
  static bool checkMailStatus=false;
  static bool checkStatus=false;
  static TextEditingController mailController = TextEditingController();
  //static TextEditingController dobController=TextEditingController();
}