// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:isar/isar.dart';
// import 'package:kanban_board/models/task_model.dart';
// import 'package:kanban_board/utils/isar.dart';

// class TaskTimerWidget extends StatefulWidget {
//   const TaskTimerWidget({required this.task, super.key});
//   final TaskModel task;

//   @override
//   State<TaskTimerWidget> createState() => _TaskTimerWidgetState();
// }

// class _TaskTimerWidgetState extends State<TaskTimerWidget> {
//   int _seconds = 0;
//   Timer? _timer;
//   bool _isTimerRunning = false;
//   late Isar isar;

//   @override
//   void initState() {
//     super.initState();
//     isar = IsarService().isarInstance;
//     _loadTaskTimer();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _saveTaskTimer(
//       started: _isTimerRunning,
//     ); // Save timer state when the widget is disposed
//     super.dispose();
//   }

//   Future<void> _loadTaskTimer() async {
//     // Fetch the latest task data from the database
//     final taskFromDb = isar.taskModels.get(widget.task.id);

//     if (taskFromDb != null) {
//       // Calculate the time already spent based on startTime and previous elapsed time
//       if ((taskFromDb.isTimerRunning ?? false) &&
//           taskFromDb.startTime != null) {
//         final now = DateTime.now();
//         final timeDifference = now.difference(taskFromDb.startTime!);
//         _seconds = (taskFromDb.elapsedTime ?? 0) + timeDifference.inSeconds;
//       } else {
//         _seconds = taskFromDb.elapsedTime ?? 0;
//       }

//       _isTimerRunning = taskFromDb.isTimerRunning ?? false;

//       if (_isTimerRunning) {
//         _startTimer();
//       } else {
//         setState(() {});
//       }
//     } else {
//       // Handle the case where the task might not be found in the database
//       setState(() {
//         _seconds = widget.task.elapsedTime ?? 0;
//         _isTimerRunning = widget.task.isTimerRunning ?? false;
//       });
//     }
//   }

//   void _startTimer() {
//     if (_isTimerRunning) return;

//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _seconds++;
//       });
//     });

//     setState(() {
//       _isTimerRunning = true;
//     });

//     _saveTaskTimer(started: true);
//   }

//   void _stopTimer() {
//     if (!_isTimerRunning) return;

//     _timer?.cancel();
//     setState(() {
//       _isTimerRunning = false;
//     });

//     _saveTaskTimer(started: _isTimerRunning);
//   }

//   Future<void> _saveTaskTimer({bool started = false}) async {
//     await isar.write((isar) async {
//       widget.task.elapsedTime = _seconds;

//       log(
//         'Saving task timer with elapsed time: ${widget.task.elapsedTime}',
//       );
//       widget.task.isTimerRunning = started;
//       if (started && widget.task.startTime == null) {
//         widget.task.startTime = DateTime.now();
//       } else if (!started) {
//         widget.task.stopTime = DateTime.now();
//       }
//       isar.taskModels.put(widget.task);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final formattedTime = DateFormat('HH:mm:ss')
//         .format(DateTime(0).add(Duration(seconds: _seconds)));

//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               formattedTime,
//               style: const TextStyle(fontSize: 48),
//             ),
//             const SizedBox(height: 24),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: _isTimerRunning ? null : _startTimer,
//                   child: const Text('Start'),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: !_isTimerRunning ? null : _stopTimer,
//                   child: const Text('Stop'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             if (widget.task.startTime != null)
//               Text('Start Time: ${widget.task.startTime}'),
//             if (widget.task.stopTime != null)
//               Text('Stop Time: ${widget.task.stopTime}'),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:kanban_board/models/task_model.dart';
import 'package:kanban_board/utils/isar.dart';

class TaskTimerWidget extends StatefulWidget {
  const TaskTimerWidget({required this.task, super.key});
  final TaskModel task;

  @override
  State<TaskTimerWidget> createState() => _TaskTimerWidgetState();
}

class _TaskTimerWidgetState extends State<TaskTimerWidget> {
  int _seconds = 0;
  Timer? _timer;
  bool _isTimerRunning = false;
  late Isar isar;

  @override
  void initState() {
    super.initState();
    isar = IsarService().isarInstance;
    _loadTaskTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _saveTaskTimer(
      started: _isTimerRunning,
    ); // Save timer state when the widget is disposed
    super.dispose();
  }

  Future<void> _loadTaskTimer() async {
    // Fetch the latest task data from the database
    final taskFromDb = isar.taskModels.get(widget.task.id);

    if (taskFromDb != null) {
      // Calculate the time already spent based on all intervals
      _seconds = _calculateTotalTime(taskFromDb.timeIntervals);

      // If the timer is currently running, add the time from the current ongoing interval
      if ((taskFromDb.isTimerRunning ?? false) &&
          taskFromDb.timeIntervals.isNotEmpty) {
        final lastInterval = taskFromDb.timeIntervals.last;
        if (lastInterval.isOngoing && lastInterval.startTime != null) {
          final now = DateTime.now();
          final timeDifference = now.difference(lastInterval.startTime!);
          _seconds += timeDifference.inSeconds;
        }
      }

      _isTimerRunning = taskFromDb.isTimerRunning ?? false;

      if (_isTimerRunning) {
        _startTimer();
      } else {
        setState(() {});
      }
    } else {
      // Handle the case where the task might not be found in the database
      setState(() {
        _seconds = widget.task.elapsedTime ?? 0;
        _isTimerRunning = widget.task.isTimerRunning ?? false;
      });
    }
  }

  void _startTimer() {
    if (_isTimerRunning) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });

    setState(() {
      _isTimerRunning = true;
    });

    _addTimeInterval();
    _saveTaskTimer(started: true);
  }

  void _stopTimer() {
    if (!_isTimerRunning) return;

    _timer?.cancel();
    setState(() {
      _isTimerRunning = false;
    });

    _endLastTimeInterval();
    _saveTaskTimer();
  }

  void _addTimeInterval() {
    // Create a mutable copy of the time intervals list
    final mutableTimeIntervals =
        List<TimeInterval>.from(widget.task.timeIntervals)

          // Add the new time interval
          ..add(TimeInterval(startTime: DateTime.now()));

    // Update the task with the new list
    setState(() {
      widget.task.timeIntervals = mutableTimeIntervals;
    });
    // widget.task.timeIntervals.add(TimeInterval(startTime: DateTime.now()));
  }

  void _endLastTimeInterval() {
    if (widget.task.timeIntervals.isNotEmpty) {
      final lastInterval = widget.task.timeIntervals.last;
      lastInterval
        ..endTime = DateTime.now()
        ..isOngoing = false;
    }
  }

  int _calculateTotalTime(List<TimeInterval> intervals) {
    var totalSeconds = 0;
    for (final interval in intervals) {
      if (interval.startTime != null) {
        final endTime = interval.isOngoing ? DateTime.now() : interval.endTime;
        if (endTime != null) {
          totalSeconds += endTime.difference(interval.startTime!).inSeconds;
        }
      }
    }
    return totalSeconds;
  }

  Future<void> _saveTaskTimer({bool started = false}) async {
    await isar.write((isar) async {
      widget.task.elapsedTime = _seconds;

      log(
        'Saving task timer with elapsed time: ${widget.task.elapsedTime}',
      );
      widget.task.isTimerRunning = started;
      isar.taskModels.put(widget.task);
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('HH:mm:ss')
        .format(DateTime(0).add(Duration(seconds: _seconds)));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              formattedTime,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isTimerRunning ? null : _startTimer,
                  child: const Text('Start'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: !_isTimerRunning ? null : _stopTimer,
                  child: const Text('Stop'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (widget.task.timeIntervals.isNotEmpty)
              ...widget.task.timeIntervals.map(
                (interval) => Text(
                  'Interval: ${interval.startTime} - ${interval.isOngoing ? "Running" : interval.endTime}',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
