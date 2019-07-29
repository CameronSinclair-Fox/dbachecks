#
# Module manifest for module 'dbachecks'
#
# Generated by: SQL Collaborative
#
# Generated on: 08/23/2017
#
@{

    # Script module or binary module file associated with this manifest.
    RootModule             = 'dbachecks.psm1'

    # Version number of this module.
    ModuleVersion          = '1.2.8'

    # ID used to uniquely identify this module
    GUID                   = '578c5d98-50c8-43a8-bdbb-d7159028d7ac'

    # Author of this module
    Author                 = 'SQL Community Collaborative'

    # Company or vendor of this module
    CompanyName            = 'SQL Community Collaborative'

    # Copyright statement for this module
    Copyright              = '(c) 2018. All rights reserved.'

    # Description of the functionality provided by this module
    Description            = 'SQL Server Infrastructure validation Tests to ensure that your SQL Server estate is and continues to be compliant with your requirements'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion      = '5.0'

    # Name of the Windows PowerShell host required by this module
    PowerShellHostName     = ''

    # Minimum version of the Windows PowerShell host required by this module
    PowerShellHostVersion  = ''

    # Minimum version of the .NET Framework required by this module
    DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module
    CLRVersion             = ''

    # Processor architecture (None, X86, Amd64, IA64) required by this module
    ProcessorArchitecture  = ''

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules        = @(
        @{ ModuleName = 'Pester'; ModuleVersion = '4.7.1' },
        @{ ModuleName = 'dbatools'; ModuleVersion = '1.0.23' }
        @{ ModuleName = 'PSFramework'; ModuleVersion = '1.0.0' }
    )

    # Assemblies that must be loaded prior to importing this module
    RequiredAssemblies     = @()

    # Script files () that are run in the caller's environment prior to importing this module
    ScriptsToProcess       = @()

    # Type files (xml) to be loaded when importing this module
    TypesToProcess         = @()

    # Format files (xml) to be loaded when importing this module
    # "xml\dbachecks.Format.ps1xml"
    # worry about this later
    FormatsToProcess       = @("xml\dbachecks.Format.ps1xml")

    # Modules to import as nested modules of the module specified in ModuleToProcess
    NestedModules          = @()

    # Functions to export from this module
    # This is the stuff in \enduser-functions
    FunctionsToExport      = @(
        'Get-DbcConfig',
        'Get-DbcConfigValue',
        'Get-DbcReleaseNote',
        'Set-DbcConfig',
        'Reset-DbcConfig',
        'Invoke-DbcCheck',
        'Invoke-DbcConfigFile',
        'Import-DbcConfig',
        'Export-DbcConfig',
        'Start-DbcPowerBi',
        'Update-DbcPowerBiDataSource',
        'Get-DbcTagCollection',
        'Get-DbcCheck',
        # 'Send-DbcMailMessage',
        'Clear-DbcPowerBiDataSource',
        'Save-DbcRequiredModules',
        'Update-DbcRequiredModules'
    )

    # Cmdlets to export from this module
    CmdletsToExport        = '*'

    # Variables to export from this module
    VariablesToExport      = '*'

    # Aliases to export from this module
    # Aliases are stored in dbachecks.psm1
    AliasesToExport        = 'Update-Dbchecks'

    # List of all modules packaged with this module
    ModuleList             = @()

    # List of all files packaged with this module
    FileList               = ''

    PrivateData            = @{
        # PSData is module packaging and gallery metadata embedded in PrivateData
        # It's for rebuilding PowerShellGet (and PoshCode) NuGet-style packages
        # We had to do this because it's the only place we're allowed to extend the manifest
        # https://connect.microsoft.com/PowerShell/feedback/details/421837
        PSData = @{
            # The primary categorization of this module (from the TechNet Gallery tech tree).
            Category     = "Databases"

            # Keyword tags to help users find this module via navigations and search.
            Tags         = @('sqlserver', 'sql', 'dba', 'databases', 'audits', 'checklists', 'Pester', 'PowerBi' , 'validation')

            # The web address of an icon which can be used in galleries to represent this module
            IconUri      = "https://dbachecks.io/logo.png"

            # The web address of this module's project or support homepage.
            ProjectUri   = "https://dbachecks.io"

            # The web address of this module's license. Points to a page that's embeddable and linkable.
            LicenseUri   = "https://opensource.org/licenses/MIT"

            # Release notes for this particular version of the module
            ReleaseNotes = "
## Date 29th July 2019
Thank you @TracyBoggiano
Added tags for checks that will be part of CIS checks #642
CIS project started
Added check for default trace enabled #684

Run Get-DbcReleaseNotes for all release notes
            "

            # If true, the LicenseUrl points to an end-user license (not just a source license) which requires the user agreement before use.
            # RequireLicenseAcceptance = ""

            # Indicates this is a pre-release/testing version of the module.
            IsPrerelease = 'False'
        }
    }
}
