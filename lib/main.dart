// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xffF1F8F4),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff7FB77E)),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff7FB77E),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff9ED2A0),
            foregroundColor: Colors.black87,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  void login() {
    if (userController.text == "tugas2" && passController.text == "tugas2") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Username atau Password salah")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Card(
          elevation: 6,
          margin: EdgeInsets.all(25),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Login Sistem",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: userController,
                  decoration: InputDecoration(labelText: "Username"),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: login, child: Text("Login")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  Widget tombolMenu(BuildContext context, String judul, Widget halaman) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: 260,
        child: ElevatedButton(
          child: Text(judul, style: TextStyle(fontSize: 16)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => halaman),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu Utama")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            tombolMenu(context, "Data Kelompok", DataKelompok()),
            tombolMenu(context, "Penjumlahan & Pengurangan", HitungPage()),
            tombolMenu(context, "Cek Bilangan", CekBilangan()),
            tombolMenu(context, "Jumlah Total Angka", TotalPage()),
            tombolMenu(context, "Stopwatch", StopwatchPage()),
            tombolMenu(context, "Piramida", PiramidaPage()),
          ],
        ),
      ),
    );
  }
}

class DataKelompok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Kelompok"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("1. Yolanda Aisha Hs (123210182)"),
                Text("2. Mahmud Hidayatul Malik (123220025)"),
                Text("3. Fidian Rafif Bimasakti (123220206)"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HitungPage extends StatefulWidget {
  @override
  _HitungPageState createState() => _HitungPageState();
}

class _HitungPageState extends State<HitungPage> {
  final a = TextEditingController();
  final b = TextEditingController();
  int hasilTambah = 0;
  int hasilKurang = 0;
  void hitung() {
    int x = int.tryParse(a.text) ?? 0;
    int y = int.tryParse(b.text) ?? 0;
    setState(() {
      hasilTambah = x + y;
      hasilKurang = x - y;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Penjumlahan & Pengurangan"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 6,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: a,
                  decoration: InputDecoration(labelText: "Angka 1"),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: b,
                  decoration: InputDecoration(labelText: "Angka 2"),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: hitung, child: Text("Hitung")),
                SizedBox(height: 20),
                Text("Tambah = $hasilTambah"),
                Text("Kurang = $hasilKurang"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CekBilangan extends StatefulWidget {
  @override
  _CekBilanganState createState() => _CekBilanganState();
}

class _CekBilanganState extends State<CekBilangan> {
  final angka = TextEditingController();
  String hasil = "";
  void cek() {
    int n = int.tryParse(angka.text) ?? 0;
    bool prima = true;
    if (n <= 1) prima = false;
    for (int i = 2; i <= sqrt(n); i++) {
      if (n % i == 0) {
        prima = false;
        break;
      }
    }
    setState(() {
      hasil = n % 2 == 0 ? "Genap" : "Ganjil";
      hasil += prima ? " & Prima" : " & Bukan Prima";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cek Bilangan"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 6,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: angka,
                  decoration: InputDecoration(labelText: "Masukkan angka"),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: cek, child: Text("Cek")),
                SizedBox(height: 20),
                Text(hasil),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TotalPage extends StatefulWidget {
  @override
  _TotalPageState createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {
  final angka = TextEditingController();
  int total = 0;
  int sum = 0;
  void hitung() {
    String input = angka.text;

    for (int i = 0; i < input.length; i++) {
      sum += int.parse(input[i]);
    }

    setState(() {
      total = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jumlah Total"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 6,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: angka,
                  decoration: InputDecoration(
                    labelText: "Masukkan angka dipisah spasi",
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: hitung, child: Text("Hitung")),
                SizedBox(height: 20),
                Text("Total = $total"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  int detik = 0;
  Timer? timer;
  void mulai() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        detik++;
      });
    });
  }

  void stop() {
    timer?.cancel();
  }

  void reset() {
    timer?.cancel();
    setState(() {
      detik = 0;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int menit = detik ~/ 60;
    int sisaDetik = detik % 60;
    return Scaffold(
      appBar: AppBar(
        title: Text("Stopwatch"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${menit.toString().padLeft(2, '0')} : ${sisaDetik.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: mulai, child: Text("Start")),
            SizedBox(height: 10),
            ElevatedButton(onPressed: stop, child: Text("Stop")),
            SizedBox(height: 10),
            ElevatedButton(onPressed: reset, child: Text("Reset")),
          ],
        ),
      ),
    );
  }
}

class PiramidaPage extends StatefulWidget {
  @override
  _PiramidaPageState createState() => _PiramidaPageState();
}

class _PiramidaPageState extends State<PiramidaPage> {
  final alas = TextEditingController();
  final tinggi = TextEditingController();
  double volume = 0;
  void hitung() {
    double a = double.parse(alas.text);
    double t = double.parse(tinggi.text);
    setState(() {
      volume = (1 / 3) * a * t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volume Piramida"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 6,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: alas,
                  decoration: InputDecoration(labelText: "Luas Alas"),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: tinggi,
                  decoration: InputDecoration(labelText: "Tinggi"),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: hitung, child: Text("Hitung")),
                SizedBox(height: 20),
                Text("Volume = $volume"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
