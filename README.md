# 🎮 Gamify

Selamat datang di **Gamify** – platform top-up game dan layanan digital yang dibuat dengan **Laravel 10.x** dan **Vite** untuk performa optimal di production. 🚀

---

## 📚 Informasi Proyek

**Gamify** adalah proyek matakuliah **Sistem Informasi** di **Institut Teknologi Indonesia** dengan bimbingan:
- 👨‍🏫 **Dosen**: Ir. SUMIARTI ANDRI, M.Kom.

### 👥 Tim Pengembang
Proyek ini dikerjakan secara berkelompok oleh:
| Nama | NIM | Peran |
|------|-----|-------|
| Nathania Englandia S | 1152700020 | 🔵 Project Manager |
| Jonathan Natannael Z | 1152200024 | 💻 FullStack Programmer |
| Keysha Nur Khansa U | 1152700035 | 📖 Dokumentasi |
| Alayha Hafiz | 1152700006 | 🔍 Analisis |

---

## ✨ Fitur Unggulan

### 🏆 Untuk Pengguna
- 🔥 **Top-up Games** – Beli item favoritmu dengan mudah
- 💖 **Wishlist** – Simpan game atau item yang ingin kamu beli
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

2. **Extract vendor.zip**

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

# 🧪 Testing Guide - Gamify

Dokumen ini menjelaskan struktur dan cara menjalankan unit testing untuk aplikasi Gamify.

---

## 📋 Struktur Testing

```
tests/
├── Unit/
│   ├── Models/
│   │   ├── UserModelTest.php          # Test Model User
│   │   ├── OrderModelTest.php         # Test Model Order
│   │   └── TopUpServiceModelTest.php  # Test Model TopUpService
│   └── ValidationTest.php             # Test Validasi Input
├── Feature/
│   ├── Auth/
│   │   └── AuthenticationTest.php     # Test Login/Register
│   ├── Api/
│   │   ├── TopUpApiTest.php           # Test API Top-up
│   │   └── UserApiTest.php            # Test API User
│   ├── OrderFeatureTest.php           # Test Feature Order
│   ├── TransactionFeatureTest.php     # Test Feature Transaction
│   ├── SupportTicketFeatureTest.php   # Test Feature Support Ticket
│   └── BlogFeatureTest.php            # Test Feature Blog
├── TestCase.php                       # Base TestCase
└── CreatesApplication.php             # Setup Application
```

---

## 🚀 Cara Menjalankan Tests

### 1. **Jalankan Semua Tests**
```bash
php artisan test
```

### 2. **Jalankan Tests dengan Coverage Report**
```bash
php artisan test --coverage
```

### 3. **Jalankan Specific Test Suite**
```bash
# Hanya Unit Tests
php artisan test --testsuite=Unit

# Hanya Feature Tests
php artisan test --testsuite=Feature
```

### 4. **Jalankan Test File Tertentu**
```bash
php artisan test tests/Unit/Models/UserModelTest.php
```

### 5. **Jalankan Specific Test Method**
```bash
php artisan test tests/Feature/OrderFeatureTest.php --filter test_user_can_view_their_orders
```

### 6. **Jalankan Tests dengan Output Verbose**
```bash
php artisan test --verbose
```

---

## 📊 Test Coverage

Aplikasi Gamify mencakup testing untuk:

### ✅ Unit Tests (Models & Validations)
- **UserModelTest** - Test pembuatan user, password hashing, token API
- **OrderModelTest** - Test pembuatan order, status update, relasi dengan user
- **TopUpServiceModelTest** - Test top-up service CRUD operations
- **ValidationTest** - Test email, password, phone number validation

### ✅ Feature Tests (User Workflows)
- **AuthenticationTest** - Test login, register, logout, password validation
- **OrderFeatureTest** - Test membuat order, melihat order, cancel order
- **TransactionFeatureTest** - Test history transaksi, filter, balance tracking
- **SupportTicketFeatureTest** - Test membuat ticket, add message, close ticket
- **BlogFeatureTest** - Test membaca blog, admin create/edit blog

### ✅ API Tests
- **TopUpApiTest** - Test fetch services, create order, error handling
- **UserApiTest** - Test get profile, update profile, change password

---

## 🧪 Contoh Test Cases

### Unit Test - User Model
```php
public function test_user_can_be_created()
{
    $user = User::create([
        'name' => 'Test User',
        'email' => 'test@example.com',
        'password' => bcrypt('password123'),
    ]);

    $this->assertDatabaseHas('users', [
        'email' => 'test@example.com',
    ]);
}
```

### Feature Test - Create Order
```php
public function test_user_can_create_order()
{
    $user = User::factory()->create();

    $response = $this->actingAs($user)->post('/orders', [
        'amount' => 50000,
        'payment_method' => 'credit_card',
    ]);

    $this->assertDatabaseHas('orders', [
        'user_id' => $user->id,
        'amount' => 50000,
    ]);
}
```

### API Test - Fetch Services
```php
public function test_can_fetch_all_topup_services()
{
    TopUpService::factory(5)->create();

    $response = $this->getJson('/api/topup-services');

    $response->assertStatus(200)
        ->assertJsonStructure(['data' => ['*' => ['id', 'name']]]);
}
```

---

## 🛠️ Setup Testing Environment

### 1. **Konfigurasi Database Testing (phpunit.xml)**
```xml
<php>
    <env name="APP_ENV" value="testing"/>
    <env name="DB_CONNECTION" value="sqlite"/>
    <env name="DB_DATABASE" value=":memory:"/>
    <env name="MAIL_MAILER" value="array"/>
</php>
```

### 2. **Jalankan Database Migrations**
Database testing akan otomatis di-setup ketika test dijalankan.

### 3. **Gunakan Database Factories**
```php
// Buat user dengan factory
$user = User::factory()->create();

// Buat multiple users
$users = User::factory(5)->create();
```

---

## 📝 Testing Best Practices

### ✅ DO's
- ✅ Gunakan `RefreshDatabase` trait untuk isolasi data antar test
- ✅ Test satu behavior di satu test method
- ✅ Gunakan descriptive test names
- ✅ Test both happy path dan error cases
- ✅ Mock external services seperti payment gateway

### ❌ DON'Ts
- ❌ Jangan test logic di views
- ❌ Jangan membuat dependency antar tests
- ❌ Jangan hardcode values - gunakan factories
- ❌ Jangan skip test yang failed

---

## 🔍 Test Assertion Cheat Sheet

```php
// Database Assertions
$this->assertDatabaseHas('users', ['email' => 'test@example.com']);
$this->assertDatabaseMissing('users', ['id' => 999]);
$this->assertDatabaseCount('users', 5);

// Response Assertions
$response->assertStatus(200);
$response->assertOk();
$response->assertForbidden();
$response->assertRedirect('/login');
$response->assertViewHas('user');
$response->assertJson(['key' => 'value']);

// Authentication Assertions
$this->assertAuthenticatedAs($user);
$this->assertGuest();

// Soft Delete Assertions
$this->assertSoftDeleted('users', ['id' => $userId]);
```

---

## 📈 Continuous Testing

### Jalankan Tests Otomatis Saat Development
```bash
# Watch mode (memerlukan package tambahan)
php artisan test --watch
```

### CI/CD Integration
Tambahkan ke pipeline CI/CD Anda:
```yaml
- name: Run Tests
  run: php artisan test
```

---

## 🐛 Debugging Tests

### 1. Gunakan Logging
```php
\Log::info('Debug value:', ['value' => $variable]);
```

### 2. Dump Response
```php
$response->dump(); // Print response body
$response->dumpHeaders(); // Print response headers
```

### 3. Gunakan Debugger
```php
dd($variable); // Stop execution dan dump variable
```

### 4. Run Single Test dengan Verbose
```bash
php artisan test tests/Feature/OrderFeatureTest.php --verbose
```

---

## 📚 Referensi

- [Laravel Testing Documentation](https://laravel.com/docs/10.x/testing)
- [PHPUnit Documentation](https://phpunit.de/documentation.html)
- [Factory Documentation](https://laravel.com/docs/10.x/eloquent-factories)

---

## 📜 Lisensi
Proyek ini menggunakan lisensi **MIT**.

---

🚀 **Nikmati pengalaman top-up game terbaik dengan Gamify!** 🎮🔥