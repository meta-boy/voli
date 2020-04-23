import 'package:meta/meta.dart';

class PackageNotFound implements Exception {
  final String reason;
  PackageNotFound({@required this.reason});
}

class TemplateFileNotFound implements Exception {
  final String reason;
  TemplateFileNotFound({@required this.reason});
}