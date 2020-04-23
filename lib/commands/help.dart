// Dart imports:
import 'dart:io';

// Package imports:
import 'package:args/args.dart';

Future help(ArgResults argResults, ArgParser parser) async {
  if (argResults['help']) {
    stdout.write('''
voli Help:
${parser.usage}
    ''');
  }
}
