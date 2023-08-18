# Demo for PowerShell Testing with Pester

## Install powershell for mac 

> brew install --cask powershell

Test if powershell is installed:
> pwsh
 
## Install pester

> pwsh
> 
> Install-Module -Name Pester -Force
 
 
## Run Pester Tests

>  Invoke-Pester ./A-Test.ps1

Or just run the file:

> ./A-Test.ps1
 

## Docs
### Assertions
#### Be
Not case sensitive, checks if two objects are the same
> $true | Should -Be $true
> 
> $true | Should -Not -Be $false

#### Be exactly 
Case sensitive, checks if to objects are the same
> $actual | Should -BeExactly "Actual value" # Test will pass

#### Be false
Asserts that value is false
> $false | Should -BeFalse

#### BeGreaterOrEqual
> 2 | Should -BeGreaterOrEqual 0

#### BeGreaterThan
> (Get-Date).AddMinutes(5) | Should -BeGreaterThan (Get-Date)

#### BeIn
> 27 | Should -BeIn (1..100)

#### BeLessOrEqual
> 1 | Should -BeLessOrEqual 10

#### BeLessThan
> $Error.Count | Should -BeLessThan 1

#### And some more
Check: https://pester.dev/docs/assertions/

### Assertions on Files
#### Check if file exists
> $pathToFile | Should -Exist

### Check contents of files
> $pathToFile | Should -FileContentMatchExactly $content

### Custom Assertions 
```
function BeAwesome($ActualValue, [switch] $Negate) {
[bool] $succeeded = $ActualValue -eq 'Awesome'
if ($Negate) { $succeeded = -not $succeeded }

    if (-not $succeeded) {
        if ($Negate) {
            $failureMessage = "{$ActualValue} is Awesome"
        }
        else {
            $failureMessage = "{$ActualValue} is not Awesome"
        }
    }

    return New-Object psobject -Property @{
        Succeeded      = $succeeded
        FailureMessage = $failureMessage
    }
}

Add-ShouldOperator -Name BeAwesome `
-Test $function:BeAwesome `
-Alias 'BA'

PS C:\> "bad" | Should -BeAwesome
```