# PowerGlue

## Usage
```powershell
# Install Module
Install-Module PowerGlue

# Connect to IT Glue
$ApiKey = 'ITG.MYSECRETAPIKEY'
Connect-ITGServer -ApiKey $ApiKey

# Retrieve an Organization by name
$Organization = Get-ITGOrganization -Name 'Example.com'

# Retrieve Configuration Status IDs and select ID for 'Provisioning' status
$ConfigurationStatus = Get-ITGConfigurationStatus
$StatusId = ($ConfigurationStatus | Where-Object { $_.Name -eq 'Provisioning' }).Id

# Retreive Configuratinos for Example.com with a status of 'Provisioning
$Configuration = $Organization | Get-ITGConfiguration -StatusId $StatusId
```