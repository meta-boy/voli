// Dart imports:
import 'dart:async';
import 'dart:io';

// Package imports:
import 'package:path/path.dart' as path;

// Project imports:

Future<List<String>> getTemplates(String templateDir) async {
  Directory templateFolder;
  List<String> templates;
   
  templateFolder = Directory(templateDir);
  templates = [];
  var lister = templateFolder.list();
  await lister.forEach((element) {
    if (element is Directory) {
      templates.add(path.basename(element.path));

    }
  });
  return templates;
}
