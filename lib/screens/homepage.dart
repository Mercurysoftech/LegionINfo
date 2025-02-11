// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ohs_app/screens/dashboardpage.dart';
import 'package:ohs_app/screens/notificationspage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Default is Home (index 0)
  final PageController _pageController = PageController(initialPage: 0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // Navigate to the respective page
  }

  // Custom method to return image assets based on selection
  Widget _buildIcon(String iconName, int index,String label) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,children: [
     Image.asset(
      _selectedIndex == index
          ? 'assets/${iconName}_filled.png' // Image when selected
          : 'assets/${iconName}_unfilled.png', // Image when unselected
      height: 22,
      width: 22,
    ),
     Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Poppins Medium',
          color: _selectedIndex == index ? Color(0xFF045D61) : Color(0xFF737373),
        ),
      ),
    ],
    );
    
  }
  Widget _buildNomalIcon(int index) {
  double scale = index == 2 ? 1.3 : 1.0; // Make the middle icon 1.5x bigger
  return Transform.scale(
    scale: scale,
    child: Image.asset(
      'assets/main_image.png',
      height: 45,
      width: 45,
    ),
  );
}

  List<Widget> _pages() {
    return [
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false, // Removes the back button
          toolbarHeight: 85,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/icon.png', height: 55, width: 55),
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/notification.png', height: 24, width: 24),
                  SizedBox(width: 20),
                  Image.asset(
                    'assets/user.png',
                    height: 24,
                    width: 24,
                  )
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FOR YOU',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCircularCard('25', 'Assigned', Color(0xFF464D93), 0.75),
                    _buildCircularCard('15', 'In Progress', Color(0xFF00C59B), 0.50),
                    _buildCircularCard('10', 'Pending', Color(0xFFA90541), 0.25),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  'OHS MODULES',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(height: 20),
                GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(
                          5.0), // Add padding around each card
                      child: _buildModuleCard([
                        'Permit to work',
                        'Man-Power Report',
                        'OHS-Card',
                        'OHS Inspection',
                        'Quality Inspection',
                        'Incident Modules'
                      ][index]),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      Scaffold(
        body: DashboardPage(),
      ),
      Scaffold(
        
      ),
      Scaffold(
        body: NotificationsPage(),
      ),
      Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Removes the back button
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(''),
        ),
        body: Center(child: Text('')),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        children: _pages(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFF8F9FE),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: _buildIcon('home', 0,'Home'), // Use custom icon for Home
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon:
                    _buildIcon('explore', 1,'Dashboard'), // Use custom icon for Categories
                onPressed: () => _onItemTapped(1),
              ),
              IconButton(
                icon:
                    _buildNomalIcon(2), // Use custom icon for Customise
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon:
                    _buildIcon('calander', 3,'Action'), // Use custom icon for Customise
                onPressed: () => _onItemTapped(3),
              ),
              IconButton(
                icon: _buildIcon('sheets', 4,'Report'), // Use custom icon for Orders
                onPressed: () => _onItemTapped(4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularCard(
      String count, String label, Color color, double progress) {
    return Column(
      mainAxisSize:
          MainAxisSize.min, // Make the column take only necessary space
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12), // Rounded corners
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(80, 80), // Size of the circle
                  painter: CircularProgressPainter(
                    progress: progress, // Pass the progress value
                    color: color, // Set the color of the progress
                  ),
                ),
                // Text count in the center of the circle
                Text(
                  count,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: color, // Color to match the progress
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8), // Space between the box and the label
        Text(
          label, // This is where the label text goes (e.g., "Assigned")
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color, // Matching color to the progress circle
          ),
        ),
      ],
    );
  }

  Widget _buildModuleCard(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF8F9FE),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text is now above the image
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Color(0xFF045D61)),
          ),
          SizedBox(height: 10),

          // Image displayed below the text
          Image.asset(
            'assets/file icon.png', // Path to your image in the assets folder
            width: 40, // Set the width
            height: 40, // Set the height
          ),
        ],
      ),
    );
  }
}

// Custom clipper to create a cut at the bottom of the progress bar
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    path.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: 3));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress; // Progress percentage (0.0 to 1.0)
  final Color color; // Progress color

  CircularProgressPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade300 // Light background color
      ..strokeWidth = 8 // Thickness of the circle
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = color // Progress color
      ..strokeWidth = 8 // Thickness of the progress arc
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 8;

    // Draw the full background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Calculate sweep angle for progress
    final double sweepAngle = 2 * 3.141592653589793 * progress;

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2, // Start from the top
      sweepAngle, // Sweep angle for progress
      false, // Don't draw as filled arc
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
