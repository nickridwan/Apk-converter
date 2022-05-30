import 'package:flutter/material.dart';
import './drawer_page.dart';

class converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<converter> {
  @override
  void initState() {
    userInput = 0;
    super.initState();
  }

  double? userInput;
  String? _startMeasure;
  String? _convertMeasure;
  String? resultMessage;

  final List<String> measures = [
    "Massa",
    "Jarak",
    "Uang",
    "Area",
    "Volume",
    "Waktu",
  ];

  final Map<String, int> measuresMap = {
    "Massa": 0,
    "Jarak": 1,
    "Uang": 2,
    "Area": 3,
    "Volume": 4,
    "Waktu": 5,
  };

  void converJarak(int jarak) {
    int km = jarak;
    int hm = km * 10;
    int dam = hm * 10;
    int m = dam * 10;
    int dm = m * 10;
    int cm = dm * 10;
    int mm = cm * 10;
    resultMessage = '$km km\n$hm hm\n$dam dam\n$m m\n$dm dm\n$cm cm\n$mm mm';
  }

  void converMassa(int massa) {
    int kg = massa;
    int hg = kg * 10;
    int dag = hg * 10;
    int g = dag * 10;
    int dg = g * 10;
    int cg = dg * 10;
    int mg = cg * 10;
    resultMessage = '$kg kg\n$hg hg\n$dag dag\n$g g\n$dg gd\n$cg cg\n$mg mg';
  }

  void converTime(int time) {
    int year = time;
    int mounth = year * 12;
    int week = mounth * 7;
    int day = week * 24;
    int hours = day * 24;
    int minute = hours * 60;
    int second = minute * 60;
    resultMessage = '$year year\n$mounth mounth\n$week week\n$day day\n$hours hours\n$minute minute\n$second second';
  }

  void converArea(int area) {
    int km2 = area;
    int hm2 = km2 * 100;
    int dam2 = hm2 * 100;
    int m2 = dam2 * 100;
    int dm2 = m2 * 100;
    int cm2 = dm2 * 100;
    int mm2 = cm2 * 100;
    resultMessage =
    "$km2 km2\n$hm2 hm2\n$dam2 dam2\n$m2 m2\n$dm2 dm2\n$cm2 cm2\n$mm2 mm2";
  }

  void converVolume(int volume) {
    int km3 = volume;
    int hm3 = km3 * 1000;
    int dam3 = hm3 * 1000;
    int m3 = dam3 * 1000;
    int dm3 = m3 * 1000;
    int cm3 = dm3 * 1000;
    int mm3 = cm3 * 1000;
    resultMessage =
    "$km3 km3\n$hm3 hm3\n$dam3 dam3\n$m3 m3\n$dm3 dm3\n$cm3 cm3\n$mm3 mm3";
  }

  void converMoney(int rupiah) {
    double dolar = rupiah * 0.000070;
    double ringgit = rupiah * 0.00030;
    double Dinar = rupiah * 0.010;
    double Yen = rupiah * 0.0089;
    double Rubel = rupiah * 0.0055;
    double Riyal = rupiah * 0.00026;
    double Pound = rupiah * 0.0013;
    resultMessage =
    "$dolar dolar\n$ringgit ringgit\n$Dinar Dinar\n$Yen Yen\n$Rubel Rubel\n$Riyal Riyal\n$Pound Pound";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
            child: Text("Measure Converter",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (text) {
                    var input = double.tryParse(text);
                    if (input != null)
                      setState(() {
                        userInput = input;
                      });
                  },
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: "Masukkan nilai",
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Pilih",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton(
                    value: _startMeasure,
                    isExpanded: true,
                    dropdownColor: Colors.teal[400],
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    hint: Text(
                      "Choose a unit",
                    ),
                    items: measures.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        print(value);
                        _startMeasure = value as String;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_startMeasure != null ||
                          _convertMeasure != null ||
                          userInput != 0) {
                        // convert(userInput!, _startMeasure!, _convertMeasure!);
                        if (_startMeasure == 'Massa') {
                          converMassa(userInput?.toInt() ?? 0);
                        } else if (_startMeasure == 'Jarak') {
                          converJarak(userInput?.toInt() ?? 0);
                        } else if (_startMeasure == "Uang") {
                          converMoney(userInput?.toInt() ?? 0);
                        } else if (_startMeasure == "Waktu") {
                          converTime(userInput?.toInt() ?? 0);
                        } else if (_startMeasure == "Area") {
                          converArea(userInput?.toInt() ?? 0);
                        } else {
                          converVolume(userInput?.toInt() ?? 0);
                        }
                      }
                    },
                    child: Center(
                      child: Text("convert",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  resultMessage ?? '',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
