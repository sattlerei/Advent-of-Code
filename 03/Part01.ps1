$data = Get-Content -Path '.\Data.txt'
$zeros = 0
$ones = 0
$position = 0
$length = 12
while ($position -lt $length) {
    foreach ($line in $data) {
    
        switch ($line[$position]) {
            0 {
                $zeros++
            }
            1 {
                $ones++
            }
        }
        
    }
    if ($zeros -gt $ones) {
        $mostcommon = 0
    }
    else {
        $mostcommon = 1
    }
    [string]$outputstring += $mostcommon
    $zeros = 0
    $ones = 0
    $position++
}
$epsilonarray = $outputstring.ToString().ToCharArray()
$gamma = [Convert]::ToInt32($outputstring, 2)

foreach ($i in $epsilonarray) {
    if ($i -eq '1') {
        [string]$epsilon += '0'
    }
    else {
        [string]$epsilon += '1'
    }
}
$epsilon = [Convert]::ToInt32($epsilon, 2)

$output = $gamma * $epsilon

Write-Output $gamma
Write-Output $epsilon
Write-Output $output
