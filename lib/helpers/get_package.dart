import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../errors/exceptions.dart';
import '../models/package.dart';

Future<List<Package>> getPackage({@required List<String> packageList}) async {
  List<Package> packages;
  packages = [];
  packageList.forEach((element) async {
    packages.add(await doRequest(element));
  });
  return packages;
}

Future<Package> doRequest(String packageName) async {
  http.Client client;
  Package package;

  var baseUrl = 'pub.dev';
  var uri = Uri.https(baseUrl, '/api/packages/${packageName}');
  try {
    http.Response response;
    response = await client.get(uri);
    if (response.statusCode < 400) {
      package = packageFromJson(response.body);
    } else {
      throw PackageNotFound(
          reason: 'Unable to fetch information for package: $packageName');
    }
  } catch (e) {
    throw Exception(e.toString());
  }
  return package;
}
