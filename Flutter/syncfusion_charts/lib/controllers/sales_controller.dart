import 'package:synfusion_charts/models/sales.dart';

class SalesController {
  static dynamic getSalesData() {
    return [
      SalesData('BMW', 20),
      SalesData('Mercedes', 30),
      SalesData('Audi', 25),
      SalesData('Ferrari', 40),
      SalesData('Nissan', 15),
    ];
  }
}
