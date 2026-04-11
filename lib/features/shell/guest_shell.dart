import 'package:flutter/material.dart';
import 'package:ceylon_tours_pro/core/theme/app_colors.dart';

import 'package:ceylon_tours_pro/features/guest/home/screens/guest_home_screen.dart';
import 'package:ceylon_tours_pro/features/guest/itinerary/screens/itinerary_screen.dart';
import 'package:ceylon_tours_pro/features/guest/explore/screens/explore_screen.dart';
import 'package:ceylon_tours_pro/features/guest/tip/screens/tip_screen.dart';
import 'package:ceylon_tours_pro/features/guest/profile/screens/guest_profile_screen.dart';

class GuestShell extends StatefulWidget {
  final VoidCallback onLogout;

  const GuestShell({super.key, required this.onLogout});

  @override
  State<GuestShell> createState() => _GuestShellState();
}

class _GuestShellState extends State<GuestShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    GuestHomeScreen(),
    ItineraryScreen(),
    ExploreScreen(),
    TipScreen(),
    GuestProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          // Header
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0D47A1), Color(0xFF1565C0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ceylon Tours Pro',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('Guest Experience',
                          style: TextStyle(color: Colors.white70, fontSize: 11)),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: widget.onLogout,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white24,
                              child: Text('ZW', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(width: 6),
                            Text('Zhang Wei', style: TextStyle(color: Colors.white, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Content
          Expanded(child: _screens[_currentIndex]),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -2)),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_outlined, Icons.home, 'Home'),
                _buildNavItem(1, Icons.map_outlined, Icons.map, 'Itinerary'),
                _buildNavItem(2, Icons.explore_outlined, Icons.explore, 'Explore'),
                _buildNavItem(3, Icons.favorite_outline, Icons.favorite, 'Tip'),
                _buildNavItem(4, Icons.person_outline, Icons.person, 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, IconData activeIcon, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isSelected ? activeIcon : icon, color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary, size: 24),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(color: isSelected ? AppColors.primaryBlue : AppColors.textSecondary, fontSize: 11, fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
