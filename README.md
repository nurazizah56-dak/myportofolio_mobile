# MyPortfolio Mobile

Aplikasi berbasis Flutter yang dirancang sebagai antarmuka klien untuk pengembangan ekosistem portofolio pribadi, dengan Django REST Framework sebagai target integrasi backend.

---

## Identitas Mahasiswa

- **Nama Lengkap:** Nur Azizah
- **NPM:** 2506547935
- **Kelas:** PBP A
- **Mata Kuliah:** Pemrograman Berbasis Platform (CSGE602022)
- **Institusi:** Fakultas Ilmu Komputer, Universitas Indonesia
- **Semester:** Gasal 2026/2027

---

## Perkembangan Proyek

Bagian ini akan terus diperbarui sampai akhir rangkaian tugas.

| Tahap | Lingkup Pengembangan |
| :--- | :--- |
| **Tutorial 8** | Inisialisasi proyek Flutter `myportofolio_mobile`, pemisahan berkas `menu.dart` dari `main.dart`, konversi `MyHomePage` menjadi `StatelessWidget`, serta pembuatan komponen dasar `InfoCard` dan `ItemCard` dengan umpan balik `SnackBar`. |
| **Tugas 7** | Kustomisasi profil pemilik portofolio (NPM, Nama, Kelas), penambahan tombol menu terstruktur (Education, Skills, Experience), penerapan hierarki warna semantik (*color grouping*) dengan evaluasi rasio kontras WCAG, optimasi tata letak responsif pada desktop dan viewport mobile dengan lebar 360 logical pixels, serta integrasi tipografi modern *Plus Jakarta Sans*. |

---

## Deskripsi Proyek

`myportofolio_mobile` adalah aplikasi mobile interaktif yang dibangun menggunakan Flutter Framework dan bahasa pemrograman Dart. Aplikasi menghadirkan dashboard interaktif yang memuat informasi pemilik (NPM, Nama, Kelas) serta menu berikon yang merepresentasikan bagian portofolio, seperti Education, Skills, Experience, dan autentikasi akun.

---

## Berkas Utama

Struktur berkas akan berkembang seiring bertambahnya fitur, tetapi tanggung jawab utamanya tetap dipisahkan agar mudah dipahami.

| Lokasi | Fungsi |
| :--- | :--- |
| `lib/main.dart` | Titik masuk utama (*entry point*) aplikasi Flutter, konfigurasi tema global Material 3, dan inisialisasi tipografi Google Fonts (*Plus Jakarta Sans*) |
| `lib/menu.dart` | Logika dan antarmuka halaman utama portofolio (`MyHomePage`), komponen kartu profil (`InfoCard`), tombol aksi (`ItemCard`), dan model data `ItemHomepage` |
| `pubspec.yaml` | Berkas manifes proyek yang mendefinisikan informasi aplikasi, versi SDK, aset, dan dependensi eksternal (seperti `google_fonts` dan `cupertino_icons`) |
| `analysis_options.yaml` | Konfigurasi linter dan aturan analisis statis (*static analysis*) gaya kode Dart resmi |
| `android/` | Proyek pembungkus *native* Android (konfigurasi Gradle, AndroidManifest, dan build tools) |
| `ios/` | Proyek pembungkus *native* iOS (konfigurasi workspace Xcode dan plist) |
| `web/` | Konfigurasi dan berkas statis untuk eksekusi aplikasi pada peramban web (*index.html*) |
| `test/` | Berkas pengujian unit dan widget testing aplikasi |

---

## Tech Stack

- **Framework:** Flutter SDK (v3.24.5 - Channel stable)
- **Programming Language:** Dart (v3.5.4)
- **UI Design System:** Material Design 3 dengan Custom Rounded Neomorphic Styling
- **Typography:** Google Fonts (Plus Jakarta Sans)
- **Target Platforms:** Android, iOS, Web (Google Chrome)
- **Development Toolchain:** Visual Studio Code, Android Studio, Android SDK Platform-Tools
- **Backend Service (Integration Target):** Django REST Framework (DRF) API v1 (`myportofolio`)

---

## Panduan Instalasi & Eksekusi

### Prasyarat Sistem
1. Flutter SDK versi 3.24 atau yang lebih baru terpasang di sistem dan terdaftar pada `PATH`.
2. Web Browser Google Chrome (untuk eksekusi web) atau Android Studio / Device Emulator (untuk eksekusi Android).

### Langkah Menjalankan Aplikasi
1. Clone repositori ini ke komputer lokal:
   ```bash
   git clone https://github.com/nurazizah56-dak/myportofolio_mobile.git
   cd myportofolio_mobile
   ```

2. Unduh seluruh dependensi proyek:
   ```bash
   flutter pub get
   ```

3. Jalankan aplikasi pada peramban Google Chrome:
   ```bash
   flutter run -d chrome
   ```

4. Periksa kualitas dan kepatuhan sintaks kode:
   ```bash
   flutter analyze
   ```

---

## Tugas 7

### 1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan indukanak (parent-child) bekerja antar-widget!
Di Flutter, antarmuka pengguna (UI) dibangun secara deklaratif menggunakan konsep **Widget Tree (Pohon Widget)**, yaitu struktur hierarki pohon yang merepresentasikan susunan seluruh komponen visual aplikasi dari tingkat akar (root) hingga ranting terbawah (leaf).

Hubungan induk-anak (*parent-child*) bekerja dengan prinsip hierarki dan delegasi:
- **Prinsip Constraints, Sizing, and Positioning:** Flutter menerapkan aturan dasar *"Constraints go down. Sizes go up. Parent sets position."* Widget induk meneruskan batasan ukuran (*box constraints*: lebar dan tinggi minimum serta maksimum) ke bawah kepada widget anak. Widget anak kemudian menentukan ukurannya sendiri di dalam batasan tersebut dan melaporkannya kembali ke atas. Setelah mengetahui ukuran anak, induk menentukan posisi koordinat anak di layar.
- **Peran Parent Widget:** Peran induk bergantung pada jenis widget yang digunakan. Ada parent yang berfungsi membungkus struktur dasar halaman (seperti `Scaffold`), parent yang mengatur batasan tata letak atau posisi (seperti `Padding` atau `Center`), serta parent multi-child yang mengelola komposisi baris atau kolom (seperti `Column`, `Row`, dan `GridView`).
- **Struktur Multi-Child:** Widget layout multi-child memiliki properti `children: [...]` untuk menampung banyak widget anak secara berurutan, memungkinkan penyusunan antarmuka melalui komposisi widget bertingkat.

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!
Berikut adalah widget-widget yang digunakan dalam implementasi antarmuka proyek ini:
1. **MaterialApp:** Widget akar aplikasi yang mengonfigurasi tema global, judul aplikasi, dan aturan Material Design.
2. **Scaffold:** Menyediakan struktur visual dasar halaman Material, termasuk warna latar belakang dan wadah untuk menampilkan SnackBar.
3. **SafeArea:** Memastikan konten antarmuka tidak terpotong oleh area takik (*notch*), status bar, atau navigasi sistem perangkat.
4. **SingleChildScrollView:** Memungkinkan seluruh isi halaman digulir secara vertikal ketika tinggi konten melebihi ruang tampilan yang tersedia.
5. **Padding:** Memberikan jarak ruang kosong di sekeliling widget anaknya.
6. **Column:** Menyusun widget-widget anaknya secara vertikal dari atas ke bawah.
7. **Row:** Menyusun widget-widget anaknya secara horizontal dari kiri ke kanan (digunakan untuk menampilkan 3 InfoCard sejajar).
8. **Center:** Menempatkan posisi widget anak tepat di tengah ruang yang tersedia.
9. **Container:** Mengatur dekorasi visual seperti warna latar, border radius, padding, dan efek bayangan (*box shadow*).
10. **Text:** Menampilkan teks di layar dengan pengaturan gaya huruf (ukuran, ketebalan, warna, dan spasi).
11. **SizedBox:** Memberikan jarak pemisah berukuran tetap antar-komponen visual.
12. **GridView.count:** Menyusun sekumpulan widget anak dalam bentuk grid dua dimensi dengan jumlah kolom yang ditentukan melalui `crossAxisCount`. Jarak antarkomponen dapat disesuaikan menggunakan `mainAxisSpacing` dan `crossAxisSpacing`.
13. **Material:** Memberikan permukaan Material Design, termasuk penentuan warna latar tombol dan border radius.
14. **InkWell:** Memberikan area sentuh dengan efek riak air (*ink ripple*) saat kartu ditekan dan menangani aksi `onTap`.
15. **Icon:** Menampilkan simbol grafis berbasis vektor dari pustaka ikon resmi Material Icons (`Icons.school`, `Icons.work`, dll).
16. **SnackBar dan ScaffoldMessenger:** `SnackBar` digunakan untuk menampilkan notifikasi umpan balik visual sementara yang melayang (*floating*), sedangkan `ScaffoldMessenger` mengelola penampilan dan antrean notifikasi tersebut pada halaman.
17. **InfoCard (Custom Widget):** Komponen *reusable* buatan sendiri berbasis `StatelessWidget` untuk menampilkan kartu informasi profil pemilik (NPM, Nama, Kelas).
18. **ItemCard (Custom Widget):** Komponen *reusable* buatan sendiri berbasis `StatelessWidget` untuk merender tombol aksi berikon dengan latar warna unik dan aksi `SnackBar`.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!
Widget **MaterialApp** berfungsi sebagai pembungkus utama tingkat tertinggi (*top-level wrapper*) yang menginisialisasi ekosistem aplikasi berbasis standar Material Design dari Google.

