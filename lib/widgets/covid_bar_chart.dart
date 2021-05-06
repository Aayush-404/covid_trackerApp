import 'package:covid_tracker_app/config/styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CovidBarChart extends StatelessWidget {
  final List<double>covidCases;
  const CovidBarChart({@required this.covidCases});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.0,
        decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
          )
        ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Daily new cases',
              style: TextStyle(
                  fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: BarChart(
                BarChartData(
              minY: 16,
                  barTouchData: BarTouchData(enabled: false,),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      margin: 25.0,
                      showTitles: true,
                      getTextStyles: ,
                      getTitles:(double value){
                        switch (value.toInt()){
                          case 0:
                            return 'May24';
                          case 1:
                            return 'May23';
                          case 2:
                            return 'May22';
                          case 4:
                            return 'May21';
                          case 5:
                            return 'May20';
                          default:
                            return '';
                        }
                      } ,
                    )
                  ),
                  barGroups: covidCases.asMap().map((key, value) => MapEntry(
                      key,
                      BarChartGroupData(
                        x: key,
                        barRods: [
                          BarChartRodData(
                            y: value,
                          )
                        ],
                      )
                  )
                  ).values.
                  toList(),
            ),
            ),
          )
        ],
      ),
    );
  }
}
