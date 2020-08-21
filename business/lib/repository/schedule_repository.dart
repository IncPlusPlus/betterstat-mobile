import 'dart:core';

import 'package:betterstatmobile_business_logic/api/scheduling/api_schedule.dart';
import 'package:betterstatmobile_business_logic/models/models.dart';
import 'package:betterstatmobile_business_logic/repository/generic_future_repository.dart';

class ScheduleRepository implements GenericFutureRepository<Schedule, String> {
  const ScheduleRepository();

  @override
  Future<Schedule> createById(Schedule schedule) {
    return postSchedule(schedule);
  }

  Future<void> setDayOfWeekToDay(
      String scheduleId, DayOfWeek dayOfWeek, String dayId) {
    return setDayOfWeek(scheduleId, dayOfWeek, dayId);
  }

  @override
  Future<Schedule> deleteById(String id) {
    return deleteSchedule(id);
  }

  @override
  Future<Schedule> getById(String id) {
    return getSchedule(id);
  }

  @override
  Future<List<Schedule>> getAll() {
    return getSchedules();
  }

  @override
  Future<Schedule> saveById(Schedule schedule, String id) {
    return putSchedule(schedule, id);
  }
}