Fungsi utama `MaterialApp`:
- **Penyedia Tema Global (`theme`):** Mengatur konfigurasi skema warna global (`colorScheme`), tipografi standar, dan mode Material 3 yang diwarisi oleh widget turunan di bawahnya.
- **Pengatur Sistem Navigasi (`Navigator`):** Mengelola tumpukan riwayat halaman (*routing stack*) untuk transisi antar-halaman.
- **Pengatur Lokalisasi & Bahasa (`Localizations`):** Mengelola sumber daya lokal aplikasi, seperti teks antarmuka (*internationalization*), pemformatan angka dan tanggal sesuai budaya (*locale*), serta arah teks (LTR/RTL).
- **Penyedia Konteks Aplikasi:** Melalui konfigurasi tema dan infrastruktur aplikasi yang dibangun di dalamnya, `MaterialApp` memungkinkan widget turunannya mengakses informasi tema menggunakan `Theme.of(context)` serta informasi ukuran viewport dan karakteristik tampilan melalui `MediaQuery.of(context)`.

MaterialApp umumnya digunakan sebagai root widget karena menyediakan konfigurasi dan layanan yang dibutuhkan oleh aplikasi berbasis Material Design, seperti tema, navigasi, dan lokalisasi.

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?
| Karakteristik | StatelessWidget | StatefulWidget |
| :--- | :--- | :--- |
| **Sifat Keadaan (State)** | Bersifat *immutable* dan tidak memiliki objek `State` tersendiri. | Bersifat *immutable*, tetapi memiliki objek `State` terpisah yang dapat menyimpan dan mengubah data. |
| **Pengelolaan State** | Bergantung pada parameter input konfigurasi yang diberikan oleh parent saat diinisialisasi. | Didampingi oleh objek kelas `State` terpisah yang mengelola variabel dinamis dan memanggil `setState()` saat terjadi perubahan data. |
| **Siklus Hidup (Lifecycle)** | Tidak memiliki objek State tersendiri. Metode `build()` dapat dipanggil kembali ketika konfigurasi widget atau parent mengalami perubahan (*rebuild*). | Memiliki siklus hidup yang dikelola oleh objek State, termasuk metode `initState()`, `didUpdateWidget()`, dan `dispose()`. Perubahan state dapat memicu rebuild melalui `setState()`. |

**Kapan Memilih StatelessWidget?**
Pilihlah `StatelessWidget` ketika antarmuka yang dibuat hanya menyajikan data statis atau tampilan presentasional yang tidak perlu mengubah data secara internal (misalnya halaman profil statis, label teks, tombol aksi yang murni menerima callback, atau kartu informasi seperti `InfoCard` dan `ItemCard`).

**Kapan Memilih StatefulWidget?**
Gunakan `StatefulWidget` ketika komponen perlu menyimpan, mengubah, dan menampilkan data yang berubah secara dinamis berdasarkan interaksi pengguna atau proses asinkron (misalnya input form teks, animasi, checkbox, atau tombol toggle).

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?
**BuildContext** adalah sebuah objek penanda lokasi atau pegangan (*handle*) yang merepresentasikan posisi tepat suatu widget di dalam hierarki Pohon Widget (*Widget Tree*).

**Mengapa BuildContext Sangat Penting?**
1. **Navigasi Hierarki Pohon:** Widget tidak hidup terisolasi; mereka perlu mengetahui lokasinya di dalam tree. `BuildContext` menjadi jembatan agar widget dapat mencari (*lookup*) widget leluhur (*ancestor*) yang menyediakan data atau layanan tertentu.
2. **Akses Data Konteks Bersama:** Melalui metode statis seperti `Theme.of(context)`, `MediaQuery.of(context)`, dan `ScaffoldMessenger.of(context)`, widget anak dapat menelusuri pohon widget ke atas untuk mengambil informasi tema aktif, ukuran dimensi layar, atau memunculkan SnackBar pada Scaffold terdekat.

**Penggunaannya di dalam metode `build`:**
Metode `build(BuildContext context)` selalu menerima objek konteks sebagai parameter utama. Konteks ini digunakan di dalam logika render untuk:
- Mengambil tema aplikasi: `Theme.of(context).colorScheme.primary`
- Mengukur proporsi layar responsif: `MediaQuery.of(context).size.width / 3.6`
- Menampilkan umpan balik visual melalui ScaffoldMessenger terdekat: `ScaffoldMessenger.of(context).showSnackBar(...)`

### 6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?
- **Hot Reload (tombol `r`):** Fitur pengembang Flutter yang menyuntikkan (*inject*) berkas kode sumber yang baru diubah secara langsung ke dalam mesin Dart Virtual Machine (VM) yang sedang berjalan tanpa menghapus status memori (*state*) aplikasi. Tampilan UI diperbarui dalam hitungan milidetik dengan mempertahankan posisi scroll dan nilai variabel yang ada.
- **Hot Restart (tombol `R`):** Mengompilasi ulang kode sumber dan mereset seluruh status aplikasi (*app state*) kembali ke nilai awal, lalu mengeksekusi ulang fungsi `main()` dari awal.

**Kapan Tidak Bisa Mengandalkan Hot Reload dan Harus Melakukan Hot Restart atau Full Restart?**
Kita tidak bisa hanya mengandalkan Hot Reload ketika:
1. **Mengubah Inisialisasi State:** Perubahan nilai awal pada variabel di dalam objek State atau logika pada metode `initState()` tidak otomatis diterapkan pada objek State yang sudah ada karena Hot Reload mempertahankan state aplikasi yang sedang berjalan.
2. **Mengubah Logika di Fungsi `main()`:** Modifikasi pada konfigurasi awal aplikasi atau pemanggilan fungsi bootstrap di dalam `void main()` memerlukan Hot Restart.
3. **Mengubah Tipe Widget:** Perubahan struktur atau konfigurasi widget tertentu mungkin tidak langsung diterapkan dengan benar melalui Hot Reload. Jika perubahan tidak tercermin pada tampilan, lakukan Hot Restart.
4. **Menambah Dependensi atau Aset Baru:** Penambahan dependensi memerlukan pembaruan melalui `flutter pub get`. Perubahan aset atau font mungkin memerlukan hot restart atau full restart agar dapat digunakan dengan benar.
5. **Modifikasi Kode Native:** Perubahan berkas platform native pada folder `android/` atau `ios/` (seperti `AndroidManifest.xml` atau konfigurasi Gradle) umumnya membutuhkan full restart atau rebuild.

---

## AI Disclosure

### Tools AI yang Digunakan
**Claude**

### Bagian yang Dibantu AI dan Kontribusi Saya

| Bagian | Peran AI | Yang Saya Lakukan |
| :--- | :--- | :--- |
| **Penyusunan Kode dan Model** | Membantu memberikan contoh sintaks Dart untuk pemisahan file `menu.dart`, pembuatan model `ItemHomepage`, dan penggunaan `GridView`. | Menyesuaikan struktur kode dengan kebutuhan portofolio, menentukan data yang ditampilkan berdasarkan informasi pribadi, serta memilih ikon yang sesuai dari Material Icons. |
| **Warna dan Tampilan UI** | Memberikan contoh penerapan warna pada setiap komponen berdasarkan atribut `Color` dalam model. | Menentukan pengelompokan warna berdasarkan jenis informasi, seperti Education dan Experience, memilih font Plus Jakarta Sans, serta mengevaluasi kombinasi warna agar teks tetap mudah dibaca dan memenuhi tingkat kontras WCAG yang sesuai. |
| **Tata Letak Responsif** | Memberikan alternatif penggunaan widget dan pengaturan ukuran untuk menyesuaikan tampilan di berbagai perangkat. | Menguji tampilan pada desktop dan viewport mobile dengan lebar 360 logical pixels, menemukan masalah *bottom overflow*, serta menentukan penyesuaian rasio ukuran komponen agar tampilan lebih proporsional. |

