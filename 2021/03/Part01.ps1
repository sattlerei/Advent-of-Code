$data = Get-Content -Path '.\Data.txt'
$zeros = 0
$ones = 0
$position = 0
$length = 12
[string]$gammastring = ''

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
    $gammastring += $mostcommon
    $zeros = 0
    $ones = 0
    $position++
}

$gamma = [Convert]::ToInt32($gammastring, 2)
$epsilonarray = $gammastring.ToString().ToCharArray()

[string]$epsilon = ''

foreach ($i in $epsilonarray) {
    switch ($i) {
        0 {
            $epsilon += '1'
        }
        1 {
            $epsilon += '0'
        }
    }
}

$epsilon = [Convert]::ToInt32($epsilon, 2)
$output = $gamma * $epsilon

Write-Output $output
