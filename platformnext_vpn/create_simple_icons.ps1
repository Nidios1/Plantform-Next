# Create simple iOS app icons using PowerShell
$iconDir = "ios\Runner\Assets.xcassets\AppIcon.appiconset"

# Create a simple blue square icon for each size
$sizes = @(
    @{name="icon-20@2x.png"; size=40},
    @{name="icon-20@3x.png"; size=60},
    @{name="icon-29@2x.png"; size=58},
    @{name="icon-29@3x.png"; size=87},
    @{name="icon-40@2x.png"; size=80},
    @{name="icon-40@3x.png"; size=120},
    @{name="icon-60@2x.png"; size=120},
    @{name="icon-60@3x.png"; size=180},
    @{name="icon-20.png"; size=20},
    @{name="icon-29.png"; size=29},
    @{name="icon-40.png"; size=40},
    @{name="icon-76@2x.png"; size=152},
    @{name="icon-83.5@2x.png"; size=167},
    @{name="icon-1024.png"; size=1024}
)

foreach ($icon in $sizes) {
    $size = $icon.size
    $filename = $icon.name
    $path = Join-Path $iconDir $filename
    
    # Create a simple blue square with white "P" text
    Add-Type -AssemblyName System.Drawing
    $bitmap = New-Object System.Drawing.Bitmap($size, $size)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    
    # Fill with blue background
    $blueBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(33, 150, 243))
    $graphics.FillRectangle($blueBrush, 0, 0, $size, $size)
    
    # Add white "P" text
    $fontSize = [Math]::Max(12, $size / 4)
    $font = New-Object System.Drawing.Font("Arial", $fontSize, [System.Drawing.FontStyle]::Bold)
    $whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
    
    # Center the text
    $text = "P"
    $textSize = $graphics.MeasureString($text, $font)
    $x = ($size - $textSize.Width) / 2
    $y = ($size - $textSize.Height) / 2
    
    $graphics.DrawString($text, $font, $whiteBrush, $x, $y)
    
    # Save the image
    $bitmap.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    
    # Clean up
    $graphics.Dispose()
    $bitmap.Dispose()
    $blueBrush.Dispose()
    $whiteBrush.Dispose()
    $font.Dispose()
    
    Write-Host "Created $filename ($size x $size)"
}

Write-Host "All iOS app icons created successfully!"
Write-Host "Icons are simple blue squares with white 'P' text"
Write-Host "You can replace them with proper app icons later"
