import 'package:flutter/material.dart';

void main() {
  runApp(Mtk());
}

class Mtk extends StatefulWidget {
  @override
  State<Mtk> createState() => _MtkState();
}

class _MtkState extends State<Mtk> {
  final massa = TextEditingController();
  final percepatan = TextEditingController();

  String hasil = '0 N';
  String perhitungan = 'Masukkan angka terlebih dahulu';

  void hitungGaya() {
    double? m = double.tryParse(massa.text);
    double? a = double.tryParse(percepatan.text);

    if (m == null || a == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Masukkan angka yang valid!'),
        ),
      );
      return;
    }

    double gaya = m * a;

    setState(() {
      hasil = '$gaya N';
      perhitungan = '$m × $a = $gaya';
    });
  }

  @override
  void dispose() {
    massa.dispose();
    percepatan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF0F5FF),
        appBar: AppBar(
          title: Text(
            'Gaya',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFF3155C6),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 15),
                Icon(
                  Icons.speed,
                  size: 70,
                  color: Color(0xFF3155C6),
                ),
                SizedBox(height: 10),
                Text(
                  'Menghitung Gaya',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF243B7A),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Masukkan nilai massa dan percepatan',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.1),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Massa (m) dalam kg',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: massa,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Contoh: 10',
                          prefixIcon: Icon(
                            Icons.fitness_center,
                            color: Color(0xFF3155C6),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF0F5FF),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Percepatan (a) dalam m/s²',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: percepatan,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Contoh: 2',
                          prefixIcon: Icon(
                            Icons.speed,
                            color: Color(0xFF3155C6),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF0F5FF),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: hitungGaya,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF3155C6),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Hitung Gaya',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Center(
                        child: Text(
                          'HASIL PERHITUNGAN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Center(
                        child: Text(
                          'F = m × a',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF243B7A),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Center(
                        child: Text(
                          perhitungan,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFF3155C6),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Gaya yang dihasilkan',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              hasil,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Belajar Fisika Jadi Lebih Mudah!',
                  style: TextStyle(
                    color: Color(0xFF65749B),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
