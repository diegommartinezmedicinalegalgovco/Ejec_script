# Especifica la ruta de destino para descargar el archivo
$rutaDestino = "C:\Windows\System32\ProtectorML.scr"

# Descarga el contenido de la URL y guarda el archivo en la ruta especificada
$url = "https://github.com/diegommartinezmedicinalegalgovco/ProtectorML/raw/main/ProtectorML.scr"
Invoke-WebRequest -Uri $url -OutFile $rutaDestino

# Define la ubicación del Registro
$registroDesktop = "HKCU:\Control Panel\Desktop"

# Define el nombre de la entrada que deseas crear o modificar en Desktop
$nombreEntradaDesktop = "SCRNSAVE.EXE"

# Modifica el valor de ScreenSaveTimeOut
Set-ItemProperty -Path $registroDesktop -Name "ScreenSaveTimeOut" -Value 180 -Type String

# Modifica el valor de ScreenSaveActive
Set-ItemProperty -Path $registroDesktop -Name "ScreenSaveActive" -Value 1 -Type String

# Asigna el protector de pantalla descargado
Set-ItemProperty -Path $registroDesktop -Name $nombreEntradaDesktop -Value $rutaDestino -Type String

# Reiniciar el servicio de temas para aplicar los cambios
Restart-Service -Name Themes

Set-ExecutionPolicy Unrestricted -Scope Process -Force



# Define la ubicación del Registro
$registroDesktop = "HKCU:\Control Panel\Desktop"
$registroScreensavers = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Screensavers"

# Define el nombre de la entrada que deseas crear o modificar en Desktop
$nombreEntradaDesktop = "SCRNSAVE.EXE"


# Descarga el contenido de la URL y guarda el archivo en la ruta especificada
$url = "https://github.com/diegommartinezmedicinalegalgovco/ProtectorML/raw/main/ProtectorML.scr"
Invoke-WebRequest -Uri $url -OutFile $rutaDestino

# Especifica la ruta de destino para descargar el archivo
$rutaDestino = "C:\Windows\System32\ProtectorML.scr"


# Modifica el valor de ScreenSaveTimeOut
Set-ItemProperty -Path $registroDesktop -Name "ScreenSaveTimeOut" -Value 180 -type String
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveTimeOut /t REG_SZ /d "180" /f

# Modifica el valor de ScreenSaveActive
Set-ItemProperty -Path $registroDesktop -Name "ScreenSaveActive" -Value 1 -type String
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d "1" /f

# Asigna el protector de pantalla descargado
Set-ItemProperty -Path $registroDesktop -Name $nombreEntradaDesktop -Value $rutaDestino -Type String

# Reiniciar el servicio de temas para aplicar los cambios
Restart-Service -Name Themes


reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v ScreenSaveTimeOut /t REG_SZ /d "180" /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d "1" /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v SCRNSAVE.EXE /t REG_SZ /d "C:\Windows\System32\ProtectorML.scr" /f

# Reiniciar el servicio de temas para aplicar los cambios
Restart-Service -Name Themes

Set-ExecutionPolicy RemoteSigned -Scope Process -Force

# URL del archivo a descargar
$url = "https://github.com/diegommartinezmedicinalegalgovco/ProtectorML/raw/main/ProtectorML.scr"

# Ruta local donde se guardará el archivo en System32
$localPath = "C:\Windows\System32\ProtectorML.scr"

# Descargar el archivo desde la URL
Invoke-WebRequest -Uri $url -OutFile $localPath

# Establecer el protector de pantalla a través del registro
$regPath = "HKCU:\Control Panel\Desktop"
$regName = "SCRNSAVE.EXE"
$regValue = $localPath

# Crear o actualizar la entrada en el registro
New-ItemProperty -Path $regPath -Name $regName -Value $regValue -Force

# Reiniciar el servicio del protector de pantalla
Stop-Process -Name explorer -Force
