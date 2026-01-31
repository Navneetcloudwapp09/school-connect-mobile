import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schoolconnect/constants/ApiServer.dart';
import 'package:schoolconnect/model.dart/attendanceclass.dart';

class AttendanceProvider extends ChangeNotifier {
  List<AttendanceClass> attendances = [];
  AttendanceClass? attendance; // keep for compatibility
  bool loading = false;
  String? error;

  Future<void> fetchAttendance() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      debugPrint('AttendanceProvider: fetching ${Apiserver.attendanceclass}');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      debugPrint(
        'AttendanceProvider: auth_token=${token == null ? 'null' : 'REDACTED'}',
      );
      final headers = <String, String>{'Content-Type': 'application/json'};
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
        // headers['x-auth-token'] = token;
      } else {
        debugPrint('AttendanceProvider: no auth token found in prefs');
      }
      final res = await http.get(
        Uri.parse(Apiserver.attendanceclass),
        headers: headers,
      );
      debugPrint('AttendanceProvider: response status ${res.statusCode}');
      try {
        final parsed = json.decode(res.body);
        final pretty = const JsonEncoder.withIndent('  ').convert(parsed);
        debugPrint('AttendanceProvider: response body (pretty):\n$pretty');
      } catch (e) {
        debugPrint('AttendanceProvider: response body (raw): ${res.body}');
      }
      if (res.statusCode == 200) {
        final body = json.decode(res.body);
        List<dynamic> list = [];
        if (body is List) {
          list = body;
        } else if (body is Map) {
          if (body['data'] is List) {
            list = body['data'];
          } else {
            list = [body];
          }
        }

        attendances = list
            .whereType<Map<String, dynamic>>()
            .map((e) => AttendanceClass.fromJson(e))
            .toList();
        attendance = attendances.isNotEmpty ? attendances.first : null;

        try {
          final pretty = const JsonEncoder.withIndent(
            '  ',
          ).convert(attendances.map((a) => a.toJson()).toList());
          debugPrint(
            'AttendanceProvider: parsed attendances (pretty):\n$pretty',
          );
        } catch (_) {
          debugPrint(
            'AttendanceProvider: parsed attendances (count): ${attendances.length}',
          );
        }
      } else {
        error = 'Server error: ${res.statusCode}';
        debugPrint('AttendanceProvider: $error');
      }
    } catch (e) {
      error = e.toString();
      debugPrint('AttendanceProvider: exception $error');
    }
    loading = false;
    notifyListeners();
  }
}
