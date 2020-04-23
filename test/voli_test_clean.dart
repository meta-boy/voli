// Dart imports:
import 'dart:io';

// Package imports:
import 'package:path/path.dart' as path;

// Project imports:
import '../lib/constants/paths.dart';

main(List<String> args) {
  final dir = Directory(path.join(packageDirectory, 'test', 'dir_test'));
  dir.deleteSync(recursive: true);
  Directory(path.join(packageDirectory, 'test', 'dir_test')).create();
}
