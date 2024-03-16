#-----------------------------------------------------
# PowerShell Boilerplate
#
# Description: Provides a basic structure and functions
#              for robust PowerShell scripts 
#
# Version: 1.0
#-----------------------------------------------------

#-----------------------------------------------------
# Configuration
#-----------------------------------------------------
# NOTE: Place global configuration variables here


#-----------------------------------------------------
# Functions
#-----------------------------------------------------
function Write-Log {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string]$Message,

        [Parameter(Mandatory)]
        [ValidateSet('Info', 'Warning', 'Error', 'Debug')]
        [string]$Level = 'Info'
    )

    $Timestamp = Get-Date -Format "dd.MM.yyyy-HH:mm:ss-zzz"

    switch ($Level) {
        'Info'    { Write-Host "[INFO][$Timestamp]: $Message" -ForegroundColor White }
        'Warning' { Write-Host "[WARN][$Timestamp]: $Message" -ForegroundColor Yellow }
        'Error'   { Write-Error "[ERROR][$Timestamp]: $Message"  }
        'Debug'   { if ($PSBoundParameters.ContainsKey('Verbose')) { Write-Verbose "[DEBUG][$Timestamp]: $Message" }  }
    } 
}

function Exit-Script {
    [CmdletBinding()]
    Param(
        [int]$ExitCode = 0
    )

    Write-Log "Performing clean exit" "Info"
    exit $ExitCode
}

# NOTE: Place additional custom functions here

#-----------------------------------------------------
# Error Handling 
#-----------------------------------------------------
Trap {
    $ErrorRecord = $_
    Write-Log "Error in $($ErrorRecord.InvocationInfo.ScriptName):$($ErrorRecord.InvocationInfo.MyCommand.Name)[$($ErrorRecord.InvocationInfo.Line)] Failed with status $($ErrorRecord.Exception.GetType().Name): $($ErrorRecord.Exception.Message)" "Error" 
    Exit-Script 1
}

#-----------------------------------------------------
# Main 
#-----------------------------------------------------
Write-Log "Starting script" "Info"

# NOTE: Place your script logic here.

Exit-Script 0
