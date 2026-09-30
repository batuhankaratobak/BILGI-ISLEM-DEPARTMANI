#Requires -RunAsAdministrator
Import-Module ActiveDirectory
$base = 'OU=BKWORKS,DC=bkworks,DC=local'
$departments = 'IT','Management','Operations','Sales','Accounting','Design'
if (-not (Get-ADOrganizationalUnit -LDAPFilter '(ou=BKWORKS)' -SearchBase 'DC=bkworks,DC=local' -SearchScope OneLevel -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit BKWORKS -Path 'DC=bkworks,DC=local' -ProtectedFromAccidentalDeletion $true
}
foreach ($ou in $departments + @('Users','Computers','Servers')) {
    if (-not (Get-ADOrganizationalUnit -LDAPFilter "(ou=$ou)" -SearchBase $base -SearchScope OneLevel -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit $ou -Path $base -ProtectedFromAccidentalDeletion $true
    }
}
foreach ($group in @('GG_IT','GG_MANAGEMENT','GG_OPERATIONS','GG_SALES','GG_ACCOUNTING','GG_DESIGN','GG_VPN_USERS','GG_PRINTER_USERS','GG_SHARED_DRIVE_USERS')) {
    if (-not (Get-ADGroup -Identity $group -ErrorAction SilentlyContinue)) {
        New-ADGroup $group -SamAccountName $group -GroupScope Global -GroupCategory Security -Path "OU=Users,$base"
    }
}