### Keterbatasan AI yang Saya Temui dan Perbaikan Manual

1. **Kontras Warna Teks**
   - **Keterbatasan AI:** AI awalnya menggunakan teks putih pada seluruh tombol tanpa mempertimbangkan kecerahan warna latar. Pada tombol Tambah Education (#38BDF8) dan Tambah Experience (#34D399), rasio kontras yang dihasilkan hanya 2,14:1 dan 1,92:1. Nilai tersebut belum memenuhi standar minimum WCAG AA untuk teks normal, yaitu 4,5:1.
   - **Perbaikan Manual:** Saya menambahkan properti `final Color textColor` pada model `ItemHomepage` agar warna teks dapat diatur secara terpisah dari warna tombol. Saya kemudian mengganti warna teks dan ikon pada tombol yang memiliki latar cerah menjadi Navy Gelap (#0F172A). Setelah diperbaiki, rasio kontras meningkat menjadi 8,33:1 dan 9,29:1 sehingga memenuhi standar WCAG AAA. Saya juga menyesuaikan warna tombol Logout menjadi #BE123C agar kontrasnya lebih baik.

2. **Tata Letak pada Layar Mobile**
   - **Keterbatasan AI:** Pengaturan ukuran komponen yang diberikan AI belum sepenuhnya sesuai ketika diterapkan pada layar ponsel yang lebih sempit. Saat pengujian pada lebar layar 360 logical pixels, ditemukan masalah *bottom overflow* pada kartu tombol akibat ruang vertikal yang terbatas.
   - **Perbaikan Manual:** Saya menyesuaikan rasio ukuran kartu secara dinamis menggunakan `childAspectRatio: isMobile ? 0.78 : 1.1`. Selain itu, saya mengurangi padding horizontal halaman dari 24px menjadi 16px pada tampilan mobile, membatasi judul kartu maksimal dua baris menggunakan `maxLines: 2`, dan menambahkan `TextOverflow.ellipsis` agar teks yang terlalu panjang tidak mengganggu tata letak.

3. **Penggunaan Emotikon pada Desain**
   - **Keterbatasan AI:** AI beberapa kali menyarankan penggunaan emotikon pada label tombol aksi. Penggunaan tersebut kurang sesuai dengan tampilan portofolio yang ingin saya buat.
   - **Perbaikan Manual:** Saya mengarahkan agar emotikon pada tombol dihilangkan dan diganti dengan ikon vektor dari Material Icons, seperti `Icons.school` dan `Icons.work`. Dengan begitu, tampilan antarkomponen menjadi lebih konsisten.

### Refleksi Kritis terhadap Penggunaan AI

Dari pengerjaan proyek ini, saya merasakan bahwa AI cukup membantu mempercepat proses pengembangan, terutama dalam memberikan contoh kode dan menyusun komponen dasar Flutter. Namun, hasil yang diberikan tidak selalu langsung sesuai dengan kebutuhan aplikasi. Beberapa hal masih perlu diperiksa dan disesuaikan, seperti pemilihan warna, keterbacaan teks, serta ukuran komponen pada layar yang berbeda.

Saya tetap perlu memahami kode yang dihasilkan, mencoba menjalankannya, dan memeriksa hasilnya secara langsung. Misalnya, penggunaan warna yang terlihat menarik belum tentu memiliki kontras yang cukup, begitu pula tata letak yang terlihat baik pada desktop belum tentu sesuai ketika dibuka melalui ponsel.

Melalui proses ini, saya belajar bahwa AI sebaiknya digunakan sebagai alat bantu, bukan sebagai pengganti proses pengembangan dan pengambilan keputusan. Saya tetap bertanggung jawab untuk menentukan kebutuhan aplikasi, mengevaluasi hasil kode, melakukan pengujian, dan memperbaiki bagian yang belum sesuai. Dengan demikian, penggunaan AI tidak hanya membantu mempercepat pengerjaan, tetapi juga perlu diimbangi dengan pemahaman dan pemeriksaan dari pengembang.
