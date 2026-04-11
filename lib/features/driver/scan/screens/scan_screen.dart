import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          _buildHeader(),
          _buildUploadButtons(),
          _buildHowItWorks(),
          _buildRecentScans(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
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
              Icon(Icons.auto_awesome, color: AppColors.primaryBlue, size: 22),
              SizedBox(width: 8),
              Text(
                'Smart Onboarding Engine',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Upload a photo of your itinerary (PDF or printed paper). AI will scan and extract all details automatically.',
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Take Photo of Itinerary'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.upload_file),
              label: const Text('Upload PDF File'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: const BorderSide(color: AppColors.divider),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorks() {
    final steps = [
      'Take photo or upload PDF of printed itinerary',
      'AI extracts dates, locations, hotels, and guest details',
      'System generates daily briefing and notifications',
      'You receive 7 AM notification every morning with the day\'s plan',
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.infoBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How Smart Scanning Works',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...steps.asMap().entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${entry.key + 1}. ',
                    style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: TextStyle(color: Colors.grey[700], fontSize: 13),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRecentScans() {
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
          const Text(
            'Recent Scans',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildScanItem(
            name: 'Mr. Zhang Wei - China',
            details: '3 days • Apr 7-10, 2026',
            isActive: true,
          ),
          const Divider(height: 20),
          _buildScanItem(
            name: 'Ms. Emma Wilson - UK',
            details: '5 days • Apr 1-5, 2026',
            isActive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildScanItem({
    required String name,
    required String details,
    required bool isActive,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: isActive ? AppColors.primaryBlue : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(details, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: isActive ? Colors.green.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isActive ? AppColors.activeGreen : AppColors.completedGray,
              width: 0.5,
            ),
          ),
          child: Text(
            isActive ? 'Active' : 'Completed',
            style: TextStyle(
              color: isActive ? AppColors.activeGreen : AppColors.completedGray,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
