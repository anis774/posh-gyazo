function Send-Gyazo {
    [CmdletBinding()]
    param (
        [parameter(Position=0, ValueFromPipeline=$true)]
        $Image = $null
    )

    Process {
        $path = $null
        $tmpFile = $null
        if ($Image -is [System.IO.FileSystemInfo]) {
            $path = ([System.IO.FileSystemInfo]$Image).FullName
        } elseif ($Image -is [System.String]) {
            $path = Resolve-Path $Image
        } else {
            $tmpFile = New-TemporaryFile
            $path = $tmpFile.FullName
            if ($Image -isnot [System.Drawing.Image]) {
                $Image = (Get-Clipboard -Format Image)
            }
            ([System.Drawing.Image]$Image).Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
        }

        Start-Process $gyazo_path -ArgumentList $path -Wait

        if ($tmpFile -ne $null) {
            $tmpFile.Delete()
        }

        return Get-Clipboard -Format Text
    }
}