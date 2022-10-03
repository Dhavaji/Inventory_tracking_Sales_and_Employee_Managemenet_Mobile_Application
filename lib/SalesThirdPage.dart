import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fl_chart/fl_chart.dart';


class SalesThird extends StatefulWidget {
  const SalesThird({Key? key}) : super(key: key);


  @override
  _SalesThirdState createState() => _SalesThirdState();
}

class _SalesThirdState extends State<SalesThird> {

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  void initState(){
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Expanded(
        flex: 3,
        child: Column(
          children: [
            SizedBox(
              height: 4,
            ),
            LimitedBox(
              maxHeight: 250,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                color: const Color(0xff020227),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: LineChart(
                    LineChartData(
                        minX: 0,
                        maxX: 18,
                        minY: 0,
                        maxY: 8,
                        gridData: FlGridData(
                          show: true,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: const Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                          drawVerticalLine: true,
                          getDrawingVerticalLine: (value) {
                            return FlLine(
                              color: const Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: const Color(0xff37434d), width: 1),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 3),
                              FlSpot(2.6,2),
                              FlSpot(4.9, 5),
                              FlSpot(6.8, 2.5),
                              FlSpot(8, 4),
                              FlSpot(9.5, 3),
                              FlSpot(11, 4),
                            ],
                            isCurved: true,
                            colors: gradientColors,
                            barWidth: 5,
                            belowBarData: BarAreaData(
                              show: true,
                              colors: gradientColors
                                  .map((color) => color.withOpacity(0.3))
                                  .toList(),
                            ),
                          )
                        ]
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SfCircularChart(
                            title:
                            ChartTitle(text: "Number of Sales done by a Month" , textStyle: TextStyle(fontWeight: FontWeight.bold , fontSize: 18)),
                            legend:
                            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
                            tooltipBehavior: _tooltipBehavior,
                            series: <CircularSeries>[
                              RadialBarSeries<GDPData , String>(
                                dataSource: _chartData,
                                xValueMapper: (GDPData data,_) => data.Month,
                                yValueMapper: (GDPData data,_) => data.Sales,
                                dataLabelSettings: DataLabelSettings(isVisible: true,),
                                enableTooltip: true,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
              ),
            ),

          ],
        ),
      ),
    ),
    );
  }
  List<GDPData> getChartData(){
    final List<GDPData>  chartData = [
      GDPData('January', 8700),
      GDPData('February', 1500),
      GDPData('March', 2300),
      GDPData('April', 34390),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.Month , this.Sales);
  final String Month;
  final int Sales;
}