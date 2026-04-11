import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/screens/role_selection_screen.dart';
import 'features/shell/driver_shell.dart';

void main() {
  runApp(const CeylonToursApp());
}

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
  String? _selectedRole;

  void _onRoleSelected(String role) {
    setState(() {
      _selectedRole = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedRole == null) {
      return RoleSelectionScreen(onRoleSelected: _onRoleSelected);
    }

    if (_selectedRole == 'driver') {
      return const DriverShell();
    }

    // Guest section placeholder - Sprint 2
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.beach_access, size: 64, color: Color(0xFFFF8F00)),
            const SizedBox(height: 16),
            const Text(
              'Guest Section',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Coming in Sprint 2!',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => setState(() => _selectedRole = null),
              child: const Text('Back to Role Selection'),
            ),
          ],
        ),
      ),
    );
  }
}
