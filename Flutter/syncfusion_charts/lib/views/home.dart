import 'package:flutter/material.dart';
import 'package:synfusion_charts/views/charts/cartesian.dart';
import 'package:synfusion_charts/views/charts/circular.dart';
import 'package:synfusion_charts/views/charts/funnel.dart';
import 'package:synfusion_charts/views/charts/pyramid.dart';
import 'package:synfusion_charts/views/charts/sparkarea.dart';
import 'package:synfusion_charts/views/charts/sparkbar.dart';
import 'package:synfusion_charts/views/charts/sparkline.dart';
import 'package:synfusion_charts/views/charts/sparkwinloss.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void goTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Syncfusion Flutter Charts")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text("Cartesian"),
                onPressed: () => goTo(context, const CartesianChart()),
              ),
              ElevatedButton(
                child: const Text("Circular"),
                onPressed: () => goTo(context, CircularChart()),
              ),
              ElevatedButton(
                child: const Text("Pyramid"),
                onPressed: () => goTo(context, const PyramidChart()),
              ),
              ElevatedButton(
                child: const Text("Funnel"),
                onPressed: () => goTo(context, const FunnelChart()),
              ),
              ElevatedButton(
                child: const Text("SparkLine"),
                onPressed: () => goTo(context, const SparkLineChart()),
              ),
              ElevatedButton(
                child: const Text("SparkArea"),
                onPressed: () => goTo(context, const SparkAreaChart()),
              ),
              ElevatedButton(
                child: const Text("SparkBar"),
                onPressed: () => goTo(context, const SparkBarChart()),
              ),
              ElevatedButton(
                child: const Text("SparkWinLoss"),
                onPressed: () => goTo(context, const SparkWinLossChart()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
