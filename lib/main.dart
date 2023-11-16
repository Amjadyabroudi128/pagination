import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "table pagination"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataTableSource _data = MyDate();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PaginatedDataTable(
              columns: [
                DataColumn(label: Text("ID")),
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("price")),
              ],
              source: _data,
              header: const Center(child: Text('My Products')),
              columnSpacing: 100,
              horizontalMargin: 60,
              rowsPerPage: 8,
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
 class MyDate extends DataTableSource{
   final List<Map<String, dynamic>> _data = List.generate(
    200,
      (index) => {
      "id": index,
        "title": "Item $index",
      "price": Random().nextInt(1000),
      }
  );
  @override
  DataRow? getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(_data[index]['id'].toString())) ,
        DataCell(Text(_data[index]["title"])),
        DataCell(Text(_data[index]["price"].toString())),
      ]
    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

 }