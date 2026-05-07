import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          _buildHeader(),
          _buildVehicleInfo(),
          _buildNextService(),
          _buildMaintenanceChecklist(),
          _buildServiceHistory(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF37474F), Color(0xFF546E7A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.build_outlined, color: Colors.white, size: 24),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Vehicle Service Hub', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 2),
              Text('Keep your vehicle in top condition', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleInfo() {
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
              Icon(Icons.directions_car, color: AppColors.primaryBlue, size: 20),
              SizedBox(width: 6),
              Text('My Vehicle', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 14),
          _buildInfoRow('Make & Model', 'Toyota KDH 225'),
          const Divider(height: 16),
          _buildInfoRow('Year', '2023'),
          const Divider(height: 16),
          _buildInfoRow('License Plate', 'WP CAB-1234'),
          const Divider(height: 16),
          _buildInfoRow('Current Mileage', '45,230 km'),
          const Divider(height: 16),
          _buildInfoRow('Insurance Expiry', '2026-08-15'),
          const Divider(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Vehicle Status', style: TextStyle(fontSize: 13)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.activeGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle, color: AppColors.activeGreen, size: 14),
                    SizedBox(width: 4),
                    Text('Road Ready', style: TextStyle(color: AppColors.activeGreen, fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
        Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildNextService() {
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
              Icon(Icons.schedule, color: Color(0xFFFFA000), size: 20),
              SizedBox(width: 6),
              Text('Next Service Due', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.alertYellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Full Service', style: TextStyle(fontWeight: FontWeight.w600)),
                    Text('In 770 km', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFA000))),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Due at: 46,000 km', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    Text('or by Apr 30, 2026', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.earningsGreenLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Oil Change', style: TextStyle(fontWeight: FontWeight.w600)),
                    Text('Last done: Mar 15, 2026', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  ],
                ),
                Text('✓ Up to date', style: TextStyle(color: AppColors.activeGreen, fontWeight: FontWeight.w600, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaintenanceChecklist() {
    final items = [
      {'name': 'Tire Pressure', 'status': 'Good', 'isOk': true},
      {'name': 'Brake Pads', 'status': 'Good', 'isOk': true},
      {'name': 'AC System', 'status': 'Good', 'isOk': true},
      {'name': 'Wiper Blades', 'status': 'Replace Soon', 'isOk': false},
      {'name': 'Headlights', 'status': 'Good', 'isOk': true},
      {'name': 'Coolant Level', 'status': 'Good', 'isOk': true},
    ];

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
              Icon(Icons.checklist, color: AppColors.primaryBlue, size: 20),
              SizedBox(width: 6),
              Text('Maintenance Checklist', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Icon(
                    (item['isOk'] as bool) ? Icons.check_circle : Icons.warning_amber,
                    color: (item['isOk'] as bool) ? AppColors.activeGreen : AppColors.delayOrange,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(item['name'] as String, style: const TextStyle(fontSize: 13))),
                  Text(
                    item['status'] as String,
                    style: TextStyle(
                      fontSize: 12,
                      color: (item['isOk'] as bool) ? AppColors.activeGreen : AppColors.delayOrange,
                      fontWeight: FontWeight.w600,
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

  Widget _buildServiceHistory() {
    final history = [
      {'date': '2026-03-15', 'service': 'Oil Change & Filter', 'cost': 'LKR 8,500', 'mileage': '44,500 km'},
      {'date': '2026-02-01', 'service': 'Full Service', 'cost': 'LKR 25,000', 'mileage': '41,000 km'},
      {'date': '2025-12-10', 'service': 'Tire Replacement (x4)', 'cost': 'LKR 48,000', 'mileage': '38,200 km'},
    ];

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
              SizedBox(width: 6),
              Text('Service History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          ...history.asMap().entries.map((entry) {
            final item = entry.value;
            return Column(
              children: [
                if (entry.key > 0) const Divider(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['service']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                          const SizedBox(height: 2),
                          Text('${item['date']} • ${item['mileage']}', style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                        ],
                      ),
                    ),
                    Text(item['cost']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  ],
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
