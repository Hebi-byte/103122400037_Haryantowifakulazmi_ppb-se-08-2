void main(){
  // string
  String name = "Dart";

  // integer
  int age = 10;

  // double
  double height = 1.75;

  // boolean
  bool isStudent = true;

  //float
  var weight = 70.5;

  //list
  List<String> hobbies = ["Reading", "Coding", "Gaming"];

  // map
  Map<String, dynamic> person = {
    "name": "Dart",
    "age": 10,
    "height": 1.75,
    "isStudent": true,
    "weight": 70.5,
    "hobbies": ["Reading", "Coding", "Gaming"]
  };

  //var
  var city = "Jakarta";
  
  //dynamic
  dynamic country = "Indonesia";


  print("nama saya adalah $name umur saya $age tahun, tinggi saya $height meter, saya seorang mahasiswa: $isStudent, berat badan saya $weight kg, hobi saya adalah ${hobbies.join(", ")}, saya tinggal di kota $city, dan negara saya adalah $country.");

  var a = "Hello, $name!";
  print(a);
  a = "Hello, World!";
  print(a);

  //jadi saat sudah di compile, tipe data dari variabel a akan menjadi String, sehingga tidak bisa diubah menjadi tipe data lain. Namun jika menggunakan dynamic, maka tipe data dari variabel b bisa berubah-ubah sesuai dengan nilai yang diberikan.


  dynamic b = "Hello, $name!";
  print(b);
  b = 100;
  print(b);

  //jadi saat sudah di compile, tipe data dari variabel b akan menjadi dynamic, sehingga bisa diubah menjadi tipe data lain.


  List<int> numbers = [1, 2, 3, 4, 5];

  print(numbers);

  Map<String, int> scores = {
    "Math": 90,
    "Science": 85,
    "English": 95
  };
  print(person);
  print(scores);
}