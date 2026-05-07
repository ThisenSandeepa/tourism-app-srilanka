import 'package:flutter/material.dart';
import 'package:ceylon_tours_pro/core/theme/app_colors.dart';

// Driver Home Screen
import 'package:ceylon_tours_pro/features/driver/screens/driver_home_screen.dart';
import 'package:ceylon_tours_pro/features/driver/screens/scan_screen.dart';
import 'package:ceylon_tours_pro/features/driver/screens/guide_screen.dart';
import 'package:ceylon_tours_pro/features/driver/screens/ai_help_screen.dart';

// Bottom Nav Screens
import 'package:ceylon_tours_pro/features/driver/screens/earnings_screen.dart';
import 'package:ceylon_tours_pro/features/driver/screens/translate_screen.dart';
import 'package:ceylon_tours_pro/features/driver/screens/pulse_screen.dart';
import 'package:ceylon_tours_pro/features/driver/screens/vehicle_screen.dart';

// Profile
import 'package:ceylon_tours_pro/features/driver/screens/driver_profile_screen.dart';

class DriverShell extends StatefulWidget {
  const DriverShell({super.key});

  @override
  State<DriverShell> createState() => _DriverShellState();
}

class _DriverShellState extends State<DriverShell> {
  int _topTabIndex = 0;
  int _bottomTabIndex = -1; // -1 means top tab is active

  final List<String> _topTabs = ['Home', 'Scan', 'Guide', 'AI Help'];
  final List<IconData> _topIcons = [
    Icons.home_outlined,
    Icons.crop_free,
    Icons.menu_book_outlined,
    Icons.chat_bubble_outline,
  ];

  Widget _getTopTabScreen() {
    switch (_topTabIndex) {
      case 0:
        return const DriverHomeScreen();
      case 1:
        return const ScanScreen();
      case 2:
        return const GuideScreen();
      case 3:
        return const AiHelpScreen();
      default:
        return const DriverHomeScreen();
    }
  }

  Widget _getBottomTabScreen() {
    switch (_bottomTabIndex) {
      case 0:
        return const EarningsScreen();
      case 1:
        return const TranslateScreen();
      case 2:
        return const PulseScreen();
      case 3:
        return const VehicleScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          // -- HEADER BAR --
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.blueGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // App Title Row
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ceylon Tours Pro',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Driver Assistant Platform',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // User Avatar
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DriverProfileScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.white24,
                                  child: Text(
                                    'KP',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Kamal Perera',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Top Tab Bar
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: List.generate(_topTabs.length, (index) {
                        final isSelected = _bottomTabIndex == -1 && _topTabIndex == index;
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 12 : 0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _topTabIndex = index;
                                _bottomTabIndex = -1;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _topIcons[index],
                                    size: 16,
                                    color: isSelected
                                        ? AppColors.primaryBlue
                                        : Colors.white70,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    _topTabs[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? AppColors.primaryBlue
                                          : Colors.white70,
                                      fontSize: 13,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
          // -- CONTENT AREA --
          Expanded(
            child: _bottomTabIndex == -1
                ? _getTopTabScreen()
                : _getBottomTabScreen(),
          ),
        ],
      ),
      // -- BOTTOM NAV BAR --
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomNavItem(0, Icons.attach_money, 'Earnings'),
                _buildBottomNavItem(1, Icons.translate, 'Translate'),
                _buildBottomNavItem(2, Icons.sensors, 'Pulse'),
                _buildBottomNavItem(3, Icons.build_outlined, 'Vehicle'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(int index, IconData icon, String label) {
    final isSelected = _bottomTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _bottomTabIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary,
              size: 24,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary,
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
