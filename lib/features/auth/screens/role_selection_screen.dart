import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  final Function(String role) onRoleSelected;

  const RoleSelectionScreen({super.key, required this.onRoleSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF1565C0), Color(0xFF1976D2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 60),
                // App Title
                const Text(
                  'Ceylon Tours Pro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your Smart Tourism Companion',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                // Sri Lanka tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '🇱🇰 Sri Lanka',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 60),
                // Who Are You title
                Text(
                  'Who are you?',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                // Driver Card
                _buildRoleCard(
                  icon: Icons.directions_car,
                  title: 'Driver / Guide',
                  subtitle: 'Manage tours, access the Knowledge Vault, track earnings',
                  cta: 'Start Working →',
                  gradient: const [Color(0xFF1B5E20), Color(0xFF2E7D32)],
                  onTap: () => onRoleSelected('driver'),
                ),
                const SizedBox(height: 16),
                // Guest Card
                _buildRoleCard(
                  icon: Icons.hiking,
                  title: 'Guest / Tourist',
                  subtitle: 'View your itinerary, explore AR history, tip your driver',
                  cta: 'Explore Sri Lanka →',
                  gradient: const [Color(0xFFE65100), Color(0xFFFF8F00)],
                  onTap: () => onRoleSelected('guest'),
                ),
                const Spacer(),
                // Footer
                Text(
                  'Powered by AI • Built for Sri Lankan Tourism',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.5),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String cta,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradient[0].withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              cta,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
