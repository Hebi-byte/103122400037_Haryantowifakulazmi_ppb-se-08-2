void cariPosisiNilai(int nilai) {
  final List<List<int>> data = [
    [5, 10, 15],                
    [2, 4, 6, 8],                
    [1, 4, 9, 16, 25],            
    [3, 4, 5, 6, 7, 8],          
  ];

  print('Isi List:');
  for (final baris in data) {
    print(baris.join(' '));
  }

  print('Bilangan yang dicari: $nilai');
  bool ditemukan = false;

  for (int i = 0; i < data.length; i++) {
    for (int j = 0; j < data[i].length; j++) {
      if (data[i][j] == nilai) {
        if (!ditemukan) {
          print('$nilai berada di:');
        }
        print('baris ${i + 1} kolom ${j + 1}');
        ditemukan = true;
      }
    }
  }

  if (!ditemukan) {
    print('$nilai tidak ditemukan di dalam List.');
  }

  print('');
}

void main() {
  cariPosisiNilai(2);
  cariPosisiNilai(11);
}