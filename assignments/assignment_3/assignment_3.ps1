function Get-Grades{
    Param(
        [string]$inputFilename = "in.txt"
    )

    $grades = 0,0,0,0,0
    Get-Content $inputFilename | ForEach-Object {
        $_.replace(";"," ").Split(" ") | ForEach-Object {
            if($_ -match '[0-9]'){
                $grades[([int]$_)-1]++
            }
        }
    }
    $i = 1
    $grades | % {
        Write-Host "Grade($i) quantity: "$_
        $i++
    }
    
}

# Version #2
#     $grades = 0,0,0,0,0
# Get-Content $inputFilename | ForEach-Object {
    #     $Name, [int]$a, [int]$b, [int]$c, [int]$d,[int]$e = $_.Split(";");
    
    #     $grades[$a-1]++
    #     $grades[$b-1]++
    #     $grades[$c-1]++
    #     $grades[$d-1]++
    #     $grades[$e-1]++
    # }

# Version #3
# $grades = 0,0,0,0,0
# $data = Import-Csv -Header "nev","a","b","c","d","e"-Delimiter ";" -Path ".\in.txt"
# $data | %{
#     grades[([int]$_.a)-1]++
#     grades[([int]$_.b)-1]++
#     grades[([int]$_.c)-1]++
#     grades[([int]$_.d)-1]++
#     grades[([int]$_.e)-1]++
#     
# }

if($args.Count -eq 1){
    Get-Grades($args)
}else{
    Get-Grades
}
