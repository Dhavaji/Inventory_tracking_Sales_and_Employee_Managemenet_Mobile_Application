class SalesData{

      final String month;
      final int sales;
      SalesData(this.month , this.sales);

      SalesData.fromMap(Map<String, dynamic> map)
                : assert(map['month'] != null),
                  assert(map['sales'] != null),
                  month = map['month'],
                  sales = map['sales'];

      @override
      String toString() => "Record<$month:$sales>";

}