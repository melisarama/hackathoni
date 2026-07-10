$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add('http://localhost:8080/')
$listener.Start()
Write-Host 'Mësim i Qartë is running at http://localhost:8080/'
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
