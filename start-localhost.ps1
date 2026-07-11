$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$port = 8080
$htmlPath = Join-Path $root 'index.html'
$listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Any, $port)

try {
    $listener.Start()
    Write-Host "Local server is running at http://localhost:$port/"
    while ($true) {
        $client = $listener.AcceptTcpClient()
        try {
            $stream = $client.GetStream()
            $buffer = New-Object byte[] 4096
            $stream.Read($buffer, 0, $buffer.Length) | Out-Null
            $body = [System.IO.File]::ReadAllBytes($htmlPath)
            $header = "HTTP/1.1 200 OK`r`nContent-Type: text/html; charset=utf-8`r`nContent-Length: $($body.Length)`r`nConnection: close`r`n`r`n"
            $headerBytes = [System.Text.Encoding]::ASCII.GetBytes($header)
            $stream.Write($headerBytes, 0, $headerBytes.Length)
            $stream.Write($body, 0, $body.Length)
            $stream.Flush()
        } finally {
            $client.Close()
        }
    }
} finally {
    $listener.Stop()
}
