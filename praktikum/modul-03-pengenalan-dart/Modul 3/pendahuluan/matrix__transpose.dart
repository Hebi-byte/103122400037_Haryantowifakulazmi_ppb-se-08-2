import 'dart:io';
import 'dart:math';

void tampilkanMatriks(List<List<int>> matriks) {
  for (var baris in matriks) {
    print(baris.join(' '));
  }
}

List<List<int>> buatMatriks(int A, int B) {
  Random random = Random();

  return List.generate(
    A,
    (_) => List.generate(
      B,
      (_) => random.nextInt(10) + 1,
    ),
  );
}

List<List<int>> transpose(List<List<int>> matriks) {
  int A = matriks.length;
  int B = matriks[0].length;

  return List.generate(
    B,
    (i) => List.generate(
      A,
      (j) => matriks[j][i],
    ),
  );
}

void main() {
  print('Matriks A x B');

  stdout.write('A: ');
  int A = int.parse(stdin.readLineSync()!);

  stdout.write('B: ');
  int B = int.parse(stdin.readLineSync()!);

  List<List<int>> matriks = buatMatriks(A, B);

  print('\nIsi matriks:');
  tampilkanMatriks(matriks);

  List<List<int>> hasilTranspose = transpose(matriks);

  print('\nHasil transpose:');
  tampilkanMatriks(hasilTranspose);
}