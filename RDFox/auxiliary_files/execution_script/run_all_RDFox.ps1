$rdfox = ".\RDFox.exe"

Write-Output "Warm-up RDFox_10"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . .\rdfox_files\10_evaluation.rdfox
    }
}

Write-Output "Warmed up on RDFox_10"

Write-Output "Started RDFox_10"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . .\rdfox_files\10_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path ".\results\RDFox_10_n5.csv" -NoTypeInformation

Write-Output "Finshed RDFox_10"

Write-Output "Started RDFox_50"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . .\rdfox_files\50_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path ".\results\RDFox_50_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_50"

Write-Output "Started RDFox_10^2"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . .\rdfox_files\10^2_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# # Export all results to CSV
$results | Export-Csv -Path ".\results\RDFox_10^2_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_10^2"

Write-Output "Started RDFox_500"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . .\rdfox_files\500_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path ".\results\RDFox_500_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_500"

Write-Output "Started RDFox_10^3"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . .\rdfox_files\10^3_evaluation.rdfox        
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path ".\results\RDFox_10^3_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_10^3"

Write-Output "Started RDFox_10^4"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . .\rdfox_files\10^4_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path ".\results\RDFox_10^4_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_10^4"

Write-Output "Started RDFox_10^5"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . .\rdfox_files\10^5_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path ".\results\RDFox_10^5_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_10^5"
