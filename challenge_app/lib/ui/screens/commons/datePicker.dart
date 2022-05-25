import 'package:bds_mobile/atoms/atoms.dart';
import 'package:bds_mobile/foundations/foundations.dart';
import 'package:bds_mobile/organisms/organisms.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  DateTime? simpleDate;

  DatePicker({
      Key? key,
      required this.simpleDate
    }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BcInput(
        prefixIcon: BcFunctionalIcons.MONTH,
        type: BcInputType.IconLeft,
        onTapSuffix: _openDatePickerSimple,
        onTap: _openDatePickerSimple,
        hintText: 'DD/MM/AA',
        labelText: 'Selector de fechas',
        helpText: 'Selecciona una fecha',
        readOnly: true,
        focusNode: FocusNode(),
        controller: TextEditingController(
          text: widget.simpleDate == null
              ? ''
              : widget.simpleDate!.toIso8601String().substring(0, 10),
        ),
      );

  void _openDatePickerSimple() {
    BcDatePickerSimple.open(
      context,
      _dateSelected,
      currentDate: widget.simpleDate,
      minDate: DateTime(2020, 8, 10),
      maxDate: DateTime(2021, 5, 14),
    );
  }

  void _dateSelected(DateTime? date) {
    setState(() {
      widget.simpleDate = date;
    });
  }
}
