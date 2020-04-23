// Dart imports:
import 'dart:async';
import 'dart:io';

// Package imports:
import 'package:path/path.dart' as path;

// Project imports:
import '../constants/paths.dart';

Future<List<String>> getTemplates() async {
  Directory templateFolder;
  List<String> templates;
   
  templateFolder = Directory(path.join(packageDirectory, 'templates'));
  templates = [];
  var lister = templateFolder.list();
  await lister.forEach((element) {
    if (element is Directory) {
      templates.add(path.basename(element.path));

    }
  });
  return templates;
}
