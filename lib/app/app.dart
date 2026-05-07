import 'package:ceylon_tours_pro/core/theme/app_theme.dart';
import 'package:ceylon_tours_pro/features/auth/screens/login_screen.dart';
import 'package:ceylon_tours_pro/features/auth/screens/role_selection_screen.dart';
import 'package:ceylon_tours_pro/features/driver/shell/driver_shell.dart';
import 'package:ceylon_tours_pro/features/guest/shell/guest_shell.dart';
import 'package:flutter/material.dart';

enum AppScreen { login, roleSelection, driver, guest }

class CeylonToursApp extends StatelessWidget {
  const CeylonToursApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ceylon Tours Pro',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AppWrapper(),
    );
  }
}

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  AppScreen _currentScreen = AppScreen.login;

  void _onLoginSuccess() {
    setState(() => _currentScreen = AppScreen.roleSelection);
  }

  void _onRoleSelected(String role) {
    setState(() {
      _currentScreen = role == 'driver' ? AppScreen.driver : AppScreen.guest;
    });
  }

  void _onLogout() {
    setState(() => _currentScreen = AppScreen.login);
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case AppScreen.login:
        return LoginScreen(onLoginSuccess: _onLoginSuccess);
      case AppScreen.roleSelection:
        return RoleSelectionScreen(onRoleSelected: _onRoleSelected);
      case AppScreen.driver:
        return const DriverShell();
      case AppScreen.guest:
        return GuestShell(onLogout: _onLogout);
    }
  }
}
