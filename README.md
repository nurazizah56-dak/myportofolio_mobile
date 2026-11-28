![CI](https://github.com/nurazizah56-dak/myportofolio_mobile/actions/workflows/main.yaml/badge.svg)

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
| **Tugas 9** | Integrasi penuh Flutter ↔ Django REST Framework & Modern Routing: implementasi kelas model `@JsonSerializable` dengan `build_runner` untuk Education, Experience, Project, dan Skill; perluasan `ApiClient` dengan metode GET/POST terautentikasi (`Authorization: Token`) untuk endpoint DRF; pembuatan List Screen (`FutureBuilder` + `RefreshIndicator` + Retry) dan Detail Screen untuk seluruh entitas; refaktor formulir agar memerlukan autentikasi via `ensureLoggedIn()` sebelum pengiriman POST; migrasi navigasi ke `go_router` (`MaterialApp.router`) untuk integrasi penuh dengan *browser history* peramban Web dan konsistensi tombol *Back* (in-app vs browser back); penanganan `ApiException` dan sesi 401; penyeragaman identitas warna aksen per modul (Education: Royal Blue, Experience: Forest Emerald, Skills: Violet Purple, Projects: Deep Orange); serta pembaruan CI/CD pipeline GitHub Actions dengan langkah `build_runner` pada kedua job (`build` dan `build_apk`). |
| **Tutorial 10** | Integrasi awal Flutter ↔ Django REST Framework: pembuatan model `Education` dan `Project` dengan `fromJson`/`toJson`, setup `ApiClient` dengan `obtainToken` dan `logout`, implementasi `AuthState` via Provider, konfigurasi CI/CD GitHub Actions (`very_good_workflows` + `build_apk` dengan upload artefak APK release), dan aktivasi `TokenAuthentication` pada backend Django untuk endpoint Education. |
| **Tugas 8** | Pembuatan formulir `ExperienceFormPage` dengan Category Chips dua baris terstruktur, integrasi `showDatePicker()` untuk rentang tanggal, *checkbox* status pekerjaan aktif yang menonaktifkan *end date*, validasi ketat format URL dan urutan tanggal, navigasi terintegrasi via kartu aksi beranda dan drawer, penanganan *route stack pop*, pembersihan hasil analisis linter `flutter analyze`, serta penyeragaman konsistensi bahasa antarmuka 100% berbahasa Inggris. Penambahan `FloatingAppBar` berbentuk kapsul melengkung dengan hamburger menu dan avatar profil *NA*, serta kolom input kondisional *Specify Other Degree* pada `EducationFormPage`. |
| **Tutorial 09** | Implementasi formulir `EducationFormPage` berbasis `StatefulWidget`, `Form`, dan `GlobalKey<FormState>`, penerapan navigasi menu samping `LeftDrawer`, dialog ringkasan `AlertDialog`, serta refaktorisasi struktur berkas ke direktori modular `lib/screens/` dan `lib/widgets/`. |
| **Tugas 7** | Kustomisasi profil pemilik portofolio (NPM, Nama, Kelas), penambahan tombol menu terstruktur (Education, Skills, Experience), penerapan hierarki warna semantik (*color grouping*) dengan evaluasi rasio kontras WCAG, optimasi tata letak responsif pada desktop dan viewport mobile dengan lebar 360 logical pixels, serta integrasi tipografi modern *Plus Jakarta Sans*. |
| **Tutorial 8** | Inisialisasi proyek Flutter `myportofolio_mobile`, pemisahan berkas `menu.dart` dari `main.dart`, konversi `MyHomePage` menjadi `StatelessWidget`, serta pembuatan komponen dasar `InfoCard` dan `ItemCard` dengan umpan balik `SnackBar`. |

---

## Deskripsi Proyek

`myportofolio_mobile` adalah aplikasi mobile interaktif yang dibangun menggunakan Flutter Framework dan bahasa pemrograman Dart. Aplikasi menghadirkan dashboard pemilik portofolio yang memuat informasi profil (NPM, Nama, dan Kelas), serta fitur pengelolaan data portofolio yang terdiri atas Education, Skills, Experience, dan Projects.

Aplikasi terintegrasi dengan backend Django REST Framework untuk mendukung pengambilan dan pengiriman data melalui API. Aplikasi juga menyediakan autentikasi pengguna agar fitur penambahan data dapat diakses oleh pengguna yang telah login.

---

## Berkas Utama

Struktur berkas akan berkembang seiring bertambahnya fitur, tetapi tanggung jawab utamanya tetap dipisahkan agar mudah dipahami.

| Lokasi | Fungsi |
| :--- | :--- |
| `lib/main.dart` | Titik masuk utama (*entry point*) aplikasi Flutter, konfigurasi deklaratif `GoRouter` (`MaterialApp.router`), tema global Material 3, dan inisialisasi tipografi Google Fonts (*Plus Jakarta Sans*) |
| `lib/screens/menu.dart` | Halaman beranda utama (`MyHomePage`), kartu profil (`InfoCard`), dan grid tombol navigasi portofolio dengan identitas warna semantik |
| `lib/screens/education_list_screen.dart` | Layar daftar riwayat pendidikan berbasis `FutureBuilder`, `RefreshIndicator`, dan tombol reload |
| `lib/screens/education_detail_screen.dart` | Layar rincian riwayat pendidikan yang menampilkan seluruh informasi entitas (institusi, gelar, periode, lokasi, Maps URL, logo) |
| `lib/screens/education_form.dart` | Formulir penambahan riwayat pendidikan (`EducationFormPage`) dengan Degree Selector, validasi input, autentikasi sesi, dan dialog ringkasan |
| `lib/screens/experience_list_screen.dart` | Layar daftar riwayat pengalaman kerja/organisasi dengan status ongoing dan periodisasi |
| `lib/screens/experience_detail_screen.dart` | Layar rincian pengalaman kerja/organisasi dengan badge kategori dan deskripsi lengkap |
| `lib/screens/experience_form.dart` | Formulir penambahan riwayat pengalaman (`ExperienceFormPage`) dengan Category Chips 2 baris bertema Forest Emerald, date picker, dan validasi |
| `lib/screens/skill_list_screen.dart` | Layar daftar keahlian/keterampilan dengan visualisasi kategori (Soft/Hard) dan skor |
| `lib/screens/skill_detail_screen.dart` | Layar rincian keahlian dengan indikator kemajuan tingkat keahlian (*linear progress indicator*) bertema Violet Purple |
| `lib/screens/skill_form.dart` | Formulir penambahan keahlian (`SkillFormPage`) dengan pilihan chip kategori, slider kecakapan, dan urutan tampilan |
| `lib/screens/project_list_screen.dart` | Layar daftar portofolio proyek teknis yang terintegrasi dengan endpoint REST Django |
| `lib/screens/project_detail_screen.dart` | Layar rincian proyek yang menampilkan pratinjau gambar, deskripsi, tech stack chips, dan tautan URL proyek |
| `lib/screens/project_form_screen.dart` | Formulir penambahan proyek (`ProjectFormScreen`) dengan validasi URL, border fokus bertema Deep Orange, dan umpan balik tersimpan |
| `lib/screens/login_screen.dart` | Formulir masuk akun (*LoginScreen*) berbasis token autentikasi DRF yang disajikan sebagai modal in-app yang ramah riwayat navigasi |
| `lib/services/api_client.dart` | Klien HTTP terpadu untuk komunikasi API backend Django (GET, POST terautentikasi, login token, dan logout) |
| `lib/services/auth_state.dart` | Pengelola state autentikasi berbasis Provider ChangeNotifier untuk menyimpan token sesi pengguna secara reaktif |
| `lib/models/` | Definisi kelas model data (`Education`, `Experience`, `Skill`, `Project`) berbasis anotasi `@JsonSerializable` dan generator kode `build_runner` |
| `lib/widgets/left_drawer.dart` | Komponen bilah menu samping navigasi (*Drawer*) global dengan header Navy solid (`#0D234A`), pengelompokan modul terkategori, dan integrasi rute `GoRouter` |
| `lib/widgets/floating_app_bar.dart` | Komponen bilah atas melayang (*floating pill AppBar*) dengan navigasi cerdas yang adaptif terhadap tombol *Back* dan drawer |
| `lib/widgets/auth_guard.dart` | Pelindung rute formulir (`ensureLoggedIn`) yang memastikan pengguna terautentikasi sebelum membuka atau mengirim formulir |
| `lib/widgets/item_card.dart` | Widget kartu aksi interaktif berikon (`ItemCard`) dengan penanganan navigasi halaman dan umpan balik `SnackBar` |
| `lib/utils/web_history.dart` | Modul utilitas sinkronisasi riwayat peramban web (`history.back()`) dengan fallback multiplatform untuk memastikan kesinambungan riwayat navigasi (*continuous history*) |
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

3. Hasilkan berkas kode yang di-generate (`*.g.dart`) menggunakan `build_runner`:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. Jalankan aplikasi pada peramban Google Chrome (dengan koneksi ke backend Django yang sudah di-deploy):
   ```bash
   flutter run -d chrome --dart-define=API_BASE_URL=https://nur-azizah56-myportofolio.pws.cs.ui.ac.id
   ```
   Atau jalankan terhadap server lokal Django:
   ```bash
   flutter run -d chrome --dart-define=API_BASE_URL=http://localhost:8000
   ```

5. Periksa kualitas dan kepatuhan sintaks kode:
   ```bash
   flutter analyze
   ```

### Tautan Repositori Backend
- **Backend Django:** [github.com/nurazizah56-dak/myportofolio](https://github.com/nurazizah56-dak/myportofolio)
- **API URL (deployed PWS):** `https://nur-azizah56-myportofolio.pws.cs.ui.ac.id`

---

## Arsitektur Navigasi & Integrasi Browser History Web

Pada Tugas 9, sistem navigasi aplikasi dimigrasikan dari Navigator 1.0 konvensional (`MaterialApp(routes:)`) menuju `GoRouter` (`MaterialApp.router`). Perubahan ini dilakukan untuk mengelola rute aplikasi secara deklaratif dan mendukung integrasi navigasi dengan riwayat peramban web.

### 1. Navigasi Home, List, dan Detail

- Navigasi bertingkat `Home → List → Detail` menggunakan `context.push()` sehingga perpindahan halaman menambahkan rute ke tumpukan navigasi.
- Tombol Back in-app pada `FloatingAppBar` dan layar detail menggunakan mekanisme navigasi kembali yang disesuaikan dengan platform.
- Perilaku tombol Back in-app dan Back Chrome diuji pada beberapa urutan navigasi untuk memastikan pengguna dapat kembali ke halaman sebelumnya tanpa kembali ke halaman yang tidak diharapkan.
- Rute detail (`/education-detail`, `/experience-detail`, `/skill-detail`, `/project-detail`) menangani data extra yang dapat diterima dalam bentuk objek model maupun `Map<String, dynamic>`. Jika data diterima sebagai map, aplikasi mengonversinya kembali menggunakan `Model.fromJson(...)`.
- Halaman Home (`/`) menggunakan `PopScope(canPop: false)` untuk mengendalikan perilaku tombol kembali ketika pengguna sudah berada di halaman utama.

### 2. Navigasi Setelah Formulir Berhasil Disimpan

- Setelah formulir berhasil dikirim, aplikasi menampilkan dialog ringkasan (`AlertDialog`).
- Ketika pengguna menekan tombol **OK**, dialog ditutup terlebih dahulu menggunakan:
  ```dart
  Navigator.of(context, rootNavigator: true).pop();
  ```
- Setelah dialog tertutup, formulir memanggil:
  ```dart
  context.pop(true);
  ```
- Halaman daftar yang menunggu hasil navigasi melalui `await context.push<bool>(...)` menerima nilai `true` dan melakukan refresh data.
- Dengan alur ini, pengguna kembali ke layar daftar setelah penyimpanan berhasil, bukan kembali ke formulir yang sudah selesai digunakan.

### 3. Autentikasi melalui Modal In-App

- Pengguna yang belum login diarahkan melalui guard `ensureLoggedIn()` ketika mencoba mengakses fitur yang memerlukan autentikasi.
- Halaman login (`LoginScreen`) ditampilkan sebagai modal in-app menggunakan konfigurasi `fullscreenDialog: true`.
- Setelah login berhasil, pengguna dapat melanjutkan proses yang sebelumnya memerlukan autentikasi.
- Penggunaan modal membantu menjaga alur navigasi login agar tidak mengganggu struktur halaman utama dan halaman formulir.

---

## Tugas 9

### 1. Mengapa kita menggunakan `@JsonSerializable(fieldRename: FieldRename.snake)` dan `@JsonKey(includeToJson: false)` alih-alih mengirim objek `Map<String, dynamic>` mentah langsung dari widget? Jelaskan satu bug yang dicegah atau dapat dicegah oleh pendekatan ini pada model bagianmu.

**Alasan Penggunaan `@JsonSerializable` dan `@JsonKey`:**

Anotasi `@JsonSerializable(fieldRename: FieldRename.snake)` membantu memetakan nama field Dart yang menggunakan konvensi *camelCase*, seperti `categoryDisplay`, `startedAt`, dan `isOngoing`, menjadi *snake_case* yang digunakan oleh serializer Django REST Framework, seperti `category_display`, `started_at`, dan `is_ongoing`.

Kode serialisasi dan deserialisasi kemudian dihasilkan secara otomatis menggunakan `build_runner`. Pendekatan ini memiliki beberapa keuntungan:

- **Type safety:** Model Dart mendefinisikan tipe data setiap field sehingga kesalahan tipe dapat lebih mudah terdeteksi melalui analisis statis atau kompilasi. Namun, perubahan pada API backend tidak otomatis selalu menyebabkan compile error. Penyesuaian tetap diperlukan apabila struktur respons backend berubah.
- **Konsistensi penamaan:** Pemetaan *camelCase* dan *snake_case* dilakukan secara otomatis sehingga mengurangi risiko kesalahan penulisan nama field secara manual.
- **Kontrol field yang dikirim:** Anotasi `@JsonKey(includeToJson: false)` memungkinkan field tertentu dikecualikan dari hasil `toJson()`, misalnya field yang dikelola oleh server dan tidak perlu dikirim kembali oleh klien.

**Bug yang Dicegah pada Model Experience:**

Pada model `Experience`, field `started_at` menggunakan `auto_now_add=True` pada Django sehingga nilainya diisi secara otomatis oleh server ketika data dibuat. Field tersebut juga ditandai sebagai `read_only` pada `ExperienceSerializer`.

Jika field `startedAt` tetap disertakan dalam payload POST, klien dapat mengirim nilai yang sebenarnya tidak perlu ditentukan sendiri, misalnya `null`. Karena field tersebut bersifat `read_only`, DRF umumnya mengabaikan nilai input untuk field tersebut. Meskipun demikian, mengirim field yang tidak diperlukan tetap membuat payload kurang sesuai dengan tanggung jawab masing-masing pihak.

Dengan menggunakan `@JsonKey(includeToJson: false)`, field tersebut dikeluarkan dari hasil `toJson()`. Payload POST hanya memuat field yang memang perlu dikirim oleh klien, seperti `title`, `description`, `category`, `thumbnail`, dan `ended_at`.

Jika menggunakan `Map<String, dynamic>` secara manual langsung dari widget, developer harus mengatur nama dan isi setiap field sendiri. Hal tersebut meningkatkan risiko kesalahan penulisan atau pengiriman field yang seharusnya dikelola oleh backend.

---

### 2. Mengapa `Future` yang diteruskan ke `FutureBuilder` harus diinisialisasi di dalam `initState()` alih-alih langsung di dalam `build()`, dan mengapa `ApiClient` sebaiknya melempar `ApiException` daripada mengembalikan `null` pada respons HTTP non-2xx?

**Inisialisasi `Future` di `initState()`:**

Metode `build()` pada Flutter dapat dipanggil berkali-kali ketika terjadi rebuild, misalnya akibat pemanggilan `setState()`, perubahan pada widget induk, atau perubahan `MediaQuery`.

Jika `Future` dibuat langsung di dalam `build()`, setiap rebuild dapat menghasilkan instance `Future` baru. Akibatnya, permintaan HTTP dapat dijalankan kembali meskipun pengguna tidak sedang meminta refresh data.

Hal tersebut dapat menyebabkan:
- **Permintaan HTTP berulang:** Rebuild yang terjadi berkali-kali dapat memicu permintaan GET baru yang sebenarnya tidak diperlukan.
- **Pemborosan bandwidth dan beban server:** Permintaan berulang dapat meningkatkan penggunaan jaringan dan jumlah request ke backend.
- **Perubahan tampilan loading:** `FutureBuilder` dapat kembali ke kondisi menunggu ketika menerima `Future` baru, sehingga tampilan loading dapat muncul kembali.

Dengan menginisialisasi `Future` di dalam `initState()`, objek `Future` dibuat ketika widget pertama kali dipasang ke widget tree. Instance tersebut dapat digunakan kembali selama tidak diganti secara eksplisit.

Penyegaran data tetap dapat dilakukan melalui `RefreshIndicator`, yang memanggil fungsi pengambilan data kembali dan memperbarui `Future` dengan instance baru.

**Melempar `ApiException` Alih-Alih Mengembalikan `null`:**

Mengembalikan `null` ketika menerima respons HTTP non-2xx memiliki beberapa kelemahan:
- **Kehilangan informasi error:** Pemanggil sulit membedakan kondisi data kosong dengan kegagalan permintaan, seperti error 500 dari server.
- **Tidak dapat membedakan status HTTP:** Tanpa informasi status code, pemanggil kesulitan membedakan respons 401 (*unauthorized*), 403 (*forbidden*), dan 500 (*internal server error*).
- **Risiko kesalahan saat pengolahan data:** Jika nilai `null` tidak ditangani dengan benar, aplikasi dapat mengalami error ketika data tersebut digunakan.

Dengan melempar `ApiException(statusCode, message)`, penanganan error menjadi lebih eksplisit dan terstruktur. `FutureBuilder` dapat menangkap error melalui `snapshot.hasError`, sedangkan formulir dapat menggunakan `catch (ApiException e)` untuk menampilkan pesan yang sesuai.

Pada aplikasi ini, penanganan status 401 juga penting karena sesi pengguna perlu dibersihkan melalui `AuthState.clearSession` ketika token tidak lagi dapat digunakan.

---

### 3. Bandingkan `SessionAuthentication` milik Django (dari Tutorial 04/07) dengan `TokenAuthentication` milik DRF (dari Tutorial 10). Mengapa `myportofolio_mobile` menggunakan `TokenAuthentication` sementara `SessionAuthentication` tetap diaktifkan pada backend Django?

**Perbandingan `SessionAuthentication` dan `TokenAuthentication`:**

| Aspek | `SessionAuthentication` | `TokenAuthentication` |
| :--- | :--- | :--- |
| **Mekanisme** | Menggunakan session ID yang disimpan dalam cookie browser (`sessionid`). Django menyimpan data sesi di server dan browser mengirimkan cookie pada permintaan berikutnya. | Menggunakan token unik yang dikirim melalui header `Authorization: Token <key>`. Token disimpan dan dikirim oleh klien secara eksplisit. |
| **CSRF Protection** | Memerlukan perlindungan CSRF untuk permintaan mutasi karena autentikasi menggunakan cookie yang dikirim secara otomatis oleh browser. | Tidak menggunakan mekanisme CSRF yang sama dengan autentikasi berbasis cookie karena token dikirim melalui header `Authorization` secara eksplisit. |
| **Statefulness** | *Stateful*: server menyimpan data sesi dan mencocokkan permintaan dengan sesi tersebut. | `TokenAuthentication` bawaan DRF tetap melibatkan penyimpanan token di server. Token dikirim oleh klien, kemudian diverifikasi berdasarkan data token yang tersimpan. |
| **Cocok untuk** | Aplikasi web berbasis browser yang menggunakan cookie dan session Django. | Klien API seperti aplikasi mobile, desktop, dan aplikasi lain yang mengirimkan token melalui header HTTP. |

**Mengapa `myportofolio_mobile` Menggunakan `TokenAuthentication`:**

Aplikasi Flutter menggunakan package `http` untuk mengirim permintaan ke backend Django. Berbeda dengan browser, klien HTTP tersebut tidak otomatis mengelola cookie session seperti browser pada umumnya. Oleh karena itu, penggunaan token lebih sesuai untuk kebutuhan autentikasi aplikasi ini.

Beberapa pertimbangannya:
- **Pengiriman autentikasi secara eksplisit:** Aplikasi menyertakan token melalui header `Authorization: Token <key>` pada permintaan yang memerlukan autentikasi.
- **Tidak bergantung pada cookie browser:** Aplikasi mobile tidak perlu mengandalkan mekanisme cookie session yang biasa digunakan oleh browser.
- **Kemudahan integrasi:** Token dapat dikelola melalui `AuthState` dan digunakan kembali oleh `ApiClient` ketika mengirim permintaan terautentikasi.

**Mengapa `SessionAuthentication` Tetap Diaktifkan pada Backend:**

Backend Django tetap mengaktifkan `SessionAuthentication` bersama `TokenAuthentication` karena keduanya dapat melayani kebutuhan klien yang berbeda:
- **Mendukung beberapa jenis klien:** Halaman web Django dapat menggunakan cookie session, sedangkan aplikasi mobile menggunakan token.
- **DRF Browsable API:** Interface bawaan DRF dapat memanfaatkan session authentication untuk membantu developer menguji endpoint melalui browser.
- **Fleksibilitas integrasi:** Backend tetap dapat melayani klien yang menggunakan autentikasi berbasis session tanpa menghilangkan dukungan token untuk aplikasi mobile.

Dengan demikian, `myportofolio_mobile` menggunakan `TokenAuthentication` karena mekanisme tersebut lebih sesuai dengan cara aplikasi mengirim permintaan API, sedangkan `SessionAuthentication` tetap tersedia untuk kebutuhan akses berbasis browser.

---

### 4. Jelaskan peran job `build` (`very_good_workflows`) dan `build_apk` dalam pipeline `.github/workflows/main.yaml` milikmu (termasuk pemeriksaan apa saja yang dijalankan `very_good_workflows` di balik layar). Mengapa berkas `*.g.dart` dimasukkan ke `.gitignore` meskipun CI membutuhkannya untuk menganalisis dan membangun aplikasi?

**Peran Job `build` (`very_good_workflows`):**

Job `build` menggunakan reusable workflow dari `VeryGoodOpenSource/very_good_workflows`, yaitu `flutter_package.yml@v2`.

Berdasarkan konfigurasi workflow yang digunakan, proses ini mencakup beberapa tahapan:
- **`flutter pub get`:** Mengunduh dependensi yang didefinisikan dalam `pubspec.yaml`.
- **`setup` (custom):** Menjalankan perintah tambahan yang didefinisikan melalui parameter `setup`. Pada proyek ini, perintah tersebut digunakan untuk menjalankan:
  ```bash
  dart run build_runner build --delete-conflicting-outputs
  ```
  Perintah ini menghasilkan berkas `*.g.dart` yang dibutuhkan oleh model `@JsonSerializable`.
- **Formatting:** Memeriksa format kode Dart menggunakan `dart format --set-exit-if-changed .`.
- **Static analysis:** Menjalankan `flutter analyze` untuk mendeteksi error, warning, dan pelanggaran aturan lint.
- **Testing:** Menjalankan `flutter test --coverage` untuk menjalankan pengujian dan menghasilkan laporan *code coverage*.

Berkas hasil generate dapat dikecualikan dari analisis atau perhitungan coverage melalui konfigurasi proyek, sesuai pengaturan yang digunakan.

**Peran Job `build_apk`:**

Job `build_apk` dijalankan setelah job `build` berhasil melalui konfigurasi `needs: build`. Job ini bertujuan menghasilkan APK release yang dapat diunduh sebagai artefak GitHub Actions.

Tahapannya meliputi:
1. Checkout kode sumber dari repositori.
2. Setup Java JDK 17 untuk kebutuhan Android Gradle build system.
3. Setup Flutter SDK versi `3.24.5`.
4. Menjalankan `flutter pub get` untuk mengunduh dependensi.
5. Menjalankan `dart run build_runner build --delete-conflicting-outputs` untuk menghasilkan berkas `*.g.dart`.
6. Menyetujui Android SDK licenses.
7. Membangun APK release menggunakan:
   ```bash
   flutter build apk --release
   ```
8. Mengunggah hasil build sebagai artefak GitHub Actions dengan nama `app-release-apk`.

**Mengapa `*.g.dart` Dimasukkan ke `.gitignore`:**

Berkas `*.g.dart` merupakan kode hasil generate otomatis dari berkas sumber Dart menggunakan `build_runner`. Berkas tersebut dapat dihasilkan kembali berdasarkan definisi model dan anotasi yang tersedia.

Alasan berkas ini tidak disertakan dalam version control adalah:
- **Berkas turunan:** `*.g.dart` merupakan hasil generate dari kode sumber, bukan tempat utama untuk mengubah logika model.
- **Mengurangi perubahan yang tidak diperlukan:** Tidak menyimpan berkas hasil generate dapat mengurangi jumlah perubahan pada Git ketika model diperbarui.
- **Mengurangi risiko konflik:** Perubahan pada model dapat menghasilkan perubahan otomatis pada berkas generated yang berpotensi menimbulkan konflik ketika dikerjakan secara paralel.
- **CI tetap dapat berjalan:** Pipeline menjalankan `build_runner` sebelum proses analisis dan build yang membutuhkan berkas tersebut. Dengan demikian, berkas generated tetap tersedia selama proses CI meskipun tidak disimpan di repositori.

---

## AI Disclosure — Tugas 9

### Tools AI yang Digunakan

**Gemini**

### Bagian yang Dibantu AI dan Kontribusi Saya

| Bagian | Peran AI | Yang Saya Lakukan |
| :--- | :--- | :--- |
| **Integrasi Backend DRF (Semua Modul)** | Membantu penyusunan model serialisasi menggunakan `@JsonSerializable`serta mengimplementasi API melalui `ApiClient` untuk endpoint GET dan POST | Menyesuaikan struktur model dengan kebutuhan data aplikasi dan backend Django, memeriksa kesesuaian field dengan serializer, menentukan penanganan field read_only, serta menguji proses pengambilan dan pengiriman data melalui API. |
| **Formulir Terautentikasi & Post-Save Flow** | Membantu implementasi guard `ensureLoggedIn()`, pengiriman POST dengan token `AuthState`, penanganan `ApiException` sesi 401, dan penutupan dialog konfirmasi. | Menentukan alur UX saat pengguna belum login, mengevaluasi perilaku saat token kedaluwarsa, mengarahkan penutupan dialog ringkasan dengan `pop()` sebelum menutup form, serta memverifikasi refresh data otomatis pada layar list. |
| **CI/CD Pipeline** | Membantu penyesuaian konfigurasi workflow, termasuk penambahan proses `build_runner` dan pengaturan very_good_workflows. | Mengidentifikasi kebutuhan menjalankan `build_runner` pada CI setelah `*.g.dart` dimasukkan ke `.gitignore`, serta menentukan langkah yang diperlukan pada job build dan build_apk. |

### Evaluasi Hasil AI, Perbaikan Manual, dan Keputusan Pengembangan

1. **Penanganan Field `read_only` pada Model**
   - **Proses Pengembangan:** Saya menentukan field mana saja yang perlu ditandai `includeToJson: false` dengan memeriksa `read_only_fields` pada setiap Django serializer (`ExperienceSerializer`, `SkillSerializer`, dll.). Misalnya, `started_at` pada Experience bersifat `auto_now_add` sehingga tidak boleh dikirim dari klien.

2. **Konfigurasi CI/CD**
   - **Perbaikan Manual:** Setelah menambahkan `*.g.dart` ke `.gitignore`, saya mengidentifikasi bahwa kedua job CI (bukan hanya `build_apk`) memerlukan langkah `build_runner`. Job `build` menggunakan parameter `setup` dari `very_good_workflows`, sedangkan `build_apk` menjalankan langkah `run` terpisah.

### Refleksi Kritis terhadap Penggunaan AI

Dalam Tugas 9, AI membantu proses implementasi, terutama pada penyusunan boilerplate serialisasi model, komunikasi HTTP melalui ApiClient, penanganan autentikasi dan alur setelah formulir berhasil disimpan, serta penyesuaian konfigurasi CI/CD. Meskipun demikian, saya tetap terlibat dalam menentukan kebutuhan dan mengevaluasi hasil implementasi. Saya memeriksa kesesuaian struktur model dengan serializer Django, menentukan field yang perlu dikecualikan dari payload, serta menetapkan alur autentikasi dan navigasi sesuai kebutuhan aplikasi. Selain itu, saya memeriksa proses pengiriman dan pengambilan data melalui API serta menjalankan `flutter analyze` untuk memastikan kualitas kode setelah perubahan. Dengan demikian, AI digunakan sebagai alat bantu untuk mempercepat implementasi dan membantu penyelesaian masalah teknis. Sementara itu, keputusan pengembangan, evaluasi hasil, pengujian, dan tanggung jawab terhadap aplikasi tetap berada pada saya.

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
2. **Pada Bilah Menu Samping (`left_drawer.dart`):** Digunakan pada aksen navigasi menu aktif `LeftDrawer` (dengan warna latar header Navy solid `#0D234A` dan avatar inisial putih).
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
