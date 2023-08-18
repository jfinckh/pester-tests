
param(
    [Parameter(Mandatory = $true)] $private:Name,
    [Parameter(Mandatory = $true)] $private:Alter,
    [Parameter(Mandatory = $false)] $private:Erstellungsdatum
)

$UserObject = New-Object psobject

$UserObject | Add-Member -NotePropertyName "Name" -NotePropertyValue $Name
$UserObject | Add-Member -NotePropertyName "Alter" -NotePropertyValue $Alter
if($null -eq $Erstellungsdatum)
{
    $UserObject | Add-Member -NotePropertyName "Erstellungsdatum" -NotePropertyValue (get-date)
} else
{
    $UserObject | Add-Member -NotePropertyName "Erstellungsdatum" -NotePropertyValue $Erstellungsdatum
}

return $UserObject