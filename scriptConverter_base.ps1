function moduleInstaller() {

    $userChoice = Read-Host -Prompt "Do you want to install ps2exe? (y/n)"

    if ($userChoice -eq "y") {
        Install-Module ps2exe
    }
    elseif ($userChoice -eq "n") {
        exit
    }
}
function converter() {
     $inputPath = Read-Host -Prompt "Enter Script Path"
     $outputPath = Read-Host -Prompt "Enter Output path"

    #convert script to exe
    ps2exe "$($inputPath)" "$($outputPath)"
}

#Check if module is already installed
if (Get-Module -ListAvailable -Name ps2exe) {
    Write-Host "ps2exe module status: installed"
    converter
} 
else {
    Write-Host "Module does not exist"
    moduleInstaller
}