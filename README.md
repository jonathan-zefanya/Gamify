# 🎮 Gamify

Selamat datang di **Gamify** – platform top-up game dan layanan digital yang dibuat dengan **Laravel 10.x** dan **Vite** untuk performa optimal di production. 🚀

---

## ✨ Fitur Unggulan

### 🏆 Untuk Pengguna
- 🔥 **Top-up Games** – Beli item favoritmu dengan mudah
- 💖 **Wishlist** – Simpan game atau item yang ingin kamu beli
- 📡 **Live Streaming** – Saksikan dan bagikan gameplay
- 🔌 **API Content** – Jadi reseller dengan API kami
- 🎫 **Send Support Ticket** – Butuh bantuan? Hubungi kami langsung
- ⚡ Dan masih banyak lagi!

### 🔧 Untuk Admin
- 👤 **Manage Account** – Kelola akun pengguna dengan mudah
- 👥 **Manage Admin/Staff** – Atur peran dan izin admin
- 🎨 **Customize Website** – Ubah tampilan sesuai keinginan
- 📝 **Manage Blog** – Buat dan atur konten blog
- 💳 **Manage Payment** – Pantau dan kelola transaksi
- 🌍 **Multi Bahasa** – Dukungan banyak bahasa untuk pengguna global
- 🎟️ **Support Ticket** – Respon cepat untuk keluhan pengguna
- 🚀 Dan masih banyak lainnya!

---

## ⚙️ Persyaratan Sistem

Agar Gamify berjalan dengan lancar, pastikan server Anda memenuhi persyaratan berikut:

### 🖥️ Server Requirements
✅ **PHP**: Minimum versi **8.2**
✅ **MySQL**: Version **5.7+** atau **MariaDB 10.2+**

### 🔌 PHP Extensions yang Diperlukan
- ✅ BCMath
- ✅ Ctype
- ✅ Fileinfo
- ✅ JSON
- ✅ Mbstring
- ✅ OpenSSL
- ✅ PDO
- ✅ PDO_MYSQL
- ✅ Tokenizer
- ✅ XML
- ✅ CURL
- ✅ GD
- ✅ GMP

---

## 🚀 Cara Install

1. **Clone Repository**
   ```sh
   git clone https://github.com/JonathanZefanya/Web-TopUp.git
   cd Web-TopUp
   ```

2. **Install Dependencies**
   ```sh
   composer install
   npm install
   ```

3. **Konfigurasi .env**
   ```sh
   cp .env.example .env
   ```
   - Edit file `.env` sesuai dengan konfigurasi database Anda.

4. **Generate Key & Migrate Database**
   ```sh
   php artisan key:generate
   php artisan migrate --seed
   ```

5. **Build Frontend dengan Vite**
   ```sh
   npm run build
   ```

6. **Jalankan Server**
   ```sh
   php artisan serve
   ```

Website Anda sekarang siap digunakan di `http://127.0.0.1:8000` 🎉

---

## 📜 Lisensi
Proyek ini menggunakan lisensi **MIT**.

---

🚀 **Nikmati pengalaman top-up game terbaik dengan Gamify!** 🎮🔥