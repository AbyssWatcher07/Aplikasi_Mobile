import 'dart:math';
import 'dart:io';

abstract class Shape {
  double calculate();
}

class Square extends Shape {
  double side;
  Square(this.side);
  @override
  double calculate() => side * side;
}

class Rectangle extends Shape {
  double length, width;
  Rectangle(this.length, this.width);
  @override
  double calculate() => length * width;
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  @override
  double calculate() => pi * radius * radius;
}

class Triangle extends Shape {
  double base, height;
  Triangle(this.base, this.height);
  @override
  double calculate() => 0.5 * base * height;
}

abstract class Solid {
  double calculate();
}

class Cube extends Solid {
  double side;
  Cube(this.side);
  @override
  double calculate() => side * side * side;
}

class Cuboid extends Solid {
  double length, width, height;
  Cuboid(this.length, this.width, this.height);
  @override
  double calculate() => length * width * height;
}

class Sphere extends Solid {
  double radius;
  Sphere(this.radius);
  @override
  double calculate() => (4 / 3) * pi * radius * radius * radius;
}

class Cylinder extends Solid {
  double radius, height;
  Cylinder(this.radius, this.height);
  @override
  double calculate() => pi * radius * radius * height;
}

void main() {
  print('Pilih jenis perhitungan:');
  print('1. Luas Bangun Datar');
  print('2. Volume Bangun Ruang');
  String? choice = stdin.readLineSync();

  if (choice == '1') {
    calculateAreaOOP();
  } else if (choice == '2') {
    calculateVolumeOOP();
  } else {
    print('Pilihan tidak valid.');
  }
}

void calculateAreaOOP() {
  print('Pilih bangun datar:');
  print('1. Persegi');
  print('2. Persegi Panjang');
  print('3. Lingkaran');
  print('4. Segitiga');
  String? shapeType = stdin.readLineSync();

  Shape? shape;
  if (shapeType == '1') {
    print('Masukkan sisi persegi:');
    double side = double.parse(stdin.readLineSync()!);
    shape = Square(side);
  } else if (shapeType == '2') {
    print('Masukkan panjang:');
    double length = double.parse(stdin.readLineSync()!);
    print('Masukkan lebar:');
    double width = double.parse(stdin.readLineSync()!);
    shape = Rectangle(length, width);
  } else if (shapeType == '3') {
    print('Masukkan radius lingkaran:');
    double radius = double.parse(stdin.readLineSync()!);
    shape = Circle(radius);
  } else if (shapeType == '4') {
    print('Masukkan alas segitiga:');
    double base = double.parse(stdin.readLineSync()!);
    print('Masukkan tinggi segitiga:');
    double height = double.parse(stdin.readLineSync()!);
    shape = Triangle(base, height);
  }

  if (shape != null) {
    print('Luas: ${shape.calculate()}');
  } else {
    print('Pilihan tidak valid.');
  }
}

void calculateVolumeOOP() {
  print('Pilih bangun ruang:');
  print('1. Kubus');
  print('2. Balok');
  print('3. Bola');
  print('4. Silinder');
  String? shapeType = stdin.readLineSync();

  Solid? solid;
  if (shapeType == '1') {
    print('Masukkan sisi kubus:');
    double side = double.parse(stdin.readLineSync()!);
    solid = Cube(side);
  } else if (shapeType == '2') {
    print('Masukkan panjang:');
    double length = double.parse(stdin.readLineSync()!);
    print('Masukkan lebar:');
    double width = double.parse(stdin.readLineSync()!);
    print('Masukkan tinggi:');
    double height = double.parse(stdin.readLineSync()!);
    solid = Cuboid(length, width, height);
  } else if (shapeType == '3') {
    print('Masukkan radius bola:');
    double radius = double.parse(stdin.readLineSync()!);
    solid = Sphere(radius);
  } else if (shapeType == '4') {
    print('Masukkan radius silinder:');
    double radius = double.parse(stdin.readLineSync()!);
    print('Masukkan tinggi silinder:');
    double height = double.parse(stdin.readLineSync()!);
    solid = Cylinder(radius, height);
  }

  if (solid != null) {
    print('Volume: ${solid.calculate()}');
  } else {
    print('Pilihan tidak valid.');
  }
}