# **Relational Database**

### **Ahmad Faisal Fahmi, Software dan Data Engineering Pacmann Batch 3**

## 1. **Latar Belakang Masalah**

Membuat database untuk sebuah project atau aplikasi dan memahami proses retrieval data adalah salah satu tugas dari Software & Data Engineering.

Dalam project ini anda diberikan tugas untuk membangun relational database untuk sebuah website yang menawarkan penjualan mobil bekas. Gambaran umum tentang project ini adalah siapa saja dapat menawarkan produknya (mobil bekas) dalam bentuk iklan dan calon pembeli dapat melakukan pencarian berdasarkan beberapa kategori. Untuk lebih jelasnya, berikut adalah fitur serta batasan project ini:

1. Setiap user aplikasi dapat menawarkan lebih dari satu produk mobil bekasnya.
2. Sebelum menjual produk mobil, user harus melengkapi data dirinya terlebih dahulu, seperti nama, kontak, dan domisili lokasi.
3. User menawarkan produknya melalui iklan yang akan ditampilkan oleh website.
4. Iklan ini berisikan judul, detail informasi produk yang ditawarkan, serta kontak penjual.
5. Beberapa informasi yang harus ditulis dalam iklan adalah sebagai berikut
merek mobil: Toyota, Daihatsu, Honda, dll
Model: Toyota Camry, Toyota Corolla Altis, Toyota Vios,Toyota Camry Hybrid, dll
Jenis body mobil: MPV, SUV, Van, Sedan, Hatchback, dll
Tipe mobil: manual atau automatic
Tahun pembuatan mobil: 2005, 2010, 2011, 2020 
Deskripsi lain, seperti warna, jarak yang telah ditempuh, dsb,  boleh ditambahkan sesuai kebutuhan.
6. Setiap user bisa mencari mobil yg ditawarkan berdasarkan lokasi user penjual, merk mobil, dan jenis body mobil.
7. Jika calon pembeli tertarik terhadap sebuah mobil, ia dapat menawar (bid) harga produk jika penjual mengizinkan fitur tawar.
8. Transaksi pembelian dilakukan di luar aplikasi sehingga tidak dalam scope project