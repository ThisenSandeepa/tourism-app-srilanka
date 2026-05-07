import 'package:flutter/material.dart';
import 'package:ceylon_tours_pro/core/theme/app_colors.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  int _selectedDay = 1;

  final Map<int, List<Map<String, String>>> _itinerary = {
    1: [
      {'time': '08:00', 'title': 'Airport Pickup (BIA)', 'note': 'Driver Kamal will meet you at arrivals', 'icon': 'flight_land'},
      {'time': '10:30', 'title': 'Drive to Dambulla', 'note': '4 hours scenic drive via expressway', 'icon': 'directions_car'},
      {'time': '14:30', 'title': 'Dambulla Cave Temple', 'note': 'UNESCO site, 5 sacred caves with ancient paintings', 'icon': 'temple_buddhist'},
      {'time': '17:00', 'title': 'Check-in Heritance Kandalama', 'note': 'Designed by Geoffrey Bawa, lake views', 'icon': 'hotel'},
      {'time': '19:00', 'title': 'Dinner at Hotel', 'note': 'Vegetarian options noted for you', 'icon': 'restaurant'},
    ],
    2: [
      {'time': '06:00', 'title': 'Early departure to Nuwara Eliya', 'note': 'Heavy driving day - 3.5 hours', 'icon': 'directions_car'},
      {'time': '10:00', 'title': 'Tea Factory Tour', 'note': 'Blue Field Tea Gardens - great for photography', 'icon': 'local_cafe'},
      {'time': '13:00', 'title': 'Lunch at Grand Hotel', 'note': 'Colonial-style venue, vegetarian menu', 'icon': 'restaurant'},
      {'time': '15:00', 'title': 'Gregory Lake', 'note': 'Boat ride optional, beautiful for photos', 'icon': 'kayaking'},
      {'time': '17:30', 'title': 'Hotel Check-in', 'note': "Jetwing St. Andrew's", 'icon': 'hotel'},
    ],
    3: [
      {'time': '07:00', 'title': 'Drive to Ella', 'note': '2 hours through tea plantations', 'icon': 'directions_car'},
      {'time': '09:30', 'title': 'Nine Arches Bridge', 'note': 'Iconic railway bridge, best light for photos', 'icon': 'photo_camera'},
      {'time': '11:00', 'title': 'Little Adam\'s Peak Hike', 'note': '45 min easy hike, panoramic views', 'icon': 'hiking'},
      {'time': '13:00', 'title': 'Lunch in Ella Town', 'note': 'Local restaurants with valley views', 'icon': 'restaurant'},
      {'time': '15:00', 'title': 'Ravana Falls', 'note': 'Quick stop, swimming possible', 'icon': 'water'},
      {'time': '17:00', 'title': 'Airport Transfer', 'note': 'Drive to BIA for departure', 'icon': 'flight_takeoff'},
    ],
  };

  IconData _getIcon(String name) {
    switch (name) {
      case 'flight_land': return Icons.flight_land;
      case 'directions_car': return Icons.directions_car;
      case 'temple_buddhist': return Icons.temple_buddhist;
      case 'hotel': return Icons.hotel;
      case 'restaurant': return Icons.restaurant;
      case 'local_cafe': return Icons.local_cafe;
      case 'kayaking': return Icons.kayaking;
      case 'photo_camera': return Icons.photo_camera;
      case 'hiking': return Icons.hiking;
      case 'water': return Icons.water;
      case 'flight_takeoff': return Icons.flight_takeoff;
      default: return Icons.place;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          _buildTripOverview(),
          _buildDaySelector(),
          _buildTimeline(),
        ],
      ),
    );
  }

  Widget _buildTripOverview() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your Trip Itinerary', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildInfoChip(Icons.calendar_today, 'Apr 7-10, 2026'),
              const SizedBox(width: 10),
              _buildInfoChip(Icons.nights_stay, '3 days'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildInfoChip(Icons.route, 'Colombo → Ella'),
              const SizedBox(width: 10),
              _buildInfoChip(Icons.person, 'Driver: Kamal'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 5),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [1, 2, 3].map((day) {
          final isSelected = _selectedDay == day;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedDay = day),
              child: Container(
                margin: EdgeInsets.only(right: day < 3 ? 8 : 0),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryBlue : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: isSelected ? AppColors.primaryBlue : Colors.grey[300]!),
                ),
                child: Column(
                  children: [
                    Text('Day $day', style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                      fontWeight: FontWeight.w600, fontSize: 14,
                    )),
                    Text(
                      day == 1 ? 'Apr 7' : day == 2 ? 'Apr 8' : 'Apr 9',
                      style: TextStyle(color: isSelected ? Colors.white70 : Colors.grey[500], fontSize: 11),
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

  Widget _buildTimeline() {
    final dayItems = _itinerary[_selectedDay] ?? [];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider, width: 0.5),
      ),
      child: Column(
        children: dayItems.asMap().entries.map((entry) {
          final item = entry.value;
          final isLast = entry.key == dayItems.length - 1;
          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time column
                SizedBox(
                  width: 48,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(item['time']!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey[600])),
                  ),
                ),
                // Timeline dot and line
                Column(
                  children: [
                    Container(
                      width: 10, height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: AppColors.primaryBlue.withValues(alpha: 0.2),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 12),
                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(_getIcon(item['icon']!), size: 18, color: AppColors.primaryBlue),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                              const SizedBox(height: 3),
                              Text(item['note']!, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
