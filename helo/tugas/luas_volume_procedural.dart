import 'dart:math'; 
import 'dart:io'; 

void main() {
  print('Pilih jenis perhitungan:');
  print('1. Luas Bangun Datar');
  print('2. Volume Bangun Ruang');
  String? choice = stdin.readLineSync();

  if (choice == '1') {
    calculateArea();
  } else if (choice == '2') {
    calculateVolume();
  } else {
    print('Pilihan tidak valid.');
  }
}

void calculateArea() {
  print('Pilih bangun datar:');
  print('1. Persegi');
  print('2. Persegi Panjang');
  print('3. Lingkaran');
  print('4. Segitiga');
  String? shape = stdin.readLineSync();

  if (shape == '1') {
    print('Masukkan sisi persegi:');
    double side = double.parse(stdin.readLineSync()!);
    print('Luas persegi: ${side * side}');
  } else if (shape == '2') {
    print('Masukkan panjang:');
    double length = double.parse(stdin.readLineSync()!);
    print('Masukkan lebar:');
    double width = double.parse(stdin.readLineSync()!);
    print('Luas persegi panjang: ${length * width}');
  } else if (shape == '3') {
    print('Masukkan radius lingkaran:');
    double radius = double.parse(stdin.readLineSync()!);
    print('Luas lingkaran: ${pi * radius * radius}');
  } else if (shape == '4') {
    print('Masukkan alas segitiga:');
    double base = double.parse(stdin.readLineSync()!);
    print('Masukkan tinggi segitiga:');
    double height = double.parse(stdin.readLineSync()!);
    print('Luas segitiga: ${0.5 * base * height}');
  } else {
    print('Pilihan tidak valid.');
  }
}

void calculateVolume() {
  print('Pilih bangun ruang:');
  print('1. Kubus');
  print('2. Balok');
  print('3. Bola');
  print('4. Silinder');
  String? shape = stdin.readLineSync();

  if (shape == '1') {
    print('Masukkan sisi kubus:');
    double side = double.parse(stdin.readLineSync()!);
    print('Volume kubus: ${side * side * side}');
  } else if (shape == '2') {
    print('Masukkan panjang:');
    double length = double.parse(stdin.readLineSync()!);
    print('Masukkan lebar:');
    double width = double.parse(stdin.readLineSync()!);
    print('Masukkan tinggi:');
    double height = double.parse(stdin.readLineSync()!);
    print('Volume balok: ${length * width * height}');
  } else if (shape == '3') {
    print('Masukkan radius bola:');
    double radius = double.parse(stdin.readLineSync()!);
    print('Volume bola: ${(4 / 3) * pi * radius * radius * radius}');
  } else if (shape == '4') {
    print('Masukkan radius silinder:');
    double radius = double.parse(stdin.readLineSync()!);
    print('Masukkan tinggi silinder:');
    double height = double.parse(stdin.readLineSync()!);
    print('Volume silinder: ${pi * radius * radius * height}');
  } else {
    print('Pilihan tidak valid.');
  }
}