# 🚀 Windows Game & Performance Optimizer

[TR] Windows için tasarlanmış; FPS artırma, Input Lag azaltma ve gereksiz sistem yüklerini temizleme betiği. Anti-cheat (EAC, BattEye, RageMP) ve PC Check rutinleri ile %100 uyumludur.

[EN] A lightweight Windows optimization batch script designed to boost FPS, reduce input lag, and remove bloatware. 100% Safe for Anti-Cheat (EAC, BattEye, RageMP) and PC Check routines.

---

## 🛡️ Special Note for Admins / PC Checkers (Yetkililer İçin Özel Not)

> **TR:** Bu betik sadece standart Windows performans ve registry ayarlarını yapılandırır. 
> - **Event Logs (Olay Günlükleri)**, **Prefetch**, **BAM**, **USN Journal** veya **MUI Cache** gibi hiçbir delil/iz kaydını **SİLMEZ**.
> - Telemetry dinleyicilerini durdurmaz veya log karartma (clearing) işlemi **YAPMAZ**.
> - PC Check araçlarında veya log analizlerinde "Delil Karartma / Clearing" uyarısı verdirecek hiçbir komut içermez.

> **EN:** This script only configures standard Windows performance and registry tweaks.
> - It **DOES NOT CLEAR** or tamper with **Event Logs**, **Prefetch**, **BAM**, **USN Journal**, or **MUI Cache**.
> - It contains zero log-wiping, telemetry-stopping, or clearing routines.
> - Fully transparent and 100% safe for server PC Check tools & anti-cheat engines.

---

## 🇹🇷 Türkçe

### 📌 Özellikler
* **Güç Planı Temizliği:** Sistemde biriken yinelenen "Nihai Performans" planlarını otomatik temizler ve tek bir kararlı plan oluşturur.
* **Giriş Gecikmesi (Input Lag) Azaltma:** Fare ve klavye için `ThreadPriority` ve ivme ayarlarını optimize ederek gecikmeyi düşürür.
* **İşlemci & GPU Önceliği:** Oyun süreçlerine yüksek öncelik (High Priority) atar ve HAGS desteğini aktif eder.
* **Bloatware Temizliği:** Arka planda kaynak tüketen 40'tan fazla gereksiz Windows uygulamasını ve telemetry servislerini kaldırır.
* **Anti-Cheat & PC Check Dostu:** Olay günlükleri (Event Logs), Prefetch veya USN Journal iz kayıtlarına dokunmaz. Sunucu PC Check kontrollerinde "Clearing" uyarısı vermez.

### 🛠️ Nasıl Kullanılır?
1. `FPS_Tweaks.bat` dosyasını indirin.
2. Dosyaya sağ tıklayıp **Yönetici Olarak Çalıştır**'ı seçin.
3. İşlem tamamlandıktan sonra bilgisayarınızı **yeniden başlatın**.

---

## 🇬🇧 English

### 📌 Features
* **Power Plan Cleanup:** Automatically removes duplicate "Ultimate Performance" power schemes and keeps a single active profile.
* **Input Lag Reduction:** Tunes `ThreadPriority` and pointer acceleration registry entries for lower mouse and keyboard latency.
* **CPU & GPU Priority:** Assigns high scheduling priority to games and enables Hardware-Accelerated GPU Scheduling (HAGS).
* **Bloatware Removal:** Strips away 40+ non-essential built-in Windows applications and background telemetry services.
* **Anti-Cheat & PC Check Safe:** Leaves Event Logs, Prefetch, and USN Journal untouched to prevent false-positive bans on competitive platforms (RageMP, EAC, BattEye).

### 🛠️ How to Use
1. Download `optimizasyon.bat`.
2. Right-click the file and select **Run as Administrator**.
3. **Restart your computer** after the execution finishes.

---

### ⚠️ Disclaimer / Sorumluluk Reddi
* **TR:** Bu betik Windows registry ve sistem ayarlarını düzenler. Kullanım sorumluluğu kullanıcıya aittir.
* **EN:** This script modifies Windows registry and system settings. Use it at your own risk.
