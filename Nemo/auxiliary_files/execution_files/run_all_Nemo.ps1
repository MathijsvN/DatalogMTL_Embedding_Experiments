Write-Output "Warm-up Nemo_10"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\generated_programs\program_10.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

Write-Output "Warmed up on Nemo_10"

Write-Output "Started Nemo_10"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\generated_programs\program_10.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\execution_times\10\nemo_10_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10"

Write-Output "Started Nemo_50"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\generated_programs\program_50.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\execution_times\50\nemo_50_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_50"

Write-Output "Started Nemo_10^2"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\generated_programs\program_100.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\execution_times\100\nemo_100_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10^2"

Write-Output "Started Nemo_500"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\generated_programs\program_500.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\execution_times\500\nemo_500_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_500"

Write-Output "Started Nemo_10^3"
$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\generated_programs\program_1000.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\execution_times\1000\nemo_1000_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10^3"

Write-Output "Started Nemo_10^4"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\generated_programs\program_10000.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\execution_times\10000\nemo_10000_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10^4"

Write-Output "Started Nemo_10^5"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\generated_programs\program_100000.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\execution_times\100000\nemo_100000_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10^5"

Write-Output "Started Nemo_10^6"

$results = @()

for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        .\nmo.exe "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\generated_programs\program_1000000.rls" --overwrite-results
    }
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\Nemo\nemo_v0.7.1_x86_64-pc-windows-msvc\nemo_v0.7.1_x86_64-pc-windows-msvc\examples\examples\Translation_examples\iTemporal\execution_times\1000000\nemo_1000000_n5.csv" -NoTypeInformation

Write-Output "Executed and saved Nemo_10^6"

