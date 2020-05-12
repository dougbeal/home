#[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] "DisableLockWorkstation"=dword:00000001

# disable Windows-L, interferres with macOS/Barrier
$lkWorkstation = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System'


if (-not (Test-Path -Path $lkWorkstation))
{
    New-Item -Path $lkWorkstation 
}
New-ItemProperty -Path $lkWorkstation -Name DisableLockWorkstation -Value 1

# 
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};

$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';

New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);
