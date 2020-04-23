// Dart imports:
import 'dart:io';

// Package imports:
import 'package:args/args.dart';
import 'package:io/ansi.dart';

// Project imports:
import '../errors/exceptions.dart';
import '../helpers/get_templates.dart';
import '../helpers/template_genrator.dart';

Future templateChecker(ArgResults argResults, String template) async {
  var templates = await getTemplates();
  if (argResults[template] != null) {
    if ((templates).contains(argResults[template])) {
      try {
        await templateGenerator(argResults[template]);
      } on TemplateFileNotFound catch (e) {
        stderr.write(red.wrap(e.reason));
      }
    } else {
      stdout.write(red.wrap('Specified template does not exist') +
          ', try one of the following:' +
          green.wrap('\n- ${templates.join("\n- ")}'));
    }
  }
}
