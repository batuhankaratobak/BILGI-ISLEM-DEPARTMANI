# INC-003 - DNS Çözümleme Hatası

## Senaryo

Client domain controller adını çözemiyor veya domain kaynaklarına erişemiyor.

## Kontrol

- Client DNS server olarak `10.10.10.10` kullanıyor mu?
- `bkworks.local` zone'u var mı?
- `dc01.bkworks.local` çözümleniyor mu?

## Komutlar

```powershell
ipconfig /all
Resolve-DnsName dc01.bkworks.local
nslookup dc01.bkworks.local
```
