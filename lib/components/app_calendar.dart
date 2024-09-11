import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Auth/login_options_screen.dart';

import '../controllers/book_session_controller.dart';

class AppCalendar extends StatelessWidget {
  AppCalendar({
    super.key,
  });

  final BookSessionController controller = Get.put(BookSessionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => TableCalendar(
          availableGestures: AvailableGestures.horizontalSwipe,
          selectedDayPredicate: (day) {
            // Check if the day is in the list of enabled dates
            return controller.selectedDate.value == day;
          },
          onDaySelected: (selectedDay, focusedDay) {
            controller.onDaySelected(focusedDay);
          },
          focusedDay: controller.selectedDate.value ??
              DateTime.now(), // or any other logic to set focused day
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          enabledDayPredicate: (day) {
            // Enable only the dates that are in the selectedDays list
            return controller.selectedDay.contains(day);
          },
          headerStyle: HeaderStyle(
            formatButtonShowsNext: false,
            formatButtonVisible: false,
            titleTextStyle: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 14,
              fontType: AppFont.Bold,
              color: Colors.black,
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 14,
              fontType: AppFont.Bold,
              color: Colors.black,
            ),
            weekendStyle: GetAppFont.getInstance().addStyle(
              name: AppFont.Avenir,
              fs: 14,
              fontType: AppFont.Bold,
              color: Colors.black,
            ),
          ),

          calendarStyle: CalendarStyle(
            defaultTextStyle: TextStyle(color: Colors.black),
            selectedDecoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            selectedTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              // Rounded corners for today's date
            ),
            todayTextStyle: TextStyle(
              color: Colors.black, // Color for today's date text
              fontWeight: FontWeight.bold, // Bold text
            ),
          ),
        ));
  }
}
