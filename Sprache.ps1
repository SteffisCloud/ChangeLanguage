# ==========================================
# Language / Region Switcher
# DE / US / UK
# ==========================================

Clear-Host

$currentCulture = (Get-Culture).Name
$currentUICulture = (Get-UICulture).Name

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "   Windows Language & Region Switcher"
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Aktuelle Kultur     : $currentCulture" -ForegroundColor Yellow
Write-Host "Aktuelle UI-Sprache : $currentUICulture" -ForegroundColor Yellow

Write-Host ""
Write-Host "Bitte auswählen:"
Write-Host ""
Write-Host "1 = Deutsch (Deutschland)"
Write-Host "2 = English (United States)"
Write-Host "3 = English (United Kingdom)"
Write-Host "0 = Abbrechen"
Write-Host ""

$choice = Read-Host "Ihre Auswahl"

switch ($choice)
{
    "1"
    {
        Write-Host ""
        Write-Host "Wechsle zu Deutsch (Deutschland)..." -ForegroundColor Green

        Set-Culture de-DE
        Set-WinSystemLocale de-DE

        try {
            Set-WinUILanguageOverride de-DE
        } catch {}

        $newCulture = "de-DE"
    }

    "2"
    {
        Write-Host ""
        Write-Host "Wechsle zu English (United States)..." -ForegroundColor Green

        Set-Culture en-US
        Set-WinSystemLocale en-US

        try {
            Set-WinUILanguageOverride en-US
        } catch {}

        $newCulture = "en-US"
    }

    "3"
    {
        Write-Host ""
        Write-Host "Wechsle zu English (United Kingdom)..." -ForegroundColor Green

        Set-Culture en-GB
        Set-WinSystemLocale en-GB

        try {
            Set-WinUILanguageOverride en-GB
        } catch {}

        $newCulture = "en-GB"
    }

    "0"
    {
        Write-Host ""
        Write-Host "Abgebrochen."
        exit
    }

    default
    {
        Write-Host ""
        Write-Host "Ungültige Auswahl." -ForegroundColor Red
        exit
    }
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Neue Einstellung: $newCulture"
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Melden Sie sich ab und wieder an,"
Write-Host "damit alle Anwendungen die Änderung übernehmen."
Write-Host ""

Pause