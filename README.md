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
| **Tugas 8** | Pembuatan formulir `ExperienceFormPage` dengan Category Chips dua baris terstruktur, integrasi `showDatePicker()` untuk rentang tanggal, *checkbox* status pekerjaan aktif yang menonaktifkan *end date*, validasi ketat format URL dan urutan tanggal, navigasi terintegrasi via kartu aksi beranda dan drawer, penanganan *route stack pop*, pembersihan hasil analisis linter `flutter analyze`, serta penyeragaman konsistensi bahasa antarmuka 100% berbahasa Inggris. Penambahan `FloatingAppBar` berbentuk kapsul melengkung dengan hamburger menu dan avatar profil *NA*, serta kolom input kondisional *Specify Other Degree* pada `EducationFormPage`. |
| **Tutorial 09** | Implementasi formulir `EducationFormPage` berbasis `StatefulWidget`, `Form`, dan `GlobalKey<FormState>`, penerapan navigasi menu samping `LeftDrawer`, dialog ringkasan `AlertDialog`, serta refaktorisasi struktur berkas ke direktori modular `lib/screens/` dan `lib/widgets/`. |
| **Tugas 7** | Kustomisasi profil pemilik portofolio (NPM, Nama, Kelas), penambahan tombol menu terstruktur (Education, Skills, Experience), penerapan hierarki warna semantik (*color grouping*) dengan evaluasi rasio kontras WCAG, optimasi tata letak responsif pada desktop dan viewport mobile dengan lebar 360 logical pixels, serta integrasi tipografi modern *Plus Jakarta Sans*. |
| **Tutorial 8** | Inisialisasi proyek Flutter `myportofolio_mobile`, pemisahan berkas `menu.dart` dari `main.dart`, konversi `MyHomePage` menjadi `StatelessWidget`, serta pembuatan komponen dasar `InfoCard` dan `ItemCard` dengan umpan balik `SnackBar`. |

---

## Deskripsi Proyek

`myportofolio_mobile` adalah aplikasi mobile interaktif yang dibangun menggunakan Flutter Framework dan bahasa pemrograman Dart. Aplikasi menghadirkan dashboard interaktif yang memuat informasi pemilik (NPM, Nama, Kelas) serta menu berikon yang merepresentasikan bagian portofolio, seperti Education, Skills, Experience, dan autentikasi akun.

---

## Berkas Utama

Struktur berkas akan berkembang seiring bertambahnya fitur, tetapi tanggung jawab utamanya tetap dipisahkan agar mudah dipahami.

| Lokasi | Fungsi |
| :--- | :--- |
| `lib/main.dart` | Titik masuk utama (*entry point*) aplikasi Flutter, konfigurasi tema global Material 3, dan inisialisasi tipografi Google Fonts (*Plus Jakarta Sans*) |
| `lib/screens/menu.dart` | Halaman beranda utama (`MyHomePage`), kartu profil (`InfoCard`), dan grid tombol navigasi portofolio |
| `lib/screens/education_form.dart` | Formulir penambahan riwayat pendidikan (`EducationFormPage`) dari Tutorial 09 dengan validasi dan dialog ringkasan |
| `lib/screens/experience_form.dart` | Formulir penambahan riwayat pengalaman (`ExperienceFormPage`) Tugas 8 dengan Category Chips 2 baris, date picker, validasi URL, dan dialog ringkasan |
| `lib/widgets/left_drawer.dart` | Komponen bilah menu samping navigasi (*Drawer*) global dengan opsi Home, Add Education, dan Add Experience |
| `lib/widgets/floating_app_bar.dart` | Komponen bilah atas melayang (*floating pill AppBar*) dengan sudut melengkung, hamburger drawer menu, judul, dan avatar profil (*NA*) |
| `lib/widgets/item_card.dart` | Widget kartu aksi interaktif berikon (`ItemCard`) dengan penanganan navigasi halaman dan umpan balik `SnackBar` |
| `pubspec.yaml` | Berkas manifes proyek yang mendefinisikan informasi aplikasi, versi SDK, aset, dan dependensi eksternal |
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

## Tugas 8

### 1. Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi **Home** di drawer membawa pengguna kembali ke halaman utama.

Di Flutter, sistem navigasi halaman dikelola menggunakan struktur tumpukan (*navigation stack / LIFO - Last In, First Out*). Perbedaan ketiga metode tersebut adalah:
- **`Navigator.push(BuildContext context, Route route)`:** Mendorong (*push*) rute halaman baru ke atas tumpukan navigasi. Halaman sebelumnya tetap tersimpan di dalam memori tepat di bawah rute baru. Dengan metode ini, pengguna dapat kembali ke halaman sebelumnya menggunakan tombol kembali (*back button* pada AppBar atau tombol kembali sistem perangkat).
- **`Navigator.pushReplacement(BuildContext context, Route route)`:** Menggantikan rute teratas saat ini dengan rute baru. Rute sebelumnya dilepas dari *navigation stack* (sehingga pengguna tidak dapat kembali ke halaman tersebut via tombol kembali), dan sumber daya (*resources*) rute lama akan di-*dispose* setelah proses transisi selesai, bukan berarti seluruh objeknya langsung dihancurkan seketika saat metode dipanggil.
- **`Navigator.pop(BuildContext context, [T result])`:** Menghapus (*pop*) rute halaman teratas dari tumpukan navigasi, mengembalikan pengguna ke halaman yang berada tepat di bawahnya. Metode ini juga digunakan untuk menutup dialog (`AlertDialog`), menu samping (`Drawer`), atau mengembalikan data hasil ke halaman pemanggil.

**Metode yang Digunakan untuk Membuka Formulir dari Kartu Aksi:**
Metode yang digunakan pada tombol kartu beranda (`ItemCard`) adalah **`Navigator.push()`**. Hal ini bertujuan agar halaman utama (`MyHomePage`) tetap dipertahankan di dasar tumpukan navigasi, sehingga setelah pengguna selesai melihat formulir atau batal mengisi, pengguna dapat dengan mudah kembali ke halaman beranda menggunakan tombol panah kembali (*leading back arrow*) pada AppBar formulir.

**Bagaimana Opsi Home di Drawer Membawa Pengguna Kembali:**
Pada komponen `LeftDrawer`, opsi **Home** memanfaatkan **`Navigator.pushReplacement()`** menuju `MyHomePage()`. Pemilihan `pushReplacement()` ini penting untuk mencegah penumpukan halaman utama yang berulang-ulang di atas stack riwayat navigasi (*infinite stack accumulation*) saat pengguna berpindah-pindah antar-layanan via drawer. Selain itu, tepat sebelum navigasi dijalankan, dipanggil `Navigator.pop(context)` untuk menutup Drawer terlebih dahulu. Drawer yang masih terbuka memiliki entri riwayat lokal pada rute aktif (*LocalHistoryEntry*), sehingga jika tidak ditutup terlebih dahulu, tombol kembali akan memproses penutupan Drawer alih-alih kembali ke halaman sebelumnya.

---

### 2. Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.

**Konsistensi Struktur Halaman Melalui `Scaffold`, `AppBar`, dan `Drawer`:**
- **`Scaffold`:** Bertindak sebagai fondasi arsitektur Material Design yang seragam di seluruh aplikasi. Dengan membungkus setiap layar (`MyHomePage`, `EducationFormPage`, dan `ExperienceFormPage`) dalam `Scaffold`, tata letak dasar aplikasi terbagi secara konsisten ke dalam slot komponen: bilah atas (`appBar`), menu samping (`drawer`), warna dasar latar belakang (`backgroundColor`), serta area konten tubuh (`body`).
- **`AppBar`:** Memberikan identitas visual dan navigasi yang seragam di bagian atas layar. Seluruh halaman menggunakan komponen `FloatingAppBar` kustom berbentuk kapsul melayang dengan sudut melengkung (`BorderRadius.circular(30)`), latar putih, tipografi judul tebal, tombol hamburger menu (*3-bar icon*) di kiri, dan avatar inisial profil *NA* di kanan.
- **`Drawer`:** Komponen `LeftDrawer` dibuat sebagai widget terpisah yang modular dan reusable. Dengan memasang widget `LeftDrawer()` yang sama pada properti `drawer` di seluruh `Scaffold`, pengguna mendapatkan akses ke daftar menu navigasi yang identik dan dapat diandalkan dari halaman mana pun.

**Contoh Penggunaan Warna Tema Portofolio di Lebih dari Satu Halaman:**
Warna tema **Royal Blue (`#1D4ED8`)** digunakan secara konsisten sebagai representasi visual identitas utama aplikasi:
1. **Pada Halaman Utama (`menu.dart`):** Digunakan sebagai warna latar kartu aksi `"View Education"`.
2. **Pada Bilah Menu Samping (`left_drawer.dart`):** Digunakan pada gradien header `LeftDrawer` (dari `#1D4ED8` ke `#3B82F6`).
3. **Pada Halaman Formulir (`education_form.dart` & `experience_form.dart`):** Digunakan secara spesifik sebagai penanda status aktif (*selected state*) pada *Degree Chips* (formulir Education) dan *Category Chips* (formulir Experience) — di mana chip yang tidak dipilih tetap berlatar putih dengan batas border abu-abu netral (`#CBD5E1`) — serta sebagai warna latar tombol utama **Save** di kedua formulir.

---

### 3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.

**Alasan Pemilihan Tata Letak Formulir:**
Tata letak formulir dibangun menggunakan hierarki linier vertikal: `Scaffold` -> `SafeArea` -> `Form` -> `SingleChildScrollView` -> `Padding` -> `Column`. Tata letak vertikal satu kolom ini dipilih karena sangat selaras dengan alur kognitif pengisian data yang berurutan dari atas ke bawah: Judul Peran -> Kategori Pekerjaan -> Tanggal Mulai -> Status Sedang Berjalan -> Tanggal Selesai -> Deskripsi Tugas -> URL Thumbnail -> Tombol Simpan. Tata letak ini memberikan ruang sentuh (*touch target*) yang lapang dan meminimalisir distraksi.

**Peran Widget Pengatur Jarak (`Padding` dan `SizedBox`):**
- **`Padding`:** Memberikan batas ruang kosong aman di sekeliling formulir (misalnya `symmetric(horizontal: 16.0, vertical: 16.0)`) agar kotak isian input tidak menempel langsung pada bezel fisik perangkat, serta menjaga kenyamanan visual saat form dibuka di layar sempit.
- **`SizedBox`:** Berfungsi sebagai pemisah dimensi tetap (*fixed distance spacer*) antar-elemen input teks dan antar-baris Category Chips (misalnya `SizedBox(height: 8.0)` dan `SizedBox(width: 8.0)`). `SizedBox` sangat efisien dan ringan (*lightweight*) untuk memisahkan bidang isian agar tidak terlihat padat (*cluttered*).

**Peran Widget Penggulir (`SingleChildScrollView`):**
Tanpa widget penggulir, formulir dengan konten yang melebihi ruang vertikal yang tersedia berisiko mengalami *bottom overflow*, terutama ketika keyboard virtual muncul dan mengurangi area tampilan yang tersedia. `SingleChildScrollView` memungkinkan pengguna menggulir konten formulir secara vertikal, sehingga seluruh komponen — termasuk pesan kesalahan validasi dan tombol **Save** — tetap dapat dijangkau dalam kondisi ruang layar yang terbatas.

---

### 4. Apa peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol **Simpan** ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.

**Peran Komponen Validasi:**
- **`GlobalKey<FormState>`:** Kunci global unik yang berfungsi sebagai pegangan (*handle*) untuk mengakses status internal dan metode milik widget `Form` dari luar widget tersebut. Melalui objek `_formKey.currentState`, aplikasi dapat memicu fungsi validasi serentak atau melakukan reset nilai seluruh kolom form.
- **`validator`:** Fungsi logika yang didefinisikan pada setiap `FormField` (misalnya pada `TextFormField`). Fungsi ini memeriksa nilai yang dimasukkan pengguna (`String? value`) berdasarkan aturan bisnis tertentu. Jika nilai tidak valid, fungsi mengembalikan teks pesan galat (*error message*), dan jika valid, mengembalikan nilai `null`.
- **`validate()`:** Metode bawaan `FormState` yang dipanggil ketika tombol **Save** ditekan (`_formKey.currentState!.validate()`). Metode ini secara otomatis mengeksekusi seluruh fungsi `validator` dari semua kolom input turunan di dalam form. Jika ada input yang tidak valid, `validate()` mengembalikan nilai `false` dan menampilkan pesan galat berwarna merah tepat di bawah kolom terkait. Jika seluruh input valid, `validate()` mengembalikan `true`.

**Contoh Nilai yang Ditolak oleh Validasi:**
1. **Title / Role:** Input yang dikosongkan atau hanya berisi spasi (`"   "`) akan ditolak dengan pesan: `"Experience title cannot be empty!"`. Input yang panjangnya kurang dari 3 huruf (misalnya `"UI"`) akan ditolak dengan pesan: `"Experience title must be at least 3 characters!"`.
2. **Thumbnail URL:** Nilai teks tanpa protokol yang sah seperti `"gambar-profil.png"` atau teks sembarang akan ditolak dengan pesan: `"Please enter a valid URL (starting with http:// or https://)"`. Perlu dicatat bahwa validasi ini memeriksa awalan protokol, bukan keseluruhan struktur URL secara penuh (misalnya, host/domain tidak diverifikasi).
3. **End Date:** Jika tanggal selesai dipilih lebih lampau daripada tanggal mulai (misalnya tanggal mulai 10 Januari 2024, namun tanggal selesai diisi 1 Januari 2023), validasi menolak dengan pesan: `"End date cannot be earlier than start date!"`.

**Mengapa Memilih Jenis Input atau Papan Ketik Saja Belum Cukup:**
Menentukan jenis papan ketik (seperti `keyboardType: TextInputType.url` atau `TextInputType.number`) hanyalah *fasilitas kenyamanan antarmuka* (*input affordance*) yang menyesuaikan tata letak tombol pada keyboard virtual perangkat. Namun, konfigurasi keyboard:
1. **Tidak Menjamin Keabsahan Data:** Pengguna tetap dapat menghapus seluruh isian sehingga bidang wajib terkirim dalam keadaan kosong.
2. **Tidak Melindungi dari Operasi Tempel (*Paste*):** Pengguna dapat menempelkan teks sembarang dari clipboard ke dalam input angka atau URL.
3. **Tidak Menjalankan Logika Relasional:** Papan ketik tidak mampu memeriksa logika bisnis internal, seperti memastikan bahwa tanggal selesai tidak boleh mendahului tanggal mulai, atau memverifikasi bahwa URL yang dimasukkan memiliki awalan protokol yang valid (`http://` atau `https://`).
Oleh karena itu, penegakan integritas data yang andal hanya dapat dicapai melalui validasi logika programatis menggunakan `validator` dan `validate()`.

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

## AI Disclosure — Tugas 8

### Tools AI yang Digunakan

**Claude**

### Bagian yang Dibantu AI dan Kontribusi Saya

| Bagian | Peran AI | Yang Saya Lakukan |
| :--- | :--- | :--- |
| **Penyusunan Form dan Navigasi (Tugas 8)** | Membantu menyusun struktur `FormState`, konfigurasi `LeftDrawer`, boilerplate `showDatePicker()`, serta implementasi awal komponen formulir Flutter. | Menentukan kebutuhan dan alur formulir berdasarkan atribut model Django backend, mengembangkan modul *Experience*, mengatur logika checkbox ongoing yang menonaktifkan end date, serta merancang dialog ringkasan menggunakan `AlertDialog`. |
| **Konsistensi Bahasa** | Membantu menerapkan perubahan string teks antarmuka dan validator berdasarkan arahan yang diberikan. | Menemukan inkonsistensi bahasa pada implementasi sebelumnya dan menentukan penggunaan bahasa Inggris secara konsisten di seluruh antarmuka. Saya juga menentukan penyesuaian teks pada AppBar, tombol aksi, drawer, hint, validator, dan dialog konfirmasi. |
| **Desain Komponen dan Interaksi** | Memberikan bantuan implementasi kode Flutter berdasarkan arahan desain dan kebutuhan interaksi yang ditentukan. | Menentukan penggunaan Category Chips sebagai pengganti dropdown, menyusun kategori dalam dua baris, menyelaraskan warna Degree Chips dan Category Chips menggunakan Royal Blue (`#1D4ED8`), serta menentukan desain FloatingAppBar berbentuk kapsul dengan ikon hamburger, judul dinamis, dan avatar inisial NA. |
| **Pengujian dan Perbaikan Kode** | Membantu menganalisis permasalahan navigasi, memberikan saran penggunaan `Navigator.pop()`, dan membantu menindaklanjuti temuan `flutter analyze`. | Menguji navigasi melalui kartu aksi beranda dan drawer di browser Chrome, mengevaluasi perilaku tombol kembali, menerapkan penyesuaian navigasi, serta menjalankan analisis statis untuk memeriksa masalah pada kode. |

