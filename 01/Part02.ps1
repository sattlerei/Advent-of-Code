$data = Get-Content -Path '.\Data.txt'
$larger = 0
$i = 0
$sum1 = [int]$data[$i] + [int]$data[$i + 1] + [int]$data[$i + 2]

while ($i -lt ($data.length - 2)) {
    if ($i -ne 0) {
        $sum2 = [int]$data[$i] + [int]$data[$i + 1] + [int]$data[$i + 2]
        if ($sum2 -gt $sum1) {
            $larger++
        }
        $sum1 = [int]$data[$i] + [int]$data[$i + 1] + [int]$data[$i + 2]
    }
    $i++
}

Write-Output $larger
