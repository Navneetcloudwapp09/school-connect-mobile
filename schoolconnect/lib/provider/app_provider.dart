import 'package:schoolconnect/export.dart';
import 'package:schoolconnect/provider/attendance_provider.dart';

class AppProviders {
  static MultiProvider init({required Widget child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RoleProvider()),
        ChangeNotifierProvider(create: (_) => AttendanceProvider()),
      ],
      child: child,
    );
  }
}
