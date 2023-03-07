import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:synfusion_charts/controllers/gdp_controller.dart';
import 'package:synfusion_charts/models/gdp.dart';

class CircularChart extends StatelessWidget {
  CircularChart({Key? key}) : super(key: key);

  final TooltipBehavior _behavior = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Circular Chart"),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SfCircularChart(
          title: ChartTitle(
              text: "Continent wise GDP - 2021\n(in billions of USD)"),
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _behavior,
          series: <CircularSeries>[
            // PieSeries<GDPData, String>(
            // DoughnutSeries<GDPData, String>(
            RadialBarSeries<GDPData, String>(
              dataSource: GDPController.getGDPData(),
              xValueMapper: (GDPData data, _) => data.continent,
              yValueMapper: (GDPData data, _) => data.gdp,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              enableTooltip: true,
              maximumValue: 40000,
            ),
          ],
        ),
      ),
    );
  }
}
