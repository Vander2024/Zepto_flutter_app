import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:zepto_flutter_app/ui/home/home_viewmodel.dart';
import 'package:zepto_flutter_app/utils/colors.dart';
import 'package:zepto_flutter_app/utils/indicator.dart';

class DashboardStatsView extends HookViewModelWidget<HomeViewModel> {
  DashboardStatsView({
    Key? key,
  }) : super(key: key, reactive: false);

  late List<BarChartGroupData> rawBarGroups;

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    rawBarGroups = viewModel.getDasboardStatsdata();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: const <Widget>[
              Expanded(
                child: Text(
                  'Statistics',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              Indicator(
                color: myStatsColor,
                text: 'Mine',
                isSquare: true,
                size: 12,
                textSize: 12,
              ),
              SizedBox(
                width: 5,
              ),
              Indicator(
                color: classAverageColor,
                text: 'Average',
                isSquare: true,
                size: 12,
                textSize: 12,
              ),
              SizedBox(
                width: 5,
              ),
              Indicator(
                color: topperColor,
                text: 'Topper',
                isSquare: true,
                size: 12,
                textSize: 12,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: BarChart(
                  BarChartData(
                    minY: 0,
                    maxY: 100,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.grey,
                        getTooltipItem: (_a, _b, _c, _d) => null,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: bottomTitles,
                          reservedSize: 30,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 25,
                            getTitlesWidget: leftTitles),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: rawBarGroups,
                    gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 25),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    if (value == 0) {
      text = '0%';
    } else if (value == 25) {
      text = '25%';
    } else if (value == 50) {
      text = '50%';
    } else if (value == 75) {
      text = '75%';
    } else if (value == 100) {
      text = '100%';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff093358),
      fontWeight: FontWeight.bold,
      fontSize: 8,
    );
    int intValue = value.toInt();
    Widget text = Text(
      'Section $intValue',
      style: style,
    );
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SideTitleWidget(
        axisSide: meta.axisSide,
        space: 16,
        angle: 45,
        child: text,
      ),
    );
  }
}
