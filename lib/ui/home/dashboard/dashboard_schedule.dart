import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zepto_flutter_app/ui/home/home_viewmodel.dart';
import 'package:zepto_flutter_app/utils/calendar_utils.dart';

class DashboardScheduleView extends HookViewModelWidget<HomeViewModel> {
  DashboardScheduleView({
    Key? key,
  }) : super(key: key, reactive: false);
  late final ValueNotifier<List<Event>> _selectedEvents;
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: Text(
            'Schedule',
            style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),
        ),
        TableCalendar<Event>(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          calendarFormat: _calendarFormat,
          rangeSelectionMode: _rangeSelectionMode,
          eventLoader: _getEventsForDay,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
          calendarStyle: const CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
              markersMaxCount: 1,
              markerDecoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
          onDaySelected: _onDaySelected,
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
      ],
    );
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _rangeStart = null; // Important to clean those
      _rangeEnd = null;

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }
}
