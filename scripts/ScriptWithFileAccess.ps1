param
(
    [Parameter(Mandatory = $true)][string] $private:somePath,
    [Parameter(Mandatory = $true)][string] $private:fileContent,
    [Parameter(Mandatory = $true)][string] $private:fileName
)

function Create-DirectoryIfNotExists($path) {
    if (!(Test-Path $path)) {
        New-Item -Path $path -ItemType Directory
    }
}

Create-DirectoryIfNotExists $somePath
New-Item -Path $somePath -Name $fileName -ItemType "file" -Value $fileContent