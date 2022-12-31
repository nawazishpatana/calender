// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unused_local_variable

import 'dart:math';

import 'package:calender/model/meetingDataSource.dart';
import 'package:calender/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MeetingDataSource _events;

  @override
  void initState() {
    _events = MeetingDataSource(_getAppointments());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calendar!")),
      body: _getAgendaViewCalendar(_events),
    );
  }

  List<Meeting> _getAppointments() {
    /// Creates the required appointment subject details as a list.
    final List<String> subjectCollection = <String>[];
    subjectCollection.add('General Meeting');
    subjectCollection.add('Parent Teachar Meeting');
    subjectCollection.add('BirthDay of Quaid e Azam');
    subjectCollection.add('BirthDay of Allama Iqbal');
    subjectCollection.add('Annual Dinner');
    subjectCollection.add('Summer Vacations');
    subjectCollection.add('Winter Vacations');
    subjectCollection.add('Ashara');
    subjectCollection.add('BirthDay Of Muhammad SAW');
    subjectCollection.add('Sports Week');

    /// Creates the required appointment color details as a list.
    final List<Color> colorCollection = <Color>[];
    colorCollection.add(const Color(0xFF0F8644));
    colorCollection.add(const Color(0xFF8B1FA9));
    colorCollection.add(const Color(0xFFD20100));
    colorCollection.add(const Color(0xFFFC571D));
    colorCollection.add(const Color(0xFF36B37B));
    colorCollection.add(const Color(0xFF01A1EF));
    colorCollection.add(const Color(0xFF3D4FB5));
    colorCollection.add(const Color(0xFFE47C73));
    colorCollection.add(const Color(0xFF636363));
    colorCollection.add(const Color(0xFF0A8043));

    final List<Meeting> meetings = <Meeting>[];
    //  List<DateTime> visibleDates = <DateTime>[];
    final Random random = Random();
    final DateTime today = DateTime(2023, 1, 1);
    for (int month = 0; month < 12; month++) {
      //print("Month = $month");
      for (int day = 0; day < 30; day++) {
        //print("Day = $day");
        for (int hour = 9; hour < 18; hour += 5) {
          // print("Hour = $hour");
          meetings.add(Meeting(
            eventName: subjectCollection[random.nextInt(10)],
            from: today
                .add(Duration(days: (month * 30) + day))
                .add(Duration(hours: hour)),
            to: today
                .add(Duration(days: (month * 30) + day))
                .add(Duration(hours: hour + 2)),
            background: colorCollection[random.nextInt(10)],
            description: '',
            isAllDay: false,
            startTimeZone: '',
            endTimeZone: '',
          ));
        }
      }
    }

    return meetings;
  }

  SfCalendar _getAgendaViewCalendar([CalendarDataSource? calendarDataSource]) {
    return SfCalendar(
      view: CalendarView.month,
      showDatePickerButton: true,
      cellEndPadding: 10,
      dataSource: calendarDataSource,
      firstDayOfWeek: 1,
      monthViewSettings: MonthViewSettings(
        //showAgenda: true,
        showTrailingAndLeadingDates: false,
        dayFormat: 'EEE',
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
      ),
    );
  }
}
