void main(){
  List<Map<String, dynamic>> data = [
    {
      "id": 1,
      "name": 'Dart',
      "email": 'dart@example.com'
    },
    {
      "id": 2,
      "name": 'Flutter',
      "email": 'flutter@example.com'
    },
    {
      "id": 3,
      "name": 'Firebase',
      "email": 'firebase@example.com'
    }
  ];

  List<Map<String, dynamic>> toko = [
    {
      "id-produk": 1,
      "nama-produk": 'Baju',
      "stock": 10,
      "pic" : 'hansen',
      "status" : 'tersedia',
      "created_at" : '2024-06-01',
      "updated_at" : '2024-06-01'
    },
    {
      "id-produk": 2,
      "nama-produk": 'Celana',
      "stock": 5,
      "pic" : 'hansen',
      "status" : 'tersedia',
      "created_at" : '2024-06-01',
      "updated_at" : '2024-06-01'
    },
    {
      "id-produk": 3,
      "nama-produk": 'Sepatu',
      "stock": 0,
      "pic" : 'hansen',
      "status" : 'habis',
      "created_at" : '2024-06-01',
      "updated_at" : '2024-06-01'
    },
    {
      "id-produk": 4,
      "nama-produk": 'Topi',
      "stock": 3,
      "pic" : 'hansen',
      "status" : 'tersedia',
      "created_at" : '2024-06-01',
      "updated_at" : '2024-06-01'
    },
    {
      "id-produk": 5,
      "nama-produk": 'Jaket',
      "stock": 2,
      "pic" : 'hansen',
      "status" : 'tersedia',
      "created_at" : '2024-06-01',
      "updated_at" : '2024-06-01'
    
    }
  ];
  print(data);
  
  for (var item in data) {
    print("ID: ${item['id']}, Name: ${item['name']}, Email: ${item['email']}");
  }
  
  print(toko);
  
  for (var item in toko) {
    print("ID Produk: ${item['id-produk']}, Nama Produk: ${item['nama-produk']}, Stock: ${item['stock']}");
  }
}