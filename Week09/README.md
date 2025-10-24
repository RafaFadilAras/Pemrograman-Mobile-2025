# Pemrograman Mobile - Pertemuan 9 (Kamera)

**Nama : Rafa Fadil Aras**

**NIM  : 2341720007**

## Tugas Praktikum 1

**Soal 1**

Selesaikan Praktikum 

- Praktikum 1 - Mengambil foto dengan kamera di flutter
  - Langkah 1 - Buat project baru

    ![langkah1](img/langkah1.png)

  - Langkah 2 - Tambah dependensi
  
    ![langkah2](img/langkah2.png)

  - Langkah 3 - Ambil sensor kamera
  
    ![langkah3](img/langkah3.png)

  - Langkah 4 - Buat dan inisialisasi CameraController
  
    ![langkah4](img/langkah4.png)

  - Langkah 5 - Gunakan CameraPreview untuk menampilkan preview foto
  
    ![langkah5](img/langkah5.png)

  - Langkah 6 - Ambil foto dengan CameraController

    ![langkah6](img/langkah6.png)

  - Langkah 7 - Buat widget baru DisplayPictureScreen
  
    ![langkah7](img/langkah7.png)

  - Langkah 8 - Edit main.dart
  
    ![langkah8](img/langkah8.png)

  - Langkah 9 - Menampilkan hasil foto
  
    ![langkah9](img/langkah9.png)

  - Hasil 

    ![hasilprak1](img/hasilprak1_takepicture.jpg)
    ![hasilprak1](img/hasilprak1_displaypicture.jpg)

- Praktikum 2 - Membuatt photo filter carousel
  - Langkah 1 - Buat project baru
  
    ![langkah1](img/langkah1_prak2.png)

  - Langkah 2 - Buat widget Selector ring dan dark gradient
  
    ![langkah2](img/langkah2_prak2.png)

  - Langkah 3 - Buat widget photo filter carousel
  
    ![langkah3](img/langkah3_prak2.png)

  - Langkah 4 - Membuat filter warna - bagian 1
  
    ![langkah4](img/langkah4_prak2.png)

  - Langkah 5 - Membuat filter warna

    ![langkah5](img/langkah5_prak2.png)

  - Langkah 6 - Implementasi filter caraousel
  
    ![langkah6](img/langkah6_prak2.png)

**Soal 2**

Menggabungkan praktikum 1 dan 2 

- Hasil 
  
  ![hasilgabungan](img/hasil_picture+filter.gif)

**Soal 3**

Jelaskan maksud void async pada praktikum 1?

Jawaban : void async adalah fungsi yang tidak mengembalikan nilai tetapi menjalankan operasi yang bersifat asinkron (bisa menunggu sesuatu dengan await).

**Soal 4**

Jelaskan fungsi dari anotasi @immutable dan @override ?

Jawaban : @immutable berfungsi untuk menjaga agar widget atau objek tidak bisa diubah setelah dibuat untuk menjaga stabilitas UI flutter, sedangkan @override digunakan untuk menandai bahwa method menimpa method dari superclass. 