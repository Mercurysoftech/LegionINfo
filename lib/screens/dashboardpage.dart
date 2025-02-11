import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
              'DASHBOARD',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Worked - Hrs Chart
            const Text(
              'Worked - Hrs',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: _buildLineChart(),
            ),
            const SizedBox(height: 16),

            // Statistics Section
            const Text(
              'Statistics',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 8),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 1.3, // Adjust size ratio
              children: [
                _buildStatCard('Work Permits ', '6999'),
                _buildStatCard('OHS Inspections', '6999'),
                _buildStatCard('Quality Inspections', '6999'),
                _buildStatCard('OHS Induction ', '6999'),
                _buildStatCard('TBT', '6999'),
                _buildStatCard('OHS Observation', '6999'),
                _buildStatCard('No. of NCRs', '6999'),
                _buildStatCard('No of Incidents', '6999'),
                _buildStatCard('No of Near-miss', '6999')
              ],
            ),
            const SizedBox(height: 16),

            // NCR Status Chart
            const Text(
              'NCR Status',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: _buildBarChart(),
            ),
          ],
        ),
      ),
    );
  }

  // Line Chart for Worked - Hrs
  Widget _buildLineChart() {
    List<_ChartData> chartData = [
      _ChartData('January', 2),
      _ChartData('February', 18),
      _ChartData('March', 8),
      _ChartData('April', 4),
      _ChartData('May', 12),
      _ChartData('June', 19),
      _ChartData('July', 14),
    ];

    return SfCartesianChart(
      title: ChartTitle(text: 'Worked Hours'),
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries<_ChartData, String>>[
        LineSeries<_ChartData, String>(
          dataSource: chartData,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          color: Colors.green,
        ),
      ],
    );
  }

  // Bar Chart for NCR Status
  Widget _buildBarChart() {
    List<_ChartData> barData = [
      _ChartData('Open', 10),
      _ChartData('In Progress', 25),
      _ChartData('Resolved', 15),
      _ChartData('Closed', 30),
    ];

    return SfCartesianChart(
      title: ChartTitle(text: 'NCR Status'),
      borderColor: Colors.grey,
      borderWidth: 0.5,
      primaryXAxis: CategoryAxis(
      majorGridLines: MajorGridLines(color: Colors.grey), // Set white color for X-axis grid lines
      minorGridLines: MinorGridLines(color: Colors.grey), // Set white color for minor X-axis grid lines
    ),
    primaryYAxis: NumericAxis(
      majorGridLines: MajorGridLines(color: Colors.grey), // Set white color for Y-axis grid lines
      minorGridLines: MinorGridLines(color: Colors.grey), // Set white color for minor Y-axis grid lines
    ),
    plotAreaBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
      series: <ChartSeries<_ChartData, String>>[
        ColumnSeries<_ChartData, String>(
          dataSource: barData,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          pointColorMapper: (_ChartData data, _) {
            // Map each data point to the corresponding color
            if (data.x == 'Open') return Colors.red;
            if (data.x == 'In Progress') return Colors.orange;
            if (data.x == 'Resolved') return Colors.green;
            if (data.x == 'Closed') return Colors.blue;
            return Colors.black; // Default color
          },
        ),
      ],
    );
  }

  // Statistics Card
  Widget _buildStatCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.all(2), // Add margin to give space between cards
      padding: const EdgeInsets.symmetric(
          vertical: 5, horizontal: 5), // Reduced padding for smaller size
      decoration: BoxDecoration(
        color: Color(0xFF045D61),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}

// Data model for charts
class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
