import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../styles/app_styles.dart';
import '../styles/clock_style.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> with WidgetsBindingObserver {
  late DateTime _currentTime;
  late Timer _timer;
  late PageController _pageController;
  final List<ClockStyle> _styles = AppStyles.getStyles();
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Re-apply full screen mode for robustness
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    int savedIndex = prefs.getInt('saved_style_index') ?? 0;

    // Start at a large offset to allow infinite swiping in both directions
    int initialPage = (1000 * _styles.length) + savedIndex;

    _pageController = PageController(initialPage: initialPage);

    if (mounted) {
      setState(() {
        _isReady = true;
      });
    }
  }

  Future<void> _onPageChanged(int index) async {
    final prefs = await SharedPreferences.getInstance();
    int actualIndex = index % _styles.length;
    debugPrint('Current style index: $actualIndex');
    await prefs.setInt('saved_style_index', actualIndex);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer.cancel();
    if (_isReady) {
      _pageController.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Re-apply full screen when app is resumed
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Force immersive mode on every build to keep nav bar hidden
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    
    if (!_isReady) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white24)),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              int actualIndex = index % _styles.length;
              return _styles[actualIndex].build(_currentTime, constraints);
            },
          );
        },
      ),
    );
  }
}
