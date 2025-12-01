ahmad baihaqi/ 231080200035
sc program 

<img width="266" height="566" alt="Screenshot 2025-12-01 211652" src="https://github.com/user-attachments/assets/ae2e3f8e-d589-443f-bdc2-62cfa4859e37" />
<img width="283" height="572" alt="Screenshot 2025-12-01 211611" src="https://github.com/user-attachments/assets/21893d15-a333-4000-9926-7a8eea416c27" />
<img width="267" height="562" alt="Screenshot 2025-12-01 211621" src="https://github.com/user-attachments/assets/81c26d06-1e15-48d9-80df-968610f347d8" />

1. **setState** — state dikelola langsung dalam widget (local state).
2. **Provider (ChangeNotifier)** — state dikelola secara global dengan state management.

Aplikasi ini memungkinkan pengguna menghitung operasi matematika dasar:
- Penjumlahan (+)
- Pengurangan (-)
- Perkalian (×)
- Pembagian (÷)

---

## 📌 Fitur Utama

### 🔹 1. Mode setState
- Perubahan nilai langsung merefresh UI.
- Data disimpan dalam widget itu sendiri.
- Tidak butuh file terpisah untuk menyimpan state.

### 🔹 2. Mode Provider
- Menggunakan **ChangeNotifier**.
- State dipisah ke dalam file `calculator_provider.dart`.
- UI otomatis update ketika state berubah.
- Lebih cocok untuk aplikasi besar.

User bisa mengganti mode menggunakan **switch** pada halaman awal.



