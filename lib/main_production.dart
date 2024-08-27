import 'package:flutter/material.dart';
import 'package:kanban_board/app/app.dart';
import 'package:kanban_board/bootstrap.dart';
import 'package:kanban_board/utils/isar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService().syncData();
  await bootstrap(() => const App());
}
