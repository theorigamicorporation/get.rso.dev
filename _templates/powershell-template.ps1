<#
    .SYNOPSIS
    SCRIPT_NAME

    .DESCRIPTION
    TODO: Describe what this script does.

    @description TODO: Short description of the tool
    @category TODO: Category Name
    @tags TODO: comma, separated, tags
#>

#-----------------------------------------------------
# Configuration
#-----------------------------------------------------
$ScriptVersion = "0.1"
$ScriptName = "SCRIPT_NAME"

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
        'Info'    { Write-Host "[INFO][$ScriptName $ScriptVersion][$Timestamp]: $Message" -ForegroundColor White }
        'Warning' { Write-Host "[WARN][$ScriptName $ScriptVersion][$Timestamp]: $Message" -ForegroundColor Yellow }
        'Error'   { Write-Error "[ERR][$ScriptName $ScriptVersion][$Timestamp]: $Message" }
        'Debug'   { Write-Verbose "[DEBUG][$ScriptName $ScriptVersion][$Timestamp]: $Message" }
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

# TODO: Add your functions here.

#-----------------------------------------------------
# Error Handling
#-----------------------------------------------------
$ErrorActionPreference = "Stop"

Trap {
    $ErrorRecord = $_
    Write-Log "Error: $($ErrorRecord.Exception.Message)" "Error"
    Exit-Script 1
}

#-----------------------------------------------------
# Main
#-----------------------------------------------------
Write-Log "Starting script" "Info"

# TODO: Add your script logic here.

Exit-Script 0
