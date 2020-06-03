import 'package:betterstatmobile/actions/actions.dart';
import 'package:betterstatmobile/models/models.dart';
import 'package:betterstatmobile/presentation/schedule_list.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

class SchedulesTab extends StoreConnector<AppState, AppActions, List<Schedule>> {
  SchedulesTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, List<Schedule> state, AppActions actions) {
    return ScheduleList(
      schedules: state,
      onRefresh: () async {
        await actions.fetchSchedulesAction();
      },
      onRemove: (schedule) {
        actions.deleteScheduleAction(schedule.id);
      },
      onUndoRemove: (schedule) {
        actions.addScheduleAction(schedule);
      },
    );
  }

  @override
  List<Schedule> connect(AppState state) => state.schedulesSelector;
}