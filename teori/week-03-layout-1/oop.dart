abstract class Kendaraan {
	String nama;
	int kecepatan;

	Kendaraan(this.nama, this.kecepatan);

	void bergerak() {
		print('$nama bergerak dengan kecepatan $kecepatan km/jam.');
	}
}

abstract interface class BisaDiservis {
	void servis();
}

mixin GPS {
	void tampilkanLokasi() {
		print('Lokasi GPS: -6.9175, 107.6191 (Bandung)');
	}
}

extension FormatKecepatan on int {
	String get kmPerJam => '$this km/jam';
}

class Mobil extends Kendaraan with GPS implements BisaDiservis {
	String nomorPolisi;
	String? namaPemilik;
	int? tahunProduksi;
	String nomorMesin;

	Mobil({
		required String nama,
		required int kecepatan,
		required this.nomorPolisi,  
		required this.nomorMesin,
		this.namaPemilik,
		this.tahunProduksi,
	}) : super(nama, kecepatan);

	@override
	void servis() {
		print('Mobil $nomorPolisi berhasil diservis.');
	}

	void tampilkanInformasi() {
		print('Nama: $nama');
		print('Kecepatan: ${kecepatan.kmPerJam}');
		print('Nomor polisi: $nomorPolisi');
		print('Pemilik: ${namaPemilik ?? 'Belum diketahui'}');
		print('Tahun produksi: ${tahunProduksi ?? 'Belum diketahui'}');
		print('Nomor mesin: $nomorMesin');
	}
}

void tampilkanMobil(String nama, int kecepatan) {
	print('$nama melaju dengan kecepatan $kecepatan km/jam.');
}

void tampilkanPemilik(String nama, [String? warna]) {
	print('Pemilik $nama memiliki mobil warna ${warna ?? 'Hitam'}.');
}

void dataMobil({required String nama, String warna = 'Hitam'}) {
	print('Data mobil: $nama, warna $warna.');
}

void main() {
	final mobil = Mobil(
		nama: 'Toyota Avanza',
		kecepatan: 80,
		nomorPolisi: 'D 1234 ABC',
		namaPemilik: 'Haryanto',
		tahunProduksi: 2022,
		nomorMesin: 'MTR-22001',
	);

	mobil.tampilkanInformasi();
	mobil.bergerak();
	mobil.servis();
	mobil.tampilkanLokasi();

	print('');
	tampilkanMobil('Honda Civic', 100);
	tampilkanPemilik('Haryanto');
	tampilkanPemilik('Haryanto', 'Putih');
	dataMobil(nama: 'Toyota Avanza');
	dataMobil(nama: 'Honda Civic', warna: 'Merah');
}
