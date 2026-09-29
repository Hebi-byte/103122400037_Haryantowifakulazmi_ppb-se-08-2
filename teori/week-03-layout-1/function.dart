
void sayHello(String name) {
  print("Hello, $name!");
}


int sum(int a, int b) {
  return a + b;
}
void main() {
  sayHello("Dart");
  print(" 1 + 1 = ${sum(1, 1)}");

  String name,alamat,email,noHp,kelas,nim;
  int id;
  String? asalsekolah;

  print(asalsekolah ?? "Asal sekolah tidak diketahui");
}