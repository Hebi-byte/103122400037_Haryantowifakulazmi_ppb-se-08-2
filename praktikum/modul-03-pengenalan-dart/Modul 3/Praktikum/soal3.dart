int fpb(int a, int b) {
  // Algoritma Euclidean.
  while (b != 0) {
    int sisa = a % b;
    a = b;
    b = sisa;
  }

  return a;
}

void tampilkanFPB(int bilangan1, int bilangan2) {
  final hasil = fpb(bilangan1, bilangan2);
  print('Bilangan 1: $bilangan1');
  print('Bilangan 2: $bilangan2');
  print('FPB $bilangan1 dan $bilangan2 = $hasil');
  print('');
}

void main() {
  tampilkanFPB(48, 18);
  tampilkanFPB(27, 18);
}