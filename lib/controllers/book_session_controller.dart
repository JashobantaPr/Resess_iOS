import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:recess/Dashboard/home/book_confirm_screen.dart';
import 'package:recess/Dashboard/home/home_screen.dart';
import 'package:recess/Dashboard/main_dashboard_screen.dart';
import 'package:recess/components/book_session_time_popup.dart';
import 'package:recess/controllers/home_controller.dart';
import 'package:recess/controllers/main_dashboard_controller.dart';

import 'package:recess/core/cache.service.dart';
import 'package:recess/models/user_booking_model.dart';
import 'package:recess/service/connect_now_service.dart';
import 'package:recess/service/home_screen.service.dart';
import 'package:recess/widgets/popup_model_widget.dart';

import '../components/book_session_class_type_popup.dart';
import '../components/booking_cancel_popup.dart';
import '../components/error_popup.dart';
import '../models/home_screen_model/booking_session.dart';

class BookSessionController extends GetxController {
  final dashboardController = Get.find<MainDashboardController>();
  final homeController = Get.find<HomeController>();
  final CacheService _cacheService = CacheService();

  Rx<DateTime> currentDate = Rx(DateTime.now());

  RxList<String> currentTab = <String>[].obs;
  RxList<String> currentConnectNowTab = <String>[].obs;

  RxString currentTabDuration = "".obs;

  RxInt selectedTimeSlotIndex = 0.obs;

  RxString selectedTabs = "".obs;

  void onOptionSelected(String option) {
    if (selectedTabs.value == option) {
      selectedTabs.value = '';
    } else {
      selectedTabs.value = option;
    }
  }

  Rx<Slots?> selectedSlot = Rx<Slots?>(null);
  Rx<String?> dateSummary = Rx<String?>(null);
  Rx<BookingData> bookingdata = BookingData().obs;

  final TextEditingController messageController = TextEditingController();
  final TextEditingController preSessionmessageController =
      TextEditingController();

  final options = ['Beginner', 'Intermediate', 'Expert'];
  final preSessionoptions = ['Beginner', 'Intermediate', 'Expert'];
  var selectedOption = "Beginner".obs;
  var preSelectionOption = "Beginner".obs;

  bool isOptionSelected(String option) {
    return selectedOption.value == option;
  }

  bool isPreSessionOptionSelected(String option) {
    return preSelectionOption.value == option;
  }

  var selectedDay = <DateTime>[].obs;
  var slotList = <Slots>[].obs;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<DateTime?> dayselected = Rx<DateTime?>(null);

  void setEnabledDays(List<DateTime> dates) {
    selectedDay.value = dates;
  }

  String getWeekDay(DateTime? date) {
    if (date == null) return "";
    return DateFormat("EEEE").format(date);
  }

  onDaySelected(selectedDay) {
    selectedDate.value = selectedDay;
    setSpecificDate(selectedDay);
    print("hhh-----${selectedDay}");
    NewTiming? timing =
        homeController.bookingFlow.value?.newTiming?.singleWhere((item) {
      DateTime dateTime = DateTime.parse(item.date!);
      return dateTime == selectedDay;
    }, orElse: null);

    slotList.value = timing?.slots ?? [];
    for (var slot in slotList) {
      // Split the time string based on " - "
      var timeParts = slot.timing?.split("- ") ?? [];

      // Assign the first part as the displayTime
      if (timeParts.isNotEmpty) {
        slot.timing = timeParts[0] ?? "-";
      }
    }

    slotList.refresh();
  }

  String getSlotFormat(String? timings) {
    if (timings == null || timings.isEmpty) return "";

    List<String> parts = timings.split(" - ");

    return parts.isNotEmpty ? parts[0] : "";
  }

  Color getStatusColor(Slots? slot) {
    if (slot == null) return Colors.white; // Handle case where slot is null
    if (slot.isBooked == true) return Colors.black;
    if (selectedSlot.value != null && slot.sId == selectedSlot.value!.sId)
      return Colors.black;
    return Colors.white;
  }

  Color getTextColor(Slots? slot) {
    if (slot == null ||
        (selectedSlot.value != null && slot.sId == selectedSlot.value!.sId) ||
        slot.isBooked == true) {
      return Colors.white;
    }
    return Colors.black;
  }

  // Method to check if an option is selected
  void selectOption(String option) {
    selectedOption.value = option;
  }

  void preSelectOption(String option) {
    preSelectionOption.value = option;
  }

  void goToTab(String page) {
    selectedTabs.value = page;
    if (currentTab.contains(page)) {
      currentTab.remove(page);
    } else {
      currentTab.add(page);
    }
  }

  void goToconnectNow(List<String> page) {
    currentConnectNowTab.value = page;
  }

  void selectSlot(Slots? slot) {
    if (slot?.isBooked == true) return;
    selectedSlot.value = slot;
    selectedSlot.refresh();
  }

  void goToTabDuration(String page) {
    currentTabDuration.value = page;
  }

  void handleResponse(String responseType) {
    goToTab(responseType);
  }

  void onChangeFuncation() {
    // getAttendance(
    //   date: currentDate.value.dateFormat(format: "yyyy-MM-dd"),
    //   month: currentDate.value.month.toString(),
    //   year: currentDate.value.year.toString(),
    // );
  }

  setCurrentTabValue(List<String> value) {
    currentTab.value = value;
  }

  @override
  void onInit() {
    super.onInit();

    setCurrentTabValue(
        homeController.bookingFlow.value?.preferredSessionType ?? []);

    goToconnectNow(
        homeController.bookingFlow.value?.preferredSessionType ?? []);
    goToTabDuration(homeController.bookingFlow.value?.selectYourSession ?? "");

    dateConvert(homeController.bookingFlow.value?.newTiming
        ?.map((timing) => timing.date ?? "")
        .toList());
  }

  userBookingSession() async {
    String? userId = await _cacheService.getUserId();
    Map<String, dynamic> body = {
      "user_id": userId,
      "expert_id": homeController.bookingFlow.value?.userId,
      "amount": homeController.bookingFlow.value?.setYourFeeForPreBookedSession,
      "levelOfSubjectKnowledge": selectedOption.value,
      "preferredSessionType": selectedTabs.value,
      "selectYourSession": homeController.bookingFlow.value?.selectYourSession,
      "chooseDate": selectedDate.value.toString(),
      "chooseTime": selectedSlot.value?.timing,
      "message": messageController.text,
      "day": getWeekDay(selectedDate.value)
    };
    print(body);

    BookingData? result = await HomeService().userBookingSession(body);
    if (result != null) {
      bookingdata.value = result;

      Get.offAll(BookingConfirmScreen());
    } else {
      showErrorDialog();
    }
  }

  void dateConvert(List<String>? dates) {
    if (dates == null || dates.isEmpty) return;

    // Convert the list of date strings to a list of DateTime
    List<DateTime> dateList =
        dates.map((date) => DateTime.parse(date)).toList();

    // Update selectedDays with the new list of dates
    selectedDay.value = dateList;
  }

  void setSpecificDate(DateTime date) {
    // Define the format used for the dateString
    DateFormat dateFormat = DateFormat('d MMMM yyyy');

    // Format the DateTime object into a string
    String formattedDate = dateFormat.format(date);

    // Set the formatted date to dateSummary
    dateSummary.value = formattedDate;
  }

  //cancel Booking

  bookingCancel() async {
    String? userId = await _cacheService.getUserId();
    Map<String, dynamic> body = {
      "user_id": userId,
      "booking_id": bookingdata.value.sId
    };
    try {
      bool? result = await HomeService().cancelBooking(body);
      if (result == true) {
        navigateToHomeScreen();
      }
    } catch (e) {
      return null;
    }
  }

  void showBookingDialog() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              width: 330,
              height: 230,
              child: BookSessionClassTypePopup(),
            ),
          );
        });
  }

  void showTimeDialog() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              width: 330,
              height: 230,
              child: BookSessionTimePopup(),
            ),
          );
        });
  }

  void showErrorDialog() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              width: 330,
              height: 230,
              child: ErrorPopup(),
            ),
          );
        });
  }

  void showCancelDialog() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              width: 330,
              height: 230,
              child: BookingSessionCancelPopUp(),
            ),
          );
        });
  }

  preSessionSubmit() async {
    try {
      String? userId = await _cacheService.getUserId();
      Map<String, dynamic> body = {
        "user_id": userId,
        "expert_id": homeController.bookingFlow.value?.userId,
        "typeOfSession": homeController.bookingFlow.value?.preferredSessionType,
        "levelOfSubjectKnowledge": preSelectionOption.value,
        "message": preSessionmessageController.text,
      };
      bool? result = await ConnectNowService().preBookSession(body);
      if (result == true) {
        Get.snackbar("Sucess", "Congrstulation");
      }
    } catch (e) {
      return null;
    }
  }

  void navigateToHomeScreen() {
    Get.offAll(() => MainDashboardScreen());
    dashboardController.currentPage(0); // Switch to HomeScreen tab
  }

  void showBookingCancel() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              width: 330,
              height: 230,
              child: CustomPopUpModal(
                title: 'Confirm',
                message: 'Are You Sure Cancel This Session?',
                onConfirm: () {
                  bookingCancel();
                },
                onCancel: () {
                  Get.back();
                },
              ),
            ),
          );
        });
  }
}
