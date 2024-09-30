import 'package:eco_grow/core/constants/app_color.dart';
import 'package:eco_grow/core/constants/app_style.dart';
import 'package:flutter/material.dart';

class MyDataTable extends StatelessWidget {
  final List<Map<String, dynamic>> data; // Dữ liệu đầu vào

  const MyDataTable({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Data Table'),
        ),
        body: ListView(
          children: [
            _buildDonateTable(),
          ],
        ),
      ),
    );
  }

   _buildDonateTable() {
    return DataTable(
            headingRowColor:
                const WidgetStatePropertyAll(AppColor.accentColor),
            columns: const [
              DataColumn(
                label: Text(
                  'Header 1',
                  style: AppStyle.headerTableText, // Màu chữ
                ),
              ),
              DataColumn(
                label: Text(
                  'Header 2',
                  style: AppStyle.headerTableText, // Màu chữ
                ),
              ),
              DataColumn(
                label: Text(
                  'Header 3',
                  style: AppStyle.headerTableText, // Màu chữ
                ),
              ),
              DataColumn(
                label: Text(
                  'Header 4',
                  style: AppStyle.headerTableText, // Màu chữ
                ),
              ),
              DataColumn(
                label: Text(
                  'Header 5',
                  style: AppStyle.headerTableText, // Màu chữ
                ),
              ),
            ],
            rows: List.generate(data.length, (index) {
              final row = data[index];
              return DataRow(
                color: WidgetStateProperty.all(
                  index % 2 == 0 ? Colors.grey[200] : Colors.white,
                ),
                cells: [
                  DataCell(Text(row['column1'].toString())),
                  DataCell(Text(row['column2'].toString())),
                  DataCell(Text(row['column3'].toString())),
                  DataCell(Text(row['column4'].toString())),
                  DataCell(Text(row['column5'].toString())),
                ],
              );
            }),
          );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: MyDataTable(
          data: List.generate(
              100,
              (index) => {
                    'column1': 'Data $index - 1',
                    'column2': 'Data $index - 2',
                    'column3': 'Data $index - 3',
                    'column4': 'Data $index - 4',
                    'column5': 'Data $index - 5',
                  })),
    ),
  );
}
