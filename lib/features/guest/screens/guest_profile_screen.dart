import 'package:flutter/material.dart';
import 'package:ceylon_tours_pro/core/theme/app_colors.dart';

class GuestProfileScreen extends StatelessWidget {
  const GuestProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          _buildProfileHeader(),
          _buildTripInfo(),
          _buildPreferences(),
          _buildTripHistory(),
          _buildSettings(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider, width: 0.5),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 38,
            backgroundColor: Color(0xFFE65100),
            child: Text('ZW', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          const Text('Zhang Wei', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🇨🇳', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 6),
              Text('China • Solo Traveler', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildProfileStat('1', 'Trip'),
              Container(width: 1, height: 30, color: Colors.grey[200]),
              _buildProfileStat('3', 'Days'),
              Container(width: 1, height: 30, color: Colors.grey[200]),
              _buildProfileStat('6', 'Places'),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildProfileStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryBlue)),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
      ],
    );
  }

  Widget _buildTripInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.flight, color: AppColors.primaryBlue, size: 20),
              SizedBox(width: 8),
              Text('Current Trip', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          _buildInfoRow('Tour', 'Cultural & Hill Country'),
          _buildInfoRow('Dates', 'Apr 7-10, 2026'),
          _buildInfoRow('Driver', 'Kamal Perera'),
          _buildInfoRow('Status', 'Day 2 of 3 — Active'),
          _buildInfoRow('Route', 'Colombo → Dambulla → Nuwara Eliya → Ella'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 80, child: Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[600]))),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }

  Widget _buildPreferences() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.tune, color: Color(0xFF7B1FA2), size: 20),
              SizedBox(width: 8),
              Text('My Preferences', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          _buildPreferenceChip(Icons.restaurant, 'Vegetarian Diet', const Color(0xFF2E7D32)),
          const SizedBox(height: 8),
          _buildPreferenceChip(Icons.camera_alt, 'Photography Enthusiast', const Color(0xFFE65100)),
          const SizedBox(height: 8),
          _buildPreferenceChip(Icons.landscape, 'Loves Landscapes & Wildlife', const Color(0xFF1565C0)),
          const SizedBox(height: 8),
          _buildPreferenceChip(Icons.translate, 'Limited English — Chinese speaker', const Color(0xFF7B1FA2)),
        ],
      ),
    );
  }

  Widget _buildPreferenceChip(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(fontSize: 13, color: color, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildTripHistory() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.history, color: AppColors.primaryBlue, size: 20),
              SizedBox(width: 8),
              Text('Trip History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8E1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.emoji_nature, color: Color(0xFFFFA000), size: 24),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('This is your first trip with us!', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                      Text("We're excited to show you Sri Lanka 🌴", style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettings() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.settings, color: AppColors.textSecondary, size: 20),
              SizedBox(width: 8),
              Text('Settings', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          _buildSettingsItem(Icons.notifications_outlined, 'Push Notifications', true),
          _buildSettingsItem(Icons.language, 'App Language: Chinese', false),
          _buildSettingsItem(Icons.dark_mode_outlined, 'Dark Mode', false),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          InkWell(
            child: const Row(
              children: [
                Icon(Icons.logout, color: Color(0xFFE53935), size: 20),
                SizedBox(width: 12),
                Text('Sign Out', style: TextStyle(color: Color(0xFFE53935), fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String label, bool isOn) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.textSecondary),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
          Switch(
            value: isOn,
            onChanged: (_) {},
            activeThumbColor: AppColors.primaryBlue,
          ),
        ],
      ),
    );
  }
}
