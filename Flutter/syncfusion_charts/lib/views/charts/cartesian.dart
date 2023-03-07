import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:synfusion_charts/controllers/sales_controller.dart';
import 'package:synfusion_charts/models/sales.dart';

class CartesianChart extends StatelessWidget {
  const CartesianChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cartesian Chart"),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: SafeArea(
                child: SfCartesianChart(
                  title: ChartTitle(text: "Car Sales"),
                  primaryXAxis:
                      CategoryAxis(title: AxisTitle(text: "Car Names")),
                  primaryYAxis:
                      NumericAxis(title: AxisTitle(text: "Sales in Millions")),
                  legend:
                      Legend(isVisible: true, position: LegendPosition.bottom),
                  series: <ChartSeries>[
                    ColumnSeries<SalesData, String>(
                      name: "Cars",
                      dataSource: SalesController.getSalesData(),
                      xValueMapper: (SalesData sales, _) => sales.x,
                      yValueMapper: (SalesData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.middle),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
