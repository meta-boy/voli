// Dart imports:
import 'dart:io';

// Package imports:
import 'package:args/args.dart';

// Project imports:
import 'package:voli/commands/help.dart';
import 'package:voli/commands/template.dart';

ArgResults argResults;
const template = 'template';
void voli(List<String> arguments) async {
  exitCode = 0;

  final parser = ArgParser()
    ..addOption(template,
        abbr: 't',
        help: 'Name of the template that is to be used',
        defaultsTo: null)
    ..addFlag('help', abbr: 'h', help: 'Display help information');
  argResults = parser.parse(arguments);
  await templateChecker(argResults, template);
  await help(argResults, parser);
}
