import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'access_features_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Example dynamic weather data (Replace with API later)
  String weatherCondition = "Sunny";
  String temperature = "28°C";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Greeting & Weather section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi,", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    SizedBox(height: 5),
                    Text("Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text(
                      "Healthy soil, healthy future.",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.grey.shade700),
                    ),
                  ],
                ),
                // Weather Information
                Row(
                  children: [
                    Icon(FluentSystemIcons.ic_fluent_weather_sunny_regular, color: Colors.orange, size: 30),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(weatherCondition, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                        Text(temperature, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey.shade700)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Icon(FluentSystemIcons.ic_fluent_search_regular, color: Colors.grey.shade600),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Search...", border: InputBorder.none),
                      onSubmitted: (value) {
                        // Implement search functionality here
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Dashboard Poster (Clickable)
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
              },
              child: Container(
                height: 150,
                width: double.infinity,

                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/dashboard_poster.jpg"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.greenAccent
                ),
                child: Center(
                  child: Text("Go to Dashboard", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Access Features Slider

            
            AccessFeaturesScreen(),
          ],
        ),
      ),
    );
  }
}
