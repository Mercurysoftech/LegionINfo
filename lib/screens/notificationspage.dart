import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});

  // List of notification data
  final List<Map<String, String>> notifications = [
    {
      'title': "Excavation Permit-49",
      'project': "Project: Pfizer",
      'createdBy': "Created by: Thambi",
      'createdOn': "Created on: 20-12-2024"
    },
    {
      'title': "Construction Permit-10",
      'project': "Project: AstraZeneca",
      'createdBy': "Created by: John Doe",
      'createdOn': "Created on: 18-12-2024"
    },
    {
      'title': "Survey Request-21",
      'project': "Project: Moderna",
      'createdBy': "Created by: Jane Smith",
      'createdOn': "Created on: 15-12-2024"
    },
    {
      'title': "Site Visit Report-33",
      'project': "Project: Siemens",
      'createdBy': "Created by: Mike Taylor",
      'createdOn': "Created on: 10-12-2024"
    },
    {
      'title': "Safety Inspection-07",
      'project': "Project: Johnson & Johnson",
      'createdBy': "Created by: Sarah Lee",
      'createdOn': "Created on: 05-12-2024"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end, // Align text to the end
          children: const [
            Text(
              'NOTIFICATION',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Color(0xFF045D61)
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "NOTIFICATION",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Change this to dynamic if needed
                itemBuilder: (context, index) {
                  return _buildNotificationCard(notifications[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, String> notification) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Colored Section with Rounded Edges
          Container(
            width: 80, // Adjust width to match image
            height: 80, // Adjust height to match image
            decoration: const BoxDecoration(
              color: Color(0xFF045D61),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/notification_image.png', // Replace with your correct asset path
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Text Section (No Padding applied here)
          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5), // Adjust the value as needed
                Text(
                  notification['title']!, // Use dynamic title from the map
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 4),
                Text(
                  notification[
                      'project']!, // Use dynamic project name from the map
                  style: const TextStyle(
                      fontSize: 13, color: Colors.black, fontFamily: 'Poppins'),
                ),
                Text(
                  notification[
                      'createdBy']!, // Use dynamic created by from the map
                  style: const TextStyle(
                      fontSize: 13, color: Colors.black, fontFamily: 'Poppins'),
                ),
                Text(
                  notification[
                      'createdOn']!, // Use dynamic created on from the map
                  style: const TextStyle(
                      fontSize: 13, color: Colors.black, fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 5), // Adjust the value as needed
              ],
            ),
          )
        ],
      ),
    );
  }
}
