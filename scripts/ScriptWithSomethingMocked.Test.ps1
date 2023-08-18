BeforeAll {
    . $PSScriptRoot/Functions.ps1
    . $PSScriptRoot/ScriptWithSomethingMocked.ps1

}
Describe "Run without mock" {
    It "should return default good-mood" {
        $Name = "Eva"
        $result = GetMoodOfPerson $Name

        $result | Should -BeExactly "Current mood of Eva is: Good"
    }
}

Describe "Run with mock" {
    BeforeAll {
        Mock Get-Current-Mood { return "Bad" }
    }

    It "should return default good-mood" {
        $Name = "Eva"
        $result = GetMoodOfPerson $Name

        $result | Should -BeExactly "Current mood of Eva is: Bad"
    }
}