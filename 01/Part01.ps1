$data = Get-Content -Path '.\Data.txt'
$previous = 0
$larger = 0

foreach ($current in $data) {
    if ($previous -ne 0) {
        if ([int]$current -gt $previous) {
            $larger++
        }
    }
    $previous = $current
}

Write-Output $larger
