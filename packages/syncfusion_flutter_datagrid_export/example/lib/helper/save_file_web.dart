import 'dart:async';
import 'dart:convert';

import 'package:web/web.dart';

///To save the excel sheet in the web platform.
Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  HTMLAnchorElement()
    ..setAttribute('href',
        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
    ..setAttribute('download', fileName)
    ..click();
}
