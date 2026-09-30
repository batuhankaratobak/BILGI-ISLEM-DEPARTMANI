# Active Directory

Domain: `bkworks.local`. Base DN: `OU=BKWORKS,DC=bkworks,DC=local`.

Active Directory lab'ın kimlik katmanıdır. Kullanıcıları, bilgisayarları, grupları ve yetkileri merkezi olarak tutar.

## Menü

DC01 üzerinde:

```text
Server Manager > Tools > Active Directory Users and Computers
```

Önemli alanlar:

- Domain root: `bkworks.local`
- `OU=BKWORKS`: lab ana konteyneri
- `OU=Users`: kullanıcı hesapları
- Departman OU'ları: `IT`, `HR`, `Finance`, `Sales`
- `OU=Groups`: erişim grupları
- `OU=Computers`: `CLIENT01` gibi domain bilgisayarları
- Delegate Control: Domain Admin yapmadan sınırlı yetki verir

## Yapı

Temel gruplar:

- `BK-Employees`
- `BK-IT-Admins`
- `BK-IT`
- `BK-HR`
- `BK-Finance`
- `BK-Sales`
- `BK-Helpdesk`

Yetkiler kullanıcılara tek tek değil gruplara verilir. Kullanıcı departman değiştirirse grup üyeliği değiştirilir.

## Doğrulama

```powershell
Get-ADDomain
Get-ADUser -Filter * -SearchBase "OU=Users,OU=BKWORKS,DC=bkworks,DC=local" | Select-Object Name,DistinguishedName
Get-ADGroupMember BK-Helpdesk
```
