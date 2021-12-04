function find-oxywinner {
    Param($inputdata, $bitnumber)
    if (Test-Path zeros.txt) {Remove-Item .\zeros.txt}
    if (Test-Path ones.txt) {Remove-Item .\ones.txt}
    foreach ($line in $inputdata) {
        switch ($line[$bitnumber]) {
            0 {
                $line | Out-File zeros.txt -Append
                $zeros++
            }
            1 {
                $line | Out-File ones.txt -Append
                $ones++
            }
        }
    }

    if ($zeros -gt $ones) {
        return (Get-Content .\zeros.txt)
    }
    else {
        return (Get-Content .\ones.txt)
    }
}

function find-co2winner {
    Param($inputdata, $bitnumber)
    if (Test-Path zeros.txt) {Remove-Item .\zeros.txt}
    if (Test-Path ones.txt) {Remove-Item .\ones.txt}
    foreach ($line in $inputdata) {
        switch ($line[$bitnumber]) {
            0 {
                $line | Out-File .\zeros.txt -Append
                $zeros++
            }
            1 {
                $line | Out-File .\ones.txt -Append
                $ones++
            }
        }
    }

    if ($zeros -le $ones) {
        return (Get-Content .\zeros.txt)
    }
    else {
        return (Get-Content .\ones.txt)
    }
}

$numbits = 12

$data = Get-Content -Path '.\Data.txt'

if (Test-Path .\zeros.txt) {Remove-Item .\zeros.txt}
if (Test-Path .\ones.txt) {Remove-Item .\ones.txt}

for ($i = 0; $i -lt $numbits; $i++) {
    $data = find-oxywinner -inputdata $data -bitnumber $i
    if ($data.count -eq 1) {
        break;
    }
}

$oxywinner = [Convert]::ToInt32($data, 2)

$data = Get-Content -Path '.\Data.txt'

if (Test-Path .\zeros.txt) {Remove-Item .\zeros.txt}
if (Test-Path .\ones.txt) {Remove-Item .\ones.txt}

for ($i = 0; $i -lt $numbits; $i++) {
    $data = find-co2winner -inputdata $data -bitnumber $i
    if ($data.count -eq 1) {
        break;
    }
}

$co2winner = [Convert]::ToInt32($data, 2)

if (Test-Path .\zeros.txt) {Remove-Item .\zeros.txt}
if (Test-Path .\ones.txt) {Remove-Item .\ones.txt}

Write-Output ($oxywinner * $co2winner)
