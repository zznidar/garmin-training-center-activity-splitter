param (
    [Parameter(Mandatory=$true)][string]$inputfile
)

New-Alias wh Write-Host

$pot = Split-Path -Path $inputfile
$ime = Split-Path $inputfile -Leaf


wh "••••••••••••••••••••••••••"
wh "•••• Garmin corrector 0.0.0 ••••"
wh "••••••••••••••••••••••••••"
wh

wh "Path: $pot\"
wh "Filename: $ime"
wh
wh "A subfolder /export MUST be manually created where the input file is located!!!"
wh "Make sure a template.tcx file exists (a .tcx file without Activities)!"





$xml = [xml](Get-Content ($inputfile))
$actarr = $xml.TrainingCenterDatabase.Activities.Activity

$counter = 0

foreach($act in $actarr) {
    $template = [xml](Get-Content ($pot + '\template.tcx'))
    $drzalo = $template.TrainingCenterDatabase

    $templateel = $template.CreateElement('Activities', $template.DocumentElement.NamespaceURI)
    $templateel.AppendChild($templateel.OwnerDocument.ImportNode($act, $true))

    $template.TrainingCenterDatabase.AppendChild($templateel)

    $template.save($pot + '\export\' + $ime + "_ZZ_$counter.tcx")

    $counter++
}


wh Done!
#Read-Host