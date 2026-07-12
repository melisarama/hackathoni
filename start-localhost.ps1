$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$port = 8080
$htmlPath = Join-Path $root 'index.html'
$piaPath = Join-Path $root 'plani_individual_i_arsimit.pdf'
$listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Any, $port)

try {
    $listener.Start()
    Write-Host "Local server is running at http://localhost:$port/"
    while ($true) {
        $client = $listener.AcceptTcpClient()
        try {
            $stream = $client.GetStream()
            $buffer = New-Object byte[] 4096
            $read = $stream.Read($buffer, 0, $buffer.Length)
            $request = [System.Text.Encoding]::ASCII.GetString($buffer, 0, $read)
            $requestPath = ($request -split "`r?`n")[0].Split(' ')[1]
            if ($requestPath -like '/plani_individual_i_arsimit.pdf*' -and (Test-Path -LiteralPath $piaPath)) {
                $body = [System.IO.File]::ReadAllBytes($piaPath)
                $contentType = 'application/pdf'
            } else {
                $body = [System.IO.File]::ReadAllBytes($htmlPath)
                $contentType = 'text/html; charset=utf-8'
            }
            $header = "HTTP/1.1 200 OK`r`nContent-Type: $contentType`r`nContent-Length: $($body.Length)`r`nConnection: close`r`n`r`n"
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
