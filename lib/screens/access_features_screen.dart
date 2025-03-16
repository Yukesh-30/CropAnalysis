import 'package:flutter/material.dart';
import 'feature_details_screen.dart';
import 'view_all_features_screen.dart'; // New screen for "View All" functionality

class AccessFeaturesScreen extends StatelessWidget {
  final List<Map<String, String>> features = [
    {"title": "Crop Prediction", "image": "assets/crop_prediction.jpg"},
    {"title": "Pest Control", "image": "assets/pest_control.jpg"},
    {"title": "Fertilizer Guide", "image": "assets/fertilizer_guide.jpg"},
    {"title": "Weather Forecast", "image": "assets/weather_forecast.jpg"},
    {"title": "Soil Health", "image": "assets/soil_health.jpg"},
    {"title": "Irrigation Tips", "image": "assets/irrigation_tips.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Header with "View All" button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Access Features",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to a new page that lists all features
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewAllFeaturesScreen(features: features),
                    ),
                  );
                },
                child: Text(
                  "View All",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),

        // Horizontal scrollable feature list
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: features.length > 4 ? 4 : features.length, // Show only first 4 in slider
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeatureDetailsScreen(title: features[index]["title"]!),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(features[index]["image"]!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: Text(
                      features[index]["title"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
