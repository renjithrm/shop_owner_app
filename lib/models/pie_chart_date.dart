import 'package:flutter/material.dart';

class ChartData {
  final String name;
  final double precent;
  final Color color;

  ChartData({required this.name, required this.precent, required this.color});
  static List<ChartData> data = [
    ChartData(name: "jan", precent: 10, color: Colors.red),
    ChartData(name: "feb", precent: 40, color: Colors.grey),
    ChartData(name: "Mar", precent: 60, color: Colors.green)
  ];
}
