Write-Output "Warm up MeTeoR_10^1"

# Create an empty array to store timing results
$results = @()

# Run the command 5 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python ".\run_iTemporal.py" --input_data ".\datasets\10\dataset.txt" --input_program ".\program\program_10^1.txt.txt"
    }
}

# Closing message
Write-Output "Warmed up on MeTeoR_10^1"

Write-Output "Started MeTeoR_10^1"

# Create an empty array to store timing results
$results = @()

# Run the command 5 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python ".\run_iTemporal.py" --input_data ".\datasets\10^1\dataset.txt" --input_program ".\program\program_10.txt.txt"
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
$results | Export-Csv -Path ".\execution_times\MeTeoR_10^1_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^1"

# Opening message
Write-Output "Started MeTeoR_50"

# Create an empty array to store timing results
$results = @()

# Run the command 5 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python ".\run_iTemporal.py" --input_data ".\datasets\50\dataset.txt" --input_program ".\program\program_50.txt.txt"
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
$results | Export-Csv -Path ".\execution_times\MeTeoR_50_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^2"

# Opening message
Write-Output "Started MeTeoR_10^2"

# Create an empty array to store timing results
$results = @()

# Run the command 5 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python ".\run_iTemporal.py" --input_data ".\datasets\10^2\dataset.txt" --input_program ".\program\program_10^2.txt.txt"
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
$results | Export-Csv -Path ".\execution_times\MeTeoR_10^2_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^2"

# Opening message
Write-Output "Started MeTeoR_500"

# Create an empty array to store timing results
$results = @()

# Run the command 5 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python ".\run_iTemporal.py" --input_data ".\datasets\500\dataset.txt" --input_program ".\program\program_500.txt.txt"
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
$results | Export-Csv -Path ".\execution_times\MeTeoR_500_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_500"

# Opening message
Write-Output "Started MeTeoR_10^3"

# Create an empty array to store timing results
$results = @()

# Run the command 5 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python ".\run_iTemporal.py" --input_data ".\datasets\10^3\dataset.txt" --input_program ".\program\program_10^3.txt.txt"
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
$results | Export-Csv -Path ".\execution_times\MeTeoR_10^3_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^3"

# Opening message
Write-Output "Started MeTeoR_10^4"

# Create an empty array to store timing results
$results = @()

# Run the command 5 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python ".\run_iTemporal.py" --input_data ".\datasets\10^4\dataset.txt" --input_program ".\program\program_10^4.txt.txt"
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
# $results | Export-Csv -Path ".\execution_times\MeTeoR_10^4_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^4"

# Opening message
Write-Output "Started MeTeoR_10^5"

# Create an empty array to store timing results
$results = @()

# Run the command 5 times and measure each run
for ($i = 1; $i -le 5; $i++) {
    Write-Output $i
    $time = Measure-Command {
        python ".\run_iTemporal.py" --input_data ".\datasets\10^5\dataset.txt" --input_program ".\program\program_10^5.txt.txt"
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
$results | Export-Csv -Path ".\execution_times\MeTeoR_10^5_n5.csv" -NoTypeInformation

# Closing message
Write-Output "Executed and saved MeTeoR_10^5"