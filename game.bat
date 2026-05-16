@echo off
title M7L TEAM HACK - Steam Account Checker
color 0A

:: ============================================
:: M7L TEAM HACK | ACCOUNT GAME STEAM
:: Instagram: m7l.misoz | Telegram: m7lmisoz
:: ============================================

echo ===============================================
echo     M7L TEAM HACK | ACCOUNT GAME STEAM
echo     Instagram: m7l.misoz | Telegram: m7lmisoz
echo ===============================================
echo.

:: قائمة الحسابات (اللعبة - username - password)
set account[1].game=Dune: Awakening
set account[1].user=gaji92439
set account[1].pass=Zakarius@++19741981

set account[2].game=7 Days to Die
set account[2].user=sutencoheadlimesdia
set account[2].pass=arczydU1l1skFa

:: ============================================
:: اختيار الحساب
:: ============================================
echo اختر الحساب الذي تريد التحقق منه:
echo.
echo 1. %account[1].game%
echo 2. %account[2].game%
echo.
set /p choice="ادخل الرقم (1 أو 2): "

:: تعيين المتغيرات بناءً على الاختيار
if "%choice%"=="1" (
    set game_name=%account[1].game%
    set username=%account[1].user%
    set password=%account[1].pass%
)
if "%choice%"=="2" (
    set game_name=%account[2].game%
    set username=%account[2].user%
    set password=%account[2].pass%
)

:: التحقق من أن المستخدم أدخل رقماً صحيحاً
if "%username%"=="" (
    echo ❌ اختيار غير صحيح.
    pause
    exit /b
)

:: ============================================
:: عرض بيانات الحساب المختار
:: ============================================
echo.
echo ===============================================
echo اللعبة: %game_name%
echo اسم المستخدم: %username%
echo كلمة المرور: %password%
echo ===============================================
echo.

:: ============================================
:: التحقق من صحة الحساب باستخدام SteamCMD
:: ============================================
echo 🔍 جاري التحقق من صحة الحساب...
echo.

:: التحقق من وجود SteamCMD
if not exist "C:\steamcmd\steamcmd.exe" (
    echo ⚠️ SteamCMD غير موجود! حمّله من:
    echo https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
    echo وفك الضغط في المجلد C:\steamcmd
    pause
    exit /b
)

:: محاولة تسجيل الدخول
C:\steamcmd\steamcmd.exe +login %username% %password% +quit > "%temp%\steam_result.txt" 2>&1

:: تحليل النتيجة
findstr /C:"Logged in OK" "%temp%\steam_result.txt" >nul
if %errorlevel% equ 0 (
    echo ✅ الحساب صالح وشغال!
) else (
    findstr /C:"Invalid password" "%temp%\steam_result.txt" >nul
    if %errorlevel% equ 0 (
        echo ❌ كلمة المرور غير صحيحة
    ) else (
        findstr /C:"Steam Guard" "%temp%\steam_result.txt" >nul
        if %errorlevel% equ 0 (
            echo ⚠️ الحساب عليه Steam Guard - يحتاج رمز تحقق
        ) else (
            echo ❌ فشل التحقق - تأكد من اتصال الإنترنت
        )
    )
)

:: تنظيف الملفات المؤقتة
del "%temp%\steam_result.txt" 2>nul

echo.
echo ===============================================
echo Instagram: m7l.misoz | Telegram: m7lmisoz
echo ===============================================
pause
