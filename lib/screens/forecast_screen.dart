import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:clima/mobile.dart';
import 'package:flutter/services.dart' show rootBundle;


List forecast1;
class ForecastScreen extends StatefulWidget {
  ForecastScreen({this.forecast}){
    forecast1=forecast;
  }
  final List forecast;

@override
  _ForecastScreenState createState() => _ForecastScreenState();
}



class _ForecastScreenState extends State<ForecastScreen> {

  final List<Feature> features = [
    Feature(
      title: "Humidity",
      color: Colors.blue,
      data: [forecast1[0]['main']['humidity']/100, forecast1[1]['main']['humidity']/100, forecast1[2]['main']['humidity']/100, forecast1[3]['main']['humidity']/100, forecast1[4]['main']['humidity']/100],
    ),

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(forecast1[0]['main']);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Stack(
        children: [Container(
          height: 100.0,
          width: 300.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueGrey.shade900,
          ),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('images/city_screen.jpeg'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Chances of rain",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: LineGraph(
                    features: features,
                    size: Size(320, 350),
                    labelX: ['Today', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
                    labelY: ['25%', '45%', '65%', '75%', '85%', '100%'],
                    showDescription: true,
                    graphColor: Colors.white,
                  ),
                ),
                Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 3.0,
                          )
                      ),

                      Text(
                        ' Forecast (next 5 days): ',
                        style: kTempTextStyle,
                      ),
                      Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 3.0,
                          )
                      ),
                    ]
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0, top: 20.0,left: 0.0,right: 0.0 ),
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.zero,bottomRight: Radius.zero, topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0),),
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Min: ${forecast1[0]['main']['temp_min'].toInt().toString()}",
            style: TextStyle(
            fontSize: 18,
                          ),
                            ),
                            Text("Max: ${forecast1[0]['main']['temp_max'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text("Feels: ${forecast1[0]['main']['feels_like'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),
                            ),
                            Text("Avg: ${forecast1[0]['main']['temp'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Min: ${forecast1[1]['main']['temp_min'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),
                            ),
                            Text("Max: ${forecast1[1]['main']['temp_max'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),
                            ),
                            Text("Feels: ${forecast1[1]['main']['feels_like'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                            Text("Avg: ${forecast1[1]['main']['temp'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.zero,bottomLeft: Radius.zero, topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0),),
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Min: ${forecast1[2]['main']['temp_min'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                            Text("Max: ${forecast1[2]['main']['temp_max'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                            Text("Feels: ${forecast1[2]['main']['feels_like'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                            Text("Avg: ${forecast1[2]['main']['temp'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.zero,bottomRight: Radius.zero, topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0),),
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Min: ${forecast1[3]['main']['temp_min'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                            Text("Max: ${forecast1[3]['main']['temp_max'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                            Text("Feels: ${forecast1[3]['main']['feels_like'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                            Text("Avg: ${forecast1[3]['main']['temp'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                          ],
                        ),
                      ),
                    ),
                    Container(height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.zero,bottomLeft: Radius.zero, topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0),),
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Min: ${forecast1[4]['main']['temp_min'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                            Text("Max: ${forecast1[4]['main']['temp_max'].toInt().toString()}",style: TextStyle(
                              fontSize: 18,

                            ),),
                            Text("Feels: ${forecast1[4]['main']['feels_like'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),),
                            Text("Avg: ${forecast1[4]['main']['temp'].toInt().toString()}",
                              style: TextStyle(
                                fontSize: 18,

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    onPressed: () {
                      _createPDF();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Icon(

                        Icons.save_alt_rounded,
                        size: 40.0,
                      ),
                    ),
                  ),
                ),
                Text("[Download as pdf]",style: TextStyle(
                  fontSize: 18,
                ),
                ),
              ],
            ),
          ),
        ),],
      ),
    );
  }
  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    page.graphics.drawImage(PdfBitmap(await _readImageData("logo.png")),
        Rect.fromLTWH(10, 300, 440, 200));
    page.graphics.drawString("Mausam\nThe forecast\nfor the next\n5 days is as\nfollows: ", PdfStandardFont(PdfFontFamily.helvetica, 60));

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
      font: PdfStandardFont(PdfFontFamily.helvetica, 30),
      cellPadding: PdfPaddings(left: 5,right: 2, top: 2, bottom: 2));
    grid.columns.add(count: 5);
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = "Today";
    header.cells[1].value = "Day 2";
    header.cells[2].value = "Day 3";
    header.cells[3].value = "Day 4";
    header.cells[4].value = "Day 5";
    PdfGridRow row = grid.rows.add();
    row.cells[0].value = "Max: ${forecast1[0]['main']['temp_max'].toInt().toString()}";
    row.cells[1].value = "Max: ${forecast1[1]['main']['temp_max'].toInt().toString()}";
    row.cells[2].value = "Max: ${forecast1[2]['main']['temp_max'].toInt().toString()}";
    row.cells[3].value = "Max: ${forecast1[3]['main']['temp_max'].toInt().toString()}";
    row.cells[4].value = "Max: ${forecast1[4]['main']['temp_max'].toInt().toString()}";
    row = grid.rows.add();
    row.cells[0].value = "Min: ${forecast1[0]['main']['temp_min'].toInt().toString()}";
    row.cells[1].value = "Min: ${forecast1[1]['main']['temp_min'].toInt().toString()}";
    row.cells[2].value = "Min: ${forecast1[2]['main']['temp_min'].toInt().toString()}";
    row.cells[3].value = "Min: ${forecast1[3]['main']['temp_min'].toInt().toString()}";
    row.cells[4].value = "Min: ${forecast1[3]['main']['temp_min'].toInt().toString()}";
    row = grid.rows.add();
    row.cells[0].value = "Feels: ${forecast1[0]['main']['feels_like'].toInt().toString()}";
    row.cells[1].value = "Feels: ${forecast1[1]['main']['feels_like'].toInt().toString()}";
    row.cells[2].value = "Feels: ${forecast1[2]['main']['feels_like'].toInt().toString()}";
    row.cells[3].value = "Feels: ${forecast1[3]['main']['feels_like'].toInt().toString()}";
    row.cells[4].value = "Feels: ${forecast1[4]['main']['feels_like'].toInt().toString()}";
    row = grid.rows.add();
    row.cells[0].value = "Avg: ${forecast1[0]['main']['temp'].toInt().toString()}";
    row.cells[1].value = "Avg: ${forecast1[1]['main']['temp'].toInt().toString()}";
    row.cells[2].value = "Avg: ${forecast1[2]['main']['temp'].toInt().toString()}";
    row.cells[3].value = "Avg: ${forecast1[3]['main']['temp'].toInt().toString()}";
    row.cells[4].value = "Avg: ${forecast1[4]['main']['temp'].toInt().toString()}";
    row = grid.rows.add();
    row.cells[0].value = "Avg: ${forecast1[0]['main']['temp'].toInt().toString()}";
    row.cells[1].value = "Avg: ${forecast1[1]['main']['temp'].toInt().toString()}";
    row.cells[2].value = "Avg: ${forecast1[2]['main']['temp'].toInt().toString()}";
    row.cells[3].value = "Avg: ${forecast1[3]['main']['temp'].toInt().toString()}";
    row.cells[4].value = "Avg: ${forecast1[4]['main']['temp'].toInt().toString()}";

    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

    List<int> bytes = document.save();
    document.dispose();
    saveAndLaunchFile(bytes, "Output.pdf");

  }
}

Future<Uint8List> _readImageData(String name) async{
 final data = await rootBundle.load('images/$name');
 return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
