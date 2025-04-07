import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 20),
          const Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          _buildSettingsItem(Icons.notifications_none, "Notification", "Check your medicine notification"),
          _buildSettingsItem(Icons.volume_up_outlined, "Sound", "Ring, Silent, Vibrate"),
          _buildSettingsItem(Icons.person_outline, "Manage Your Account", "Password, Email ID, Phone Number"),
          _buildSettingsItem(Icons.notifications_none, "Notification", "Check your medicine notification"),
          _buildSettingsItem(Icons.notifications_none, "Notification", "Check your medicine notification"),
          const SizedBox(height: 20),
          const Text("Device", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          _buildDeviceCard(),
             const SizedBox(height: 20),
          _buildCaretakerSection(),
          const SizedBox(height: 20),
          _buildDoctorCard(),
          const SizedBox(height: 20),
          _buildFooterOptions(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage('assets/user.jpg'), // Replace with actual image
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Take Care!", style: TextStyle(color: Colors.grey, fontSize: 14)),
            SizedBox(height: 4),
            Text("Richa Bose", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, size: 28),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      onTap: () {},
    );
  }

  Widget _buildDeviceCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.wifi),
            title: const Text("Connect"),
            subtitle: const Text("Bluetooth, Wi-Fi", style: TextStyle(fontSize: 12)),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.volume_up_outlined),
            title: const Text("Sound Option"),
            subtitle: const Text("Ring, Silent, Vibrate", style: TextStyle(fontSize: 12)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
 
  Widget _buildCaretakerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Caretakers: 03", style: TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFE9F0FE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              _buildCaretaker("Dipa Luna", "assets/user1.png"),
              _buildCaretaker("Roz Sod..", "assets/user2.png"),
              _buildCaretaker("Sunny Tu..", "assets/user3.png"),
              _buildAddButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCaretaker(String name, String imagePath) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 25),
          const SizedBox(height: 6),
          Text(name, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Expanded(
      child: Column(
        children: const [
          CircleAvatar(child: Icon(Icons.add), radius: 25),
          SizedBox(height: 6),
          Text("Add", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildDoctorCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Doctor", style: TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFE9F0FE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: const [
              Icon(Icons.add, size: 30, color: Colors.blue),
              SizedBox(height: 10),
              Text("Add Your Doctor", style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
              Text("Or use ", style: TextStyle(fontSize: 12)),
              Text("invite link", style: TextStyle(fontSize: 12, color: Colors.orange)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooterOptions(BuildContext context) {
    return Column(
      children: [
        const ListTile(title: Text("Privacy Policy")),
        const ListTile(title: Text("Terms of Use")),
        const ListTile(title: Text("Rate Us")),
        const ListTile(title: Text("Share")),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.black12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          ),
          child: const Text("Log Out"),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

}
