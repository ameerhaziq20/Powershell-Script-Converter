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
    # $inputPath = Read-Host -Prompt "Enter Script Path"
    # $outputPath = Read-Host -Prompt "Enter Output path"

    # ps2exe "$($inputPath)" "$($outputPath)"

    #Browsing file

    #Selecting the script 
    Add-Type -AssemblyName System.Windows.Forms
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
    $FileBrowser.filter = "Powershell Script (*.ps1)| *.ps1"
    $FileBrowser.Title = "Select Script File"
    [void]$FileBrowser.ShowDialog()
    $inputPath = $FileBrowser.FileName    

    #selecting output directory
    $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $FileBrowser.Title = "Select Path For Output"
    [void]$FolderBrowser.ShowDialog()
    $outputPath = $FolderBrowser.SelectedPath

    #process string 
    $outputNoExt = (Get-Item $inputPath).BaseName

    #convert file
    ps2exe "$($inputPath)" "$($outputPath)/$($outputNoExt).exe"
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