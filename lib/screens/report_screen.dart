import 'package:chikista_io/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {

  int selectedDayIndex = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text("Report", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
                reportSummaryCard(),
                dashboardCard(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Check History", style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios, size: 14)
                    ],
                  ),
                ),
                dateSelector(),
                 selectedDayIndex == 6 // SATURDAY (index 6)
              ?
              Column(
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
          ),],
              )
            : const Center(child: Text("data not available")),
                const SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget reportSummaryCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Today's Report", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _ReportCount(title: "Total", count: 5),
              _ReportCount(title: "Taken", count: 3),
              _ReportCount(title: "Missed", count: 1),
              _ReportCount(title: "Snoozed", count: 1),
            ],
          ),
        ],
      ),
    );
  }

  Widget dashboardCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Check Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text(
                  "Here you will find everything related to your active and past medicines.",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          const Icon(Icons.pie_chart_outline_rounded, color: Colors.indigo, size: 40),
        ],
      ),
    );
  }

Widget dateSelector() {
  List<String> days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        bool isSelected = index == selectedDayIndex;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDayIndex = index;
            });
          },
          child: Column(
            children: [
              Text(
                days[index],
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.indigo : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 4),
              CircleAvatar(
                radius: 16,
                backgroundColor:
                    isSelected ? Colors.indigo : Colors.grey.shade200,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    ),
  );}}

class _ReportCount extends StatelessWidget {
  final String title;
  final int count;

  const _ReportCount({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$count", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
