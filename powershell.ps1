##You may or may not even need this stuff!
##
##Function Get-Image{
##    begin{        
##         Add-Type -assembly System.Drawing
##    } 
##     process{
##          $fi=[System.IO.FileInfo]$_           
##          if( $fi.Exists){
##               $img = [System.Drawing.Image]::FromFile($_)
##               $img.Clone()
##               $img.Dispose()       
##          }else{
##               Write-Host "File not found: $_" -fore yellow       
##          }   
##     }    
##}
########YOU NEED TO CHANGE:
##$folder is where you have all of your images.
##$outputFile is the CSV output of the filename, height and width
########Other things you might want to change
##In the line starting dir - you can add more file extensions by just using the same format and plopping a comma between 'em
#####

param( $folder = "C:\test\", $outputFile = "C:\test\test.csv" )
 
dir "$folder*.jpg","$folder*.png" -Recurse | % {
   
    New-Object PSObject -Property  @{ 
        Fullname = $_.Fullname
        Height = $image.Height
        Width = $image.Width
    };
} | Export-Csv -notype $outputFile
