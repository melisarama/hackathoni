$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$port = 8080
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:$port/")

$lanAddresses = Get-NetIPAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue |
    Where-Object { $_.IPAddress -notlike '127.*' -and $_.IPAddress -notlike '169.254.*' -and $_.PrefixOrigin -ne 'WellKnown' } |
    Select-Object -ExpandProperty IPAddress

foreach ($address in $lanAddresses) {
    $listener.Prefixes.Add("http://${address}:$port/")
}

$listener.Start()
Write-Host "Mësim i Qartë is running at http://localhost:$port/"
foreach ($address in $lanAddresses) {
    Write-Host "Phone on the same Wi-Fi: http://${address}:$port/"
}
try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $file = Join-Path $root 'index.html'
        $bytes = [System.IO.File]::ReadAllBytes($file)
        $context.Response.ContentType = 'text/html; charset=utf-8'
        $context.Response.ContentLength64 = $bytes.Length
        $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
        $context.Response.Close()
    }
} finally {
    $listener.Stop()
}
