Describe "Test with non-existing-folder" {
    BeforeAll {
        $testPath = "TestDrive:\some\folder\"
        $fileName = "my_fancy_file.txt"
        $content = "Lorem ipsum dolor sit"
    }

    It "Should create folder and file with the content" {
        . "..\scripts\ScriptWithFileAccess.ps1" $testPath $content $fileName

        $pathToFile = -join ($testPath, $fileName)
        $pathToFile | Should -Exist
        $pathToFile | Should -FileContentMatchExactly $content
    }
}

Describe "Test with existing-folder" {
    BeforeAll {
        $testPath = "TestDrive:\"
        $fileName = "my_fancy_file.txt"
        $content = "Lorem ipsum dolor sit"
    }

    It "should create file with the content" {
        . "..\scripts\ScriptWithFileAccess.ps1" $testPath $content $fileName

        $pathToFile = -join ($testPath, $fileName)
        $pathToFile | Should -Exist
        $pathToFile | Should -FileContentMatchExactly $content
    }
}