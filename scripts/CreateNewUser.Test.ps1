Describe "Without createdDate" {

    BeforeAll {
        $resultUser = . "..\scripts\CreateNewUser.ps1" "Tom" "23"
    }

    context "Object creation" {
        it "should create an object" {
            $resultUser | should -BeOfType psobject
        }
    }

    context "Name" {
        it "should not be empty" {
            $resultUser.Name | should -Not -BeNullOrEmpty
        }

        it "should be Tom" {
            $resultUser.Name | should -Be "Tom"
        }
    }

    context "Age" {
        it "should not be empty" {
            $resultUser.Alter | should -Not -BeNullOrEmpty
        }

        it "should be 23" {
            $resultUser.Alter | should -Be "23"
        }
    }
}

Describe "With createdAt" {

    context "createdAt" {
        it "should be the same date" {
            $date = (Get-Date)
            $resultUser = . "..\scripts\CreateNewUser.ps1" "Tom" "23" $date

            $resultUser.Erstellungsdatum.year | Should -BeExactly $date.year
            $resultUser.Erstellungsdatum.month | Should -BeExactly $date.month
            $resultUser.Erstellungsdatum.day | Should -BeExactly $date.day
        }
    }
}