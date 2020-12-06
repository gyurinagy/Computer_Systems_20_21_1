Param(
        [int] $gradeNumber = 5,
        [string]$outputName = "in.txt"
    )

function Generate-Input {
    
    $inputName="names.txt"
    if (Test-Path $outputName ) {Remove-Item $outputName}
    Get-Content $inputName | ForEach-Object {
        $line = $_
        for($i = 0;$i -lt $gradeNumber;$i++){
            $rand = Get-Random -Minimum 1 -Maximum 6
            $line +=";"+[string]$rand
        }
        
        $line | Out-File -Append $outputName
        
    }
}


Generate-Input



