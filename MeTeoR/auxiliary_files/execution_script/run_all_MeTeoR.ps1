Write-Output "Started MeTeoR_10^1"

# Create an empty array to store timing results
$results = @()

# Run the command 100 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\run_iTemporal.MagicSets.py" --input_data "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\data\10^1\dataset.txt" --input_program "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\program\iTemporal_program.txt"
    }

    # Store each run's result
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\execution_times\MeTeoR_10^1_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^1"

# Opening message
Write-Output "Started MeTeoR_10^2"

# Create an empty array to store timing results
$results = @()

# Run the command 100 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\run_iTemporal.MagicSets.py" --input_data "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\data\10^2\dataset.txt" --input_program "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\program\iTemporal_program.txt"
    }

    # Store each run's result
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\execution_times\MeTeoR_10^2_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^2"

# Opening message
Write-Output "Started MeTeoR_10^3"

# Create an empty array to store timing results
$results = @()

# Run the command 100 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\run_iTemporal.MagicSets.py" --input_data "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\data\10^3\dataset.txt" --input_program "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\program\iTemporal_program.txt"
    }

    # Store each run's result
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\execution_times\MeTeoR_10^3_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^3"

# Opening message
Write-Output "Started MeTeoR_10^4"

# Create an empty array to store timing results
$results = @()

# Run the command 100 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\run_iTemporal.MagicSets.py" --input_data "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\data\10^4\dataset.txt" --input_program "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\program\iTemporal_program.txt"
    }

    # Store each run's result
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
# $results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\execution_times\MeTeoR_10^4_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^4"

# Opening message
Write-Output "Started MeTeoR_10^5"

# Create an empty array to store timing results
$results = @()

# Run the command 100 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\run_iTemporal.MagicSets.py" --input_data "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\data\10^5\dataset.txt" --input_program "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\program\iTemporal_program.txt"
    }

    # Store each run's result
    $results += [PSCustomObject]@{
        Run               = $i
        TotalSeconds      = $time.TotalSeconds
        TotalMilliseconds = $time.TotalMilliseconds
        FormattedTime     = $time.ToString()
    }
}

# Export all results to CSV
$results | Export-Csv -Path "C:\Users\Administrator\OneDrive - UGent\'22-'23\Research\MeTeoR\MeTeoR\meteor_reasoner\iTemporal\iTemporal_MagicSets\execution_times\MeTeoR_10^5_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^5"