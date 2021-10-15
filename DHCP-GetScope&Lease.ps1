# Get site scrope

Get-DhcpServerv4Scope -ComputerName uk-hub3-m1011

Get-DhcpServerv4Scope -ComputerName uk-hub3-m1011 | Where-Object {$_.Name -LIKE "*UK-COR4*"}

# Get leases by hostname

Get-DhcpServerv4Lease -ComputerName uk-hub3-m1011 -ScopeID 10.177.148.0 | Where-Object {$_.Hostname -eq "S-UK-COR4-HS2.group.wan"}

# Get leases by IP

Get-DhcpServerv4Lease -ComputerName uk-hub3-m1011 -ScopeID 10.177.148.0 | Where-Object {$_.IPAddress -eq "10.177.148.123"}