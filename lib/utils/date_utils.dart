import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:intl/intl.dart';

const String minDatetime = '1900-00-00 00:00:00';
const String maxDatetime = '2101-00-00 00:00:00';
const String format = 'yyyy-MM-dd HH:mm:ss';
const String monthAndDayFormat = 'MM-dd';
const String hourFormat = 'HH:mm:ss';
const String timeFormat = 'HH:mm:ss';

Future<void> showDateTimePicker(
  BuildContext context,
  bool isDarkMode,
  Null Function(dynamic picked) onPick, {
  DateTimePickerMode pickerMode = DateTimePickerMode.datetime,
}) async {
  const defaultTheme = DateTimePickerTheme.Default;
  var colorScheme = Theme.of(context).colorScheme;

  final darkPickerTheme = DateTimePickerTheme(
    showTitle: true,
    cancelTextStyle: defaultTheme.cancelTextStyle?.copyWith(
      color: colorScheme.surface,
    ),
    itemTextStyle: defaultTheme.itemTextStyle.copyWith(
      color: colorScheme.surface,
    ),
    backgroundColor: colorScheme.background,
  );

  DatePicker.showDatePicker(
    context,
    minDateTime: DateTime.parse(minDatetime),
    maxDateTime: DateTime.parse(maxDatetime),
    initialDateTime: DateTime.now(),
    dateFormat: format,
    locale: DateTimePickerLocale.zh_cn,
    pickerTheme: isDarkMode ? darkPickerTheme : defaultTheme,
    pickerMode: pickerMode,
    onConfirm: (dateTime, List<int> index) {
      onPick(dateTime);
    },
  );
}

String _format(DateTime dateTime, String dateFormat) {
  var formatter = DateFormat(dateFormat);
  return formatter.format(dateTime);
}

String formatDateTime(DateTime dateTime) {
  return _format(dateTime, format);
}

String formatMonthAndDay(String dateTimeString) {
  var dateTime = DateTime.parse(dateTimeString);
  return _format(dateTime, monthAndDayFormat);
}

bool isToday(String dateTimeString) {
  var now = DateTime.now();
  var date = DateTime.parse(dateTimeString);
  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}

bool isNow(String dateTimeString) {
  var now = DateTime.now();
  var date = DateTime.parse(dateTimeString);
  return isToday(dateTimeString) && now.hour == date.hour;
}

String formatDateTimeFromMilliseconds(int? timestamp) {
  var dateTime = timestamp == null
      ? DateTime.now()
      : DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();
  return formatDateTime(dateTime);
}

String formatDateHourFromMilliseconds(int timestamp) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();
  var formatter = DateFormat(hourFormat);
  return formatter.format(dateTime);
}

String formatDateWith(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  return "${dateTime.year}${formatNumber(dateTime.month)}${formatNumber(dateTime.day)}";
}

String formatTime(int year, int month, int day, DateTime dateTime) {
  var formatter = DateFormat(timeFormat);
  return '$year-${formatNumber(month)}-${formatNumber(day)} ${formatter.format(dateTime)}';
}

String formatDateByYMD(int year, int month, int day) {
  return "$year${formatNumber(month)}${formatNumber(day)}";
}

String formatNumber(int number) {
  return number.toString().padLeft(2, '0');
}

int getTimestamp(DateTime dateTime) {
  return dateTime.toUtc().millisecondsSinceEpoch;
}

int getHour(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
  return dateTime.hour;
}
