import 'package:common/common.dart';
import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  DateTime convert(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

extension TimeExtension on TimeOfDay {
  DateTime convert(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, hour, minute);
  }
}

extension ContextExtension on BuildContext {
  Future<DateTime?> showAppDatePicker({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    return showDatePicker(
      context: this,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2100),
    );
  }

  Future<TimeOfDay?> showAppTimePicker({TimeOfDay? initialTime}) {
    return showTimePicker(
      context: this,
      initialTime:
          initialTime ??
          TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
    );
  }
}

extension DateTimeCalculatin on int {
  String convertTimeToReadableDuration() {
    Logcat.log('convertTimeToReadableDuration: $this');
    final d = Duration(minutes: this);

    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);

    return '$hours hr $minutes min';
  }
}
