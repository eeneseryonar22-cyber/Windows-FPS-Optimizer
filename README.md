# 🚀 Windows Game & Performance Optimizer

[TR] Windows için tasarlanmış; FPS artırma, Input Lag azaltma ve gereksiz sistem yüklerini temizleme aracı. Anti-cheat (EAC, BattEye, RageMP) ve PC Check rutinleri ile %100 uyumludur.

[EN] A lightweight Windows optimization tool designed to boost FPS, reduce input lag, and remove bloatware. 100% Safe for Anti-Cheat (EAC, BattEye, RageMP) and PC Check routines.

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

### 📌 Dosyalar ve Özellikler
* **`FPS_Tweaks.bat` (Otomatik Optimizasyon):**
  * **Güç Planı Temizliği:** Sistemde biriken yinelenen "Nihai Performans" planlarını otomatik temizler.
  * **Giriş Gecikmesi (Input Lag) Azaltma:** Fare ve klavye için `ThreadPriority` ve ivme ayarlarını optimize eder.
  * **İşlemci & GPU Önceliği:** Oyun süreçlerine yüksek öncelik atar ve HAGS desteğini aktif eder.
  * **Bloatware Temizliği:** Arka planda kaynak tüketen gereksiz Windows uygulamalarını ve servisleri kaldırır.
* **`FPS_Tweaks.txt` (Manuel Optimizasyon Rehberi):**
  * BIOS, ReBAR/SAM, XMP/DOCP ayarları.
  * Windows görsel efektleri, başlangıç yöneticisi ve ekran kartı sürücü yapılandırmaları.
  * Fr33thy paketleri ve uygulama içi (Steam, Discord) performans ayarları.

### 🛠️ Nasıl Kullanılır?
1. **Otomatik:** `FPS_Tweaks.bat` dosyasına sağ tıklayıp **Yönetici Olarak Çalıştır**'ı seçin ve ardından bilgisayarınızı yeniden başlatın.
2. **Manuel:** `FPS_Tweaks.txt` dosyasındaki adımları takip ederek kapsamlı optimizasyonları manuel olarak uygulayın.

---

## 🇬🇧 English

### 📌 Files & Features
* **`FPS_Tweaks.bat` (Automatic Optimization):**
  * **Power Plan Cleanup:** Automatically removes duplicate power schemes.
  * **Input Lag Reduction:** Tunes `ThreadPriority` and pointer acceleration for lower latency.
  * **CPU & GPU Priority:** Assigns high scheduling priority to games and enables HAGS.
  * **Bloatware Removal:** Strips away non-essential Windows applications.
* **`FPS_Tweaks.txt` (Manual Optimization Guide):**
  * BIOS, ReBAR/SAM, and XMP/DOCP configurations.
  * Windows visual effects, startup management, and driver guidelines.
  * Fr33thy optimization steps and in-app (Steam, Discord) performance tweaks.

### 🛠️ How to Use
1. **Automatic:** Right-click `FPS_Tweaks.bat`, select **Run as Administrator**, and restart your PC.
2. **Manual:** Follow the step-by-step instructions inside `FPS_Tweaks.txt`.

---

### ⚠️ Disclaimer / Sorumluluk Reddi
* **TR:** Bu betik ve rehber Windows registry ve sistem ayarlarını düzenler. Kullanım sorumluluğu kullanıcıya aittir.
* **EN:** This script and guide modify Windows registry and system settings. Use it at your own risk.
