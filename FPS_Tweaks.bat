@echo off
title FPS, Input Lag ve Sistem Optimizasyon Scripti
color 0A

:: 1. Yonetici Haklari Kontrolu ve Oto-Yukseltme
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Yonetici haklari aliniyor, lutfen bekleyin...
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

echo ====================================================
echo   Windows FPS, Input Lag ve Sistem Optimizasyonu
echo ====================================================
echo.

:: 2. CMD VE GUC AYARLARI (FAZLA PLANLARI TEMIZLER VE TEKE INDIRIR)
echo [1/5] Guc Planlari Temizleniyor ve Nihai Performans Ayarlaniyor...

powershell -NoProfile -ExecutionPolicy Bypass -Command "$plans = Get-CimInstance -Namespace root\cimv2\power -ClassName Win32_PowerPlan | Where-Object { $_.ElementName -like '*Nihai Performans*' -or $_.ElementName -like '*Ultimate Performance*' }; if ($plans.Count -gt 1) { $plans | Select-Object -Skip 1 | ForEach-Object { $g = ($_.InstanceID -split '[\{\}]')[1]; powercfg -delete $g } }; if (-not $plans) { powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 > $null }; $active = Get-CimInstance -Namespace root\cimv2\power -ClassName Win32_PowerPlan | Where-Object { $_.ElementName -like '*Nihai Performans*' -or $_.ElementName -like '*Ultimate Performance*' } | Select-Object -First 1; if ($active) { $g = ($active.InstanceID -split '[\{\}]')[1]; powercfg -setactive $g }" >nul 2>&1

bcdedit /set disabledynamictick yes >nul 2>&1
powercfg.exe /hibernate off >nul 2>&1

:: 3. GPU / CPU OYUN ONCELIGI, INPUT LAG VE WINDOWS PERFORMANS
echo [2/5] Oyun Onceligi, Input Lag ve Sistem Ayarlari Yapiliyor...

:: SystemProfile Oyun Onceligi & Ag Ayari
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul

:: Tasks\Games Performans Profilleme
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 10000 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >nul

:: Fare & Klavye Gecikmesi Azaltma (Thread Priority & Acceleration Off)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "ThreadPriority" /t REG_DWORD /d 0x31 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "ThreadPriority" /t REG_DWORD /d 0x31 /f >nul
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >nul
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >nul

:: Power Throttling Kapatma
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f >nul

:: Bildirimler, Odaklanma Yardimi ve Cok Gorevli Kapatma
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d 0 /f >nul

:: Game Bar Kapali, Oyun Modu ve Fullscreen Optimizations Ayarlari
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f >nul

:: Donanim Hizlandirmali GPU Zamanlamasi (HAGS) ACIK
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 2 /f >nul

:: Gorsel Ayarlar: Saydamlik Kapali, Koyu Tema, Gorsel Efekt Performans, Masaustu Siyah, Bu Bilgisayar Ekle
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 0" /f >nul

:: Teslim Iyilestirme Kapali
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f >nul

:: 4. POWERSHELL BLOATWARE (44 PAKET) & OZEL GIZLILIK IZINLERI
echo [3/5] Bloatware Temizligi ve Ozel Gizlilik Izinleri Ayarlaniyor...

powershell -NoProfile -ExecutionPolicy Bypass -Command "$apps = @('Clipchamp.Clipchamp','Microsoft.3DBuilder','Microsoft.549981C3F5F10','Microsoft.BingFinance','Microsoft.BingFoodAndDrink','Microsoft.BingHealthAndFitness','Microsoft.BingNews','Microsoft.BingSports','Microsoft.BingTranslator','Microsoft.BingTravel','Microsoft.BingWeather','Microsoft.Windows.AIHub','Microsoft.PCManager','Microsoft.Getstarted','Microsoft.Messaging','Microsoft.Microsoft3DViewer','Microsoft.MicrosoftJournal','Microsoft.MicrosoftOfficeHub','Microsoft.MicrosoftPowerBIForWindows','Microsoft.MicrosoftSolitaireCollection','Microsoft.MicrosoftStickyNotes','Microsoft.MixedReality.Portal','Microsoft.News','Microsoft.Office.OneNote','Microsoft.Office.Sway','Microsoft.OneConnect','Microsoft.Print3D','Microsoft.PowerAutomateDesktop','Microsoft.SkypeApp','Microsoft.Todos','Microsoft.Windows.DevHome','Microsoft.WindowsAlarms','Microsoft.WindowsFeedbackHub','Microsoft.WindowsMaps','Microsoft.WindowsSoundRecorder','Microsoft.XboxApp','Microsoft.ZuneVideo','MicrosoftCorporationII.MicrosoftFamily','MicrosoftCorporationII.QuickAssist','MicrosoftTeams','MSTeams','Microsoft.People','Microsoft.windowscommunicationsapps'); foreach ($a in $apps) { Get-AppxPackage -AllUsers $a | Remove-AppxPackage -ErrorAction SilentlyContinue }" >nul 2>&1

powershell -NoProfile -ExecutionPolicy Bypass -Command "winget uninstall --id XP9CXNGPPJ97XX --accept-source-agreements --silent" >nul 2>&1

powershell -NoProfile -ExecutionPolicy Bypass -Command "$policyKeys = @('HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy','HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection','HKLM:\SOFTWARE\Policies\Microsoft\Windows\System'); foreach ($key in $policyKeys) { Remove-Item -Path $key -Recurse -Force -ErrorAction SilentlyContinue }; $allows = @('microphone', 'appointments', 'documentsLibrary', 'picturesLibrary', 'videosLibrary', 'broadFileSystemAccess'); foreach ($cap in $allows) { $p1 = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\' + $cap; $p2 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\' + $cap; if (-not (Test-Path $p1)) { New-Item -Path $p1 -Force | Out-Null }; if (-not (Test-Path $p2)) { New-Item -Path $p2 -Force | Out-Null }; Set-ItemProperty -Path $p1 -Name 'Value' -Value 'Allow' -Force -ErrorAction SilentlyContinue; Set-ItemProperty -Path $p2 -Name 'Value' -Value 'Allow' -Force -ErrorAction SilentlyContinue }; $denies = @('location', 'webcam', 'voiceActivation', 'userNotificationListener', 'userAccountInformation', 'contacts', 'phoneCall', 'callHistory', 'email', 'userDataTasks', 'chat', 'radios', 'appDiagnostics', 'bluetoothSync'); foreach ($cap in $denies) { $p1 = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\' + $cap; $p2 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\' + $cap; if (-not (Test-Path $p1)) { New-Item -Path $p1 -Force | Out-Null }; if (-not (Test-Path $p2)) { New-Item -Path $p2 -Force | Out-Null }; Set-ItemProperty -Path $p1 -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue; Set-ItemProperty -Path $p2 -Name 'Value' -Value 'Deny' -Force -ErrorAction SilentlyContinue }; Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue; $privPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy'; if (-not (Test-Path $privPath)) { New-Item -Path $privPath -Force | Out-Null }; Set-ItemProperty -Path $privPath -Name 'TailoredExperiencesWithDiagnosticDataEnabled' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue; Set-ItemProperty -Path $privPath -Name 'PublishUserActivities' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue; Set-ItemProperty -Path $privPath -Name 'UploadUserActivities' -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue; gpupdate /force" >nul 2>&1

:: 5. ONEDRIVE TAM KALDIRMA (TUM YOLLAR)
echo [4/5] OneDrive Kaldiriliyor...
taskkill /f /im OneDrive.exe >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage -allusers OneDriveSync | Remove-AppxPackage" >nul 2>&1
if exist "C:\Windows\System32\OneDriveSetup.exe" "C:\Windows\System32\OneDriveSetup.exe" /uninstall >nul 2>&1
if exist "C:\Windows\SysWOW64\OneDriveSetup.exe" "C:\Windows\SysWOW64\OneDriveSetup.exe" /uninstall >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem -Path '$env:LOCALAPPDATA\Microsoft\OneDrive\*\OneDriveSetup.exe' -ErrorAction SilentlyContinue | ForEach-Object { & $_.FullName /uninstall }" >nul 2>&1

echo.
echo ====================================================
echo   TUM AYARLAR VE REGEDIT KAYITLARI TAMAMLANDI!
echo   Lutfen bilgisayarinizi YENIDEN BASTATIN.
echo ====================================================
echo.
echo Kapatmak icin bir tusa basin...
pause >nul