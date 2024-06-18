import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultScreen extends StatefulWidget {
  final String classificationResult;
  final String segmentationPath;
  final String originalImagePath;

  ResultScreen({required this.classificationResult, required this.segmentationPath, required this.originalImagePath});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String baseUrl = 'http://10.0.2.2:5000/';

  Future<void> fetchData() async {
    // Implement your HTTP request logic to fetch new data here
    // For example:
    // final response = await http.get('YOUR_API_ENDPOINT');
    // final data = json.decode(response.body);
    // Update the widget's state with the new data
    // setState(() {
    //   classificationResult = data['classificationResult'];
    //   segmentationPath = data['segmentationPath'];
    //   originalImagePath = data['originalImagePath'];
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Results'),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 20),
                  child: Text('Original Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Center(
                  child: Container(
                    width: 230,
                    height: 230,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        widget.originalImagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Text('Error loading image');
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text('Classification Result', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Text(widget.classificationResult, style: TextStyle(fontSize: 15)),

                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text('Segmentation Result', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                Center(
                  child: Container(
                    width: 230,
                    height: 230,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        widget.segmentationPath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Text('Error loading image', style: TextStyle(color: Colors.white));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