### Evaluasi Hasil AI, Perbaikan Manual, dan Keputusan Pengembangan

1. **Penanganan Navigasi dan Entri Riwayat Drawer**
   - **Keterbatasan AI:** Implementasi awal navigasi pada `left_drawer.dart` langsung memanggil `Navigator.push()` tanpa menutup Drawer terlebih dahulu. Kondisi ini menyebabkan Drawer masih menjadi bagian dari rute aktif sehingga tombol kembali dapat memproses penutupan Drawer sebelum kembali ke halaman sebelumnya.
   - **Perbaikan Manual:** Setelah menguji perilaku navigasi, saya menambahkan `Navigator.pop(context)` sebelum `Navigator.push()` pada setiap item drawer. Dengan demikian, Drawer ditutup terlebih dahulu sebelum halaman tujuan dibuka.

2. **Penyesuaian Pilihan Kategori dan Konsistensi Visual**
   - **Proses Pengembangan dan Implementasi:** Pada rancangan awal, saya memilih menggunakan `DropdownButtonFormField` untuk input kategori. Setelah mengevaluasi interaksi dan tampilan formulir, saya memutuskan menggantinya dengan Category Chips karena jumlah pilihan relatif sedikit dan seluruh opsi dapat ditampilkan secara langsung. Saya kemudian mengimplementasikan susunan enam kategori dalam dua baris yang simetris (Baris 1: Full-Time, Part-Time, Internship; Baris 2: Freelance, Volunteer, Research). Saya juga menyelaraskan warna Degree Chips pada formulir Education dan Category Chips pada formulir Experience menggunakan Royal Blue (`#1D4ED8`) sebagai warna aktif saat terpilih (*selected state*).

3. **Kolom Input Kondisional untuk Pilihan Other pada Form Education**
   - **Keterbatasan AI:** Implementasi awal Degree Selector belum menyediakan kolom deskripsi tambahan ketika pengguna memilih opsi *Other*. Akibatnya, nilai yang tersimpan hanya berupa string `"Other"` tanpa informasi tambahan.
   - **Perbaikan Manual:** Saya mengidentifikasi kebutuhan informasi tambahan tersebut dan mengarahkan penambahan `TextFormField` kondisional yang hanya ditampilkan ketika `_degree == 'Other'`. Kolom dilengkapi validator wajib isi dan indikator teks *"Selected: Other (<deskripsi>)"* yang diperbarui secara real-time.

### Refleksi Kritis terhadap Penggunaan AI

Dalam pengerjaan Tugas 8, AI membantu mempercepat penerjemahan kebutuhan implementasi menjadi kode Flutter, khususnya pada penyusunan struktur formulir, komponen UI, dan logika validasi. Namun, hasil yang diberikan tidak selalu langsung sesuai dengan kebutuhan aplikasi dan masih memerlukan evaluasi serta penyesuaian.

Saya tetap terlibat dalam menentukan kebutuhan fungsional, mengambil keputusan desain, dan mengevaluasi hasil implementasi. Hal tersebut terlihat dari penyesuaian alur navigasi drawer, perubahan pendekatan input kategori dari dropdown menjadi chips, penyeragaman bahasa antarmuka, serta penambahan input kondisional pada Degree Selector. Saya juga menentukan rancangan visual FloatingAppBar dan konsistensi tampilannya di seluruh halaman.

Penggunaan AI tidak menggantikan proses pengambilan keputusan dan pengujian yang saya lakukan sebagai pengembang. Setiap saran dan kode yang dihasilkan tetap perlu ditinjau berdasarkan kebutuhan aplikasi, diuji secara fungsional, dan disesuaikan sebelum diterapkan. Dengan demikian, AI berperan sebagai alat bantu implementasi, sedangkan perancangan kebutuhan, keputusan pengembangan, dan tanggung jawab terhadap hasil akhir tetap berada pada saya.

---

## AI Disclosure — Tugas 7

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
