$moduleRoot = Split-Path -Path $MyInvocation.MyCommand.Path
. "$moduleRoot\Functions.ps1"

function GetMoodOfPerson(
        [Parameter(Mandatory = $true)] $private:Name
)
{
    $currentMood = Get-Current-Mood
    Write-Output ("Current mood of " + $Name + " is: " + $currentMood)
}