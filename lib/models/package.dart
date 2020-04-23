// Dart imports:
import 'dart:convert';

Package packageFromJson(String str) => Package.fromJson(json.decode(str));

String packageToJson(Package data) => json.encode(data.toJson());

class Package {
  final String name;
  final Latest latest;

  Package({
    this.name,
    this.latest,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        name: json['name'],
        latest: Latest.fromJson(json['latest']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'latest': latest.toJson(),
      };
}

class Latest {
  final String archiveUrl;
  final Pubspec pubspec;
  final String version;

  Latest({
    this.archiveUrl,
    this.pubspec,
    this.version,
  });

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
        archiveUrl: json['archive_url'],
        pubspec: Pubspec.fromJson(json['pubspec']),
        version: json['version'],
      );

  Map<String, dynamic> toJson() => {
        'archive_url': archiveUrl,
        'pubspec': pubspec.toJson(),
        'version': version,
      };
}

class Pubspec {
  final String name;
  final String description;
  final String version;
  final String repository;
  final String issueTracker;
  final String homepage;
  final Environment environment;
  final Dependencies dependencies;
  final DevDependencies devDependencies;

  Pubspec({
    this.name,
    this.description,
    this.version,
    this.repository,
    this.issueTracker,
    this.homepage,
    this.environment,
    this.dependencies,
    this.devDependencies,
  });

  factory Pubspec.fromJson(Map<String, dynamic> json) => Pubspec(
        name: json['name'],
        description: json['description'],
        version: json['version'],
        repository: json['repository'],
        issueTracker: json['issue_tracker'],
        homepage: json['homepage'],
        environment: Environment.fromJson(json['environment']),
        dependencies: Dependencies.fromJson(json['dependencies']),
        devDependencies: DevDependencies.fromJson(json['dev_dependencies']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'version': version,
        'repository': repository,
        'issue_tracker': issueTracker,
        'homepage': homepage,
        'environment': environment.toJson(),
        'dependencies': dependencies.toJson(),
        'dev_dependencies': devDependencies.toJson(),
      };
}

class Dependencies {
  final Environment flutter;
  final String bloc;
  final String provider;

  Dependencies({
    this.flutter,
    this.bloc,
    this.provider,
  });

  factory Dependencies.fromJson(Map<String, dynamic> json) => Dependencies(
        flutter: Environment.fromJson(json['flutter']),
        bloc: json['bloc'],
        provider: json['provider'],
      );

  Map<String, dynamic> toJson() => {
        'flutter': flutter.toJson(),
        'bloc': bloc,
        'provider': provider,
      };
}

class Environment {
  final String sdk;

  Environment({
    this.sdk,
  });

  factory Environment.fromJson(Map<String, dynamic> json) => Environment(
        sdk: json['sdk'],
      );

  Map<String, dynamic> toJson() => {
        'sdk': sdk,
      };
}

class DevDependencies {
  final Environment flutterTest;
  final String effectiveDart;

  DevDependencies({
    this.flutterTest,
    this.effectiveDart,
  });

  factory DevDependencies.fromJson(Map<String, dynamic> json) =>
      DevDependencies(
        flutterTest: Environment.fromJson(json['flutter_test']),
        effectiveDart: json['effective_dart'],
      );

  Map<String, dynamic> toJson() => {
        'flutter_test': flutterTest.toJson(),
        'effective_dart': effectiveDart,
      };
}
