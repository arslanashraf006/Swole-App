import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_strings.dart';
import '../../../utils/constants.dart';
import '../../../widgets/date_button_widget.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return DateButtonWidget(
      title: getText()!,
      icon: Icons.calendar_today,
      onClicked: () => pickDate(context),
    );
  }
  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: AppConstants.date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: initialDate,);
    if (newDate == null) return;
    setState(() {
    AppConstants.date = newDate;
     });
    // if (newDate != null) {
    //   AppConstants.date = newDate;
    //   AppConstants.dobController
    //     ..text = DateFormat.yMMMd().format(AppConstants.date!)
    //     ..selection = TextSelection.fromPosition(TextPosition(
    //    offset: AppConstants.dobController.text.length,
    //      affinity: TextAffinity.upstream));
    // }
  }
  String? getText() {
    if (AppConstants.date == null) {
      return AppStrings.textFieldDOBText;
    } else {
      return DateFormat(AppStrings.dateFormatText).format(AppConstants.date!);
    }
  }
}
