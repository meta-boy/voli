// Dart imports:
import 'dart:io';

// Package imports:
import 'package:io/ansi.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

// Project imports:
import '../errors/exceptions.dart';

Future<void> templateGenerator(String templateName, String templateDir) async {
  String file;

  try {
    file = await File(path.join(
          templateDir, templateName, 'template.yaml'))
      .readAsString();
  } on FileSystemException {
    throw TemplateFileNotFound(reason: 'TemplateFileNotFound Exception: template.yaml does not exist in the folder templates/$templateName');
  }
  var doc = loadYaml(file);
  var lib = doc['dirs'] as Map;
  var dir = Directory.current.path;
  try {
    getAllValues(lib, dir);
  } catch (e) {
  }
}

void getAllValues(Map map, String dir) {
  map.forEach((key, value) {
    if (value is Map) {
      try {
        var p = dir;
        // Directory(p).create(recursive: true);
        File(path.join(p, '.gitkeep')).create(recursive: true);
        print(green.wrap(p));
      } catch (e) {
        print(red.wrap(e));
      }
      getAllValues(value, path.join(dir, key.toString()));
    } else {
      var some = path.join(dir, key.toString());   
      value.forEach((folder) {
        var p = path.join(some, folder);
        // Directory(p).create(recursive: true);
        File(path.join(p, '.gitkeep')).create(recursive: true);
        print(green.wrap(p));
      });
    }
  });
}
