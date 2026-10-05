int kpk(int a, int b) {
  int hasil = a;

  while (hasil % b != 0) {
    hasil += a;
  }

  return hasil;
}

void tampilkanKPK(int bilangan1, int bilangan2) {
  final hasil = kpk(bilangan1, bilangan2);
  print('Bilangan 1: $bilangan1');
  print('Bilangan 2: $bilangan2');
  print('KPK $bilangan1 dan $bilangan2 = $hasil');
  print('');
}

void main() {
  tampilkanKPK(12, 8);
  tampilkanKPK(15, 20);
}