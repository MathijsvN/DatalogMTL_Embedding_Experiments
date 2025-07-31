$rdfox = "C:\Users\Administrator\Documents\RDFoX\RDFox-win64-x86_64-7.3c\RDFox-win64-x86_64-7.3c\RDFox.exe"

Write-Output "Warm-up RDFox_10"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10_evaluation.rdfox
        # & "C:\Users\Administrator\Documents\RDFoX\RDFox-win64-x86_64-7.3c\RDFox-win64-x86_64-7.3c\RDFox.exe" sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

Write-Output "Warmed up on RDFox_10"

Write-Output "Started RDFox_10"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\Documents\RDFoX\AdvancedWorkshop\iTemporal\Generated\execution_times\10\RDFox_10_n5.csv" -NoTypeInformation

Write-Output "Finshed RDFox_10"

Write-Output "Started RDFox_50"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\50_evaluation.rdfox
        # & "C:\Users\Administrator\Documents\RDFoX\RDFox-win64-x86_64-7.3c\RDFox-win64-x86_64-7.3c\RDFox.exe" sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\50_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\Documents\RDFoX\AdvancedWorkshop\iTemporal\Generated\execution_times\50\RDFox_50_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_50"

Write-Output "Started RDFox_10^2"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10^2_evaluation.rdfox
        # & "C:\Users\Administrator\Documents\RDFoX\RDFox-win64-x86_64-7.3c\RDFox-win64-x86_64-7.3c\RDFox.exe" sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10^2_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# # Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\Documents\RDFoX\AdvancedWorkshop\iTemporal\Generated\execution_times\10^2\RDFox_10^2_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_10^2"

Write-Output "Started RDFox_500"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\500_evaluation.rdfox
        # & "C:\Users\Administrator\Documents\RDFoX\RDFox-win64-x86_64-7.3c\RDFox-win64-x86_64-7.3c\RDFox.exe" sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\500_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\Documents\RDFoX\AdvancedWorkshop\iTemporal\Generated\execution_times\500\RDFox_500_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_500"

Write-Output "Started RDFox_10^3"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10^3_evaluation.rdfox
        # & "C:\Users\Administrator\Documents\RDFoX\RDFox-win64-x86_64-7.3c\RDFox-win64-x86_64-7.3c\RDFox.exe" sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10^3_evaluation.rdfox
        
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\Documents\RDFoX\AdvancedWorkshop\iTemporal\Generated\execution_times\10^3\RDFox_10^3_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_10^3"

Write-Output "Started RDFox_10^4"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10^4_evaluation.rdfox
        # & "C:\Users\Administrator\Documents\RDFoX\RDFox-win64-x86_64-7.3c\RDFox-win64-x86_64-7.3c\RDFox.exe" sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10^4_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\Documents\RDFoX\AdvancedWorkshop\iTemporal\Generated\execution_times\10^4\RDFox_10^4_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_10^4"

Write-Output "Started RDFox_10^5"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10^5_evaluation.rdfox
        # & "C:\Users\Administrator\Documents\RDFoX\RDFox-win64-x86_64-7.3c\RDFox-win64-x86_64-7.3c\RDFox.exe" sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10^5_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\Documents\RDFoX\AdvancedWorkshop\iTemporal\Generated\execution_times\10^5\RDFox_10^5_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_10^5"

Write-Output "Started RDFox_10^6"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        & $rdfox sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10^6_evaluation.rdfox
        # & "C:\Users\Administrator\Documents\RDFoX\RDFox-win64-x86_64-7.3c\RDFox-win64-x86_64-7.3c\RDFox.exe" sandbox . AdvancedWorkshop\iTemporal\Generated\rdfox_files\10^5_evaluation.rdfox
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\Documents\RDFoX\AdvancedWorkshop\iTemporal\Generated\execution_times\10^6\RDFox_10^6_n5.csv" -NoTypeInformation

Write-Output "Finished RDFox_10^6"