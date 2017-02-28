configuration IISInstall
{
    $fileName = "wwwroot.zip"
	$fileDir = "c:\tahol"
	$File = $fileDir + "\" + $fileName
	$siteSrc = "https://tmlabse.blob.core.windows.net/tmlabfiles/wwwroot.zip"
	$siteDest = "C:\inetpub"

    node "localhost"
    { 
        WindowsFeature IIS 
        { 
            Ensure = "Present" 
            Name = "Web-Server"                       
			IncludeAllSubFeature = $true
        }

        # Run script to download and extract social-imaginator files
        Script GetWebFiles
		{
        	Ensure			= "Present"
        	SetScript 		= 
        	{ 
				# Create temporary directory
				md $fileDir

				# Download social-imgaginator files
				$webclient = New-Object System.Net.WebClient
				$uri = New-Object System.Uri($siteSrc)

				$webclient.DownloadFile($uri, $File)

				# Extract social-imaginator files to wwwroot
				$shell = new-object -com shell.application
				$zip = $shell.NameSpace($File)
				foreach($item in $zip.items())
				{
					$shell.Namespace($siteDest).copyhere($item)
				}
        	}
        	TestScript 		= { Test-Path $fileDir }
        	GetScript		= { return @{ 'Result' = "Done" }}
        	DependsOn		= [WindowsFeature]IIS        
		}
    }
}