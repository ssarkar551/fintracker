import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Your spends for June: 30,000'),
            PieChart(dataMap: dataMap,
                    animationDuration: const Duration(milliseconds: 800),
                    chartRadius: MediaQuery.of(context).size.width / 5,),
            DataTable(columns: const<DataColumn>[
              DataColumn(label: Text('ID'),),
              DataColumn(label: Text('Category'),),
              DataColumn(label: Text('Amount'),),
            ]
            , rows: const<DataRow>[
              DataRow(cells: <DataCell>[
                DataCell(Text('1')),
                DataCell(Text('Shopping')),
                DataCell(Text('2000')),
              ],),
              DataRow(cells: <DataCell>[
                DataCell(Text('2')),
                DataCell(Text('Credit Card')),
                DataCell(Text('3000')),
              ],),
              DataRow(cells: <DataCell>[
                DataCell(Text('3')),
                DataCell(Text('Movie')),
                DataCell(Text('4000')),
              ],),
            ])
            
          ],
            
        ),
      ),
    );
  }
}
