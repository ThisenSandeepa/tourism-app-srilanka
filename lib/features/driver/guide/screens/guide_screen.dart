import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int _selectedRegion = 0;
  final List<Map<String, dynamic>> _regions = [
    {
      'name': 'Cultural Triangle',
      'icon': Icons.temple_buddhist,
      'color': AppColors.primaryBlue,
    },
    {
      'name': 'Hill Country',
      'icon': Icons.terrain,
      'color': const Color(0xFF795548),
    },
    {
      'name': 'Deep South & Coast',
      'icon': Icons.beach_access,
      'color': const Color(0xFFE65100),
    },
  ];

  final List<Map<String, dynamic>> _locations = [
    {
      'name': 'Sigiriya Rock Fortress',
      'description':
          'Ancient rock fortress built by King Kashyapa in 477 AD. UNESCO World Heritage Site.',
      'bestTime':
          'Early morning (6:30 AM) or late afternoon (3:30 PM) to avoid heat and crowds',
      'duration': '2-3 hours including climb',
      'tips': 4,
      'region': 0,
    },
    {
      'name': 'Anuradhapura',
      'description':
          'Ancient capital city, home to the sacred Sri Maha Bodhi tree (oldest recorded tree in the world)',
      'bestTime': 'Early morning before 10 AM (site is extensive and hot)',
      'duration': 'Full day recommended',
      'tips': 4,
      'region': 0,
    },
    {
      'name': 'Polonnaruwa',
      'description':
          'Medieval capital with stunning ruins and the famous Gal Vihara rock sculptures',
      'bestTime': 'Early morning 7-10 AM',
      'duration': 'Half day (4-5 hours)',
      'tips': 3,
      'region': 0,
    },
    {
      'name': 'Nuwara Eliya',
      'description':
          'Little England of Sri Lanka with tea plantations and colonial charm',
      'bestTime': 'Year-round, best from January-April',
      'duration': '1-2 days recommended',
      'tips': 5,
      'region': 1,
    },
    {
      'name': 'Ella',
      'description':
          'Hill country paradise with Nine Arches Bridge and stunning hikes',
      'bestTime': 'Early morning for hikes, 6 AM start',
      'duration': '1-2 days',
      'tips': 6,
      'region': 1,
    },
    {
      'name': 'Mirissa',
      'description': 'Best whale watching in Sri Lanka and beautiful beaches',
      'bestTime': 'November to April for whale watching',
      'duration': 'Half day for whale watching',
      'tips': 3,
      'region': 2,
    },
    {
      'name': 'Yala National Park',
      'description':
          'Highest leopard density in the world, incredible wildlife safari',
      'bestTime': 'February to July, early morning safaris',
      'duration': 'Full day safari (5:30 AM - 6 PM)',
      'tips': 4,
      'region': 2,
    },
  ];

  List<Map<String, dynamic>> get _filteredLocations =>
      _locations.where((l) => l['region'] == _selectedRegion).toList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          _buildHeader(),
          _buildSearchBar(),
          _buildRegionFilter(),
          ..._filteredLocations.map(_buildLocationCard),
          _buildStats(),
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
      child: const Row(
        children: [
          Icon(Icons.menu_book, color: AppColors.primaryBlue, size: 24),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Knowledge Vault',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                Text(
                  'Your digital guide library. Access history, tips, and insider knowledge for every destination.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search locations...',
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildRegionFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: _regions.asMap().entries.map((entry) {
          final isSelected = _selectedRegion == entry.key;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => setState(() => _selectedRegion = entry.key),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? entry.value['color'] as Color
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? (entry.value['color'] as Color)
                        : Colors.grey[300]!,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      entry.value['icon'] as IconData,
                      size: 16,
                      color: isSelected
                          ? Colors.white
                          : AppColors.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      entry.value['name'] as String,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : AppColors.textPrimary,
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
        }).toList(),
      ),
    );
  }

  Widget _buildLocationCard(Map<String, dynamic> location) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider, width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.activeGreen,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        location['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  location['description'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                const SizedBox(height: 10),
                // Best Time badge
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.activeGreen,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Best Time',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        location['bestTime'],
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // Duration badge
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Duration',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      location['duration'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '${location['tips']} insider tips • Full history available',
                  style: TextStyle(
                    color: AppColors.primaryBlue.withValues(alpha: 0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Play button
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.activeGreen,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.infoBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Knowledge Base Stats',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('32', 'Locations'),
              _buildStatItem('28', 'Audio Guides'),
              _buildStatItem('150+', 'Insider Tips'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}
