$data = Get-Content -Path '.\Data.txt'
$horizontal = 0
$depth = 0
$aim = 0

foreach ($x in $data) {
    switch -Wildcard ($x) {
        'forward*' {
            $horizontal += [int]$x.trimstart('forward ')
            $depth += ($aim * [int]$x.trimstart('forward '))
        }
        'down*' {$aim += [int]$x.trimstart('down ')}
        'up*' {$aim -= [int]$x.trimstart('up')}
    }
}

Write-Host ($horizontal * $depth)
