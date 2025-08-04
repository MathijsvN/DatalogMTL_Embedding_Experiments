Write-Output "Warm-up Nemo_10"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe ".\programs\program_10.rls" --overwrite-results
    }
}

Write-Output "Warmed up on Nemo_10"

Write-Output "Started Nemo_10"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe ".\programs\program_10.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path ".\results\nemo_10_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10"

Write-Output "Started Nemo_50"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe ".\programs\program_50.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path ".\results\nemo_50_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_50"

Write-Output "Started Nemo_10^2"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe ".\programs\program_10^2.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path ".\results\nemo_10^2_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10^2"

Write-Output "Started Nemo_500"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe ".\programs\program_500.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path ".\results\nemo_500_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_500"

Write-Output "Started Nemo_10^3"
$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe ".\programs\program_10^3.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path ".\results\nemo_10^3_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10^3"

Write-Output "Started Nemo_10^4"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe ".\programs\program_10^4.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path ".\results\nemo_10^4_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10^4"

Write-Output "Started Nemo_10^5"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe ".\programs\program_10^5.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path ".\results\nemo_10^5_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10^5"

