$data = Get-Content -Path '.\Data.txt'
$horizontal = 0
$depth = 0

foreach ($x in $data) {
    switch -Wildcard ($x) {
        'forward*' {$horizontal += [int]$x.trimstart('forward ')}
        'down*' {$depth += [int]$x.trimstart('down ')}
        'up*' {$depth -= [int]$x.trimstart('up')}
    }
}

Write-Host ($horizontal * $depth)
