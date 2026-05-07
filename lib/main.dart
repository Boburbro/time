import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'screens/clock_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Keep screen on
  try {
    await WakelockPlus.enable();
  } catch (e) {
    debugPrint('Wakelock error: $e');
  }

  // Full screen mode
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // Support all orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const ClockApp());
}

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Canvas',
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      home: const ClockScreen(),
    );
  }
}
