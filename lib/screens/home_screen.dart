// File: lib/screens/home_screen.dart
import 'package:chikista_io/constatnts/colors.dart';
import 'package:chikista_io/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'report_screen.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int selectedIndex = 1; // Saturday by default
  final List<String> days = [
    "Mon, Sep 1",
    "Tue, Sep 2",
    "Wed, Sep 3",
    "Thu, Sep 4",
    "Fri, Sep 5",
    "Sat, Sep 6",
    "Sun, Sep 7",
  ]; 

   bool isDeviceConnected = false; // You can change this based on real device status

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isDeviceConnected) {
        _showDeviceNotConnectedDialog();
      }
    });
  }

  void _showDeviceNotConnectedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // prevent closing the dialog without action
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Your Device is not connected",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Image.asset('assets/robot.png', height: 120), // Your robot image
                const SizedBox(height: 20),
                const Text(
                  "Connect your device with",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _connectionButton(Icons.bluetooth, "Bluetooth"),
                    const SizedBox(width: 10),
                    _connectionButton(Icons.wifi, "Wi-Fi"),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _connectionButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pop(context); // Close popup
        // Navigate to your connection settings screen
      },
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4E7CF9),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(AppStrings.greeting, style: AppTextStyles.greeting),
            Text(AppStrings.medicinesLeft, style: AppTextStyles.medicineInfo),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: AppColors.primary),
            onPressed: () {
                        
            },
          ),
          InkWell
          (
            onTap: (){
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: const CircleAvatar(radius: 20)),
          const SizedBox(width: 10),
        ],
      ),
      body:  
    Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children:   [
      SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Chip(
                        backgroundColor: isSelected
                            ? AppColors.selectedDateBackground
                            : Colors.grey[200],
                        label: Text(
                          days[index],
                          style: isSelected
                              ? AppTextStyles.selectedDate
                              : const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
             selectedIndex ==  1?
     Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
            Padding(
      padding: EdgeInsets.only(left: 16, top: 12),
      child: Text("Morning 08:00 am",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
       ),
       MedicineCard(
      iconPath: Icons.tablet,
      iconColor: Colors.pink,
      title: "Calpol 500mg Tablet",
      subtitle: "Before Breakfast",
      day: "01",
      status: "Taken",
      statusIcon: Icons.notifications_active,
      statusColor: Colors.green,
       ),
       MedicineCard(
      iconPath: Icons.tablet,
      iconColor: Colors.lightBlue,
      title: "Calpol 500mg Tablet",
      subtitle: "Before Breakfast",
      day: "27",
      status: "Missed",
      statusIcon: Icons.notifications_off,
      statusColor: Colors.red,
       ),
     
       Padding(
      padding: EdgeInsets.only(left: 16, top: 16),
      child: Text("Afternoon 02:00 pm",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
       ),
       MedicineCard(
      iconPath: Icons.tablet,
      iconColor: Colors.purple,
      title: "Calpol 500mg Tablet",
      subtitle: "After Food",
      day: "01",
      status: "Snoozed",
      statusIcon: Icons.notification_important,
      statusColor: Colors.orange,
       ),
     
       Padding(
      padding: EdgeInsets.only(left: 16, top: 16),
      child: Text("Night 09:00 pm",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
       ),
       MedicineCard(
      iconPath: Icons.tablet,
      iconColor: Colors.redAccent,
      title: "Calpol 500mg Tablet",
      subtitle: "Before Sleep",
      day: "03",
      status: "Left",
      statusIcon: Icons.notifications_none,
      statusColor: Colors.grey,
       ),
       
      ],
     
     )    
: const Center(child: Text("data not available")),
                const SizedBox(height: 20),
  ],
),
    );
  }
}

 
class MedicineCard extends StatelessWidget {
  final IconData iconPath;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String day;
  final String status;
  final IconData statusIcon;
  final Color statusColor;

  const MedicineCard({
    required this.iconPath,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.day,
    required this.status,
    required this.statusIcon,
    required this.statusColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.2),
            child: Icon(iconPath, color: iconColor, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text(subtitle,
                        style: const TextStyle(color: Colors.black54)),
                    const SizedBox(width: 8),
                    Text("Day $day",
                        style: const TextStyle(color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Icon(statusIcon, color: statusColor),
              Text(status, style: TextStyle(color: statusColor, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
