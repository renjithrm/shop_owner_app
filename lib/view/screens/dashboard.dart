import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/models/pie_chart_date.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: padding,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                // color: Colors.amber,
                height: 300,
                child: PieChart(
                  PieChartData(
                    sections: sectionData(),
                    sectionsSpace: 0,
                    centerSpaceRadius: 60,
                  ),
                  swapAnimationCurve: Curves.easeInOutCirc,
                  swapAnimationDuration: const Duration(seconds: 3),
                )),
            columDiv(10),
            showIdicators(),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> sectionData() => ChartData.data
      .asMap()
      .map<int, PieChartSectionData>((key, value) {
        final data = PieChartSectionData(
            color: value.color,
            title: value.precent.toString(),
            value: value.precent);
        return MapEntry(key, data);
      })
      .values
      .toList();

  Widget showIdicators() => Container(
        // color: Colors.blue,
        height: 200,
        child: Column(
          children: ChartData.data
              .map((data) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: showColorsDetials(
                          color: data.color, title: data.name),
                    ),
                  ))
              .toList(),
        ),
      );
  Widget showColorsDetials({
    required color,
    required title,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 7,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: GoogleFonts.roboto(),
            ),
          )
        ],
      );
}
