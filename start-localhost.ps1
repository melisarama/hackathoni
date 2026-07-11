$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$port = 8080
$htmlPath = Join-Path $root 'index.html'
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:$port/")

try {
    $listener.Start()
    Write-Host "Local server is running at http://localhost:$port/"
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        try {
            $body = [System.IO.File]::ReadAllBytes($htmlPath)
            $context.Response.ContentType = 'text/html; charset=utf-8'
            $context.Response.ContentLength64 = $body.Length
            $context.Response.OutputStream.Write($body, 0, $body.Length)
        } finally {
            $context.Response.Close()
        }
    }
} finally {
    if ($listener.IsListening) { $listener.Stop() }
    $listener.Close()
}
