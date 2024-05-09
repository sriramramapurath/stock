import 'package:flutter/material.dart';

class PredictPage extends StatelessWidget {
  final List<double> predictions;

  // Constructor to accept the predictions list
  PredictPage({required this.predictions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predictions'),
      ),
      body: ListView.builder(
        itemCount: predictions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'Prediction ${index + 1}: ${predictions[index].toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
          );
        },
      ),
    );
  }
}
