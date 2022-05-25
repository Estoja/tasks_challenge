import 'package:bds_mobile/atoms/atoms.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  TimeOfDay? simpleTime;

  TimePicker({
      Key? key,
      required this.simpleTime
    }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BcInput(
        prefixIcon: BcFunctionalIcons.TIME,
        type: BcInputType.IconLeft,
        onTapSuffix: _openTimePicker,
        onTap: _openTimePicker,
        hintText: 'HH:MM am',
        labelText: 'Seleccione la hora',
        helpText: 'Selecciona una hora',
        readOnly: true,
        focusNode: FocusNode(),
        controller: TextEditingController(
          text: widget.simpleTime == null
              ? ''
              : widget.simpleTime!.format(context),
        ),
      );

  void _openTimePicker() async {
    TimeOfDay time = const TimeOfDay(hour: 7, minute: 15);
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (newTime != null) {
      setState(() {
        widget.simpleTime = newTime;
      });
    }
  }
}
