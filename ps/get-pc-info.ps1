#-----------------------------------------------------
# Get PC Info
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

function Get-PCInfo {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [string]$ComputerName
    )

    Write-Log "Getting PC info for $ComputerName" "Info"

    $PCInfo = @{
        ComputerName = $ComputerName
        OS           = (Get-WmiObject -Class Win32_OperatingSystem -ComputerName $ComputerName).Caption
        CPU          = (Get-WmiObject -Class Win32_Processor -ComputerName $ComputerName).Name
        RAM          = (Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName).TotalPhysicalMemory
    }

    Write-Log "PC info for $ComputerName: $($PCInfo | ConvertTo-Json -Depth 5)" "Debug"

    return $PCInfo
}

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
Get-PCInfo -ComputerName "localhost"
Exit-Script 0
