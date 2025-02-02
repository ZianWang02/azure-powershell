@{
  GUID = '5775d46c-778c-4011-b1be-d7d7b9a98fe8'
  RootModule = './Az.KubernetesConfiguration.psm1'
  ModuleVersion = '0.1.0'
  CompatiblePSEditions = 'Core', 'Desktop'
  Author = 'Microsoft Corporation'
  CompanyName = 'Microsoft Corporation'
  Copyright = 'Microsoft Corporation. All rights reserved.'
  Description = 'Microsoft Azure PowerShell: KubernetesConfiguration cmdlets'
  PowerShellVersion = '5.1'
  DotNetFrameworkVersion = '4.7.2'
  RequiredAssemblies = './bin/Az.KubernetesConfiguration.private.dll'
  FormatsToProcess = './Az.KubernetesConfiguration.format.ps1xml'
  FunctionsToExport = 'Get-AzKubernetesConfiguration', 'Get-AzKubernetesExtension', 'New-AzKubernetesConfiguration', 'New-AzKubernetesExtension', 'Remove-AzKubernetesConfiguration', 'Remove-AzKubernetesExtension', 'Update-AzKubernetesExtension', '*'
  AliasesToExport = 'Get-AzK8sConfiguration', 'Get-AzK8sExtension', 'New-AzK8sConfiguration', 'New-AzK8sExtension', 'Remove-AzK8sConfiguration', 'Remove-AzK8sExtension', 'Update-AzK8sExtension', '*'
  PrivateData = @{
    PSData = @{
      Tags = 'Azure', 'ResourceManager', 'ARM', 'PSModule', 'KubernetesConfiguration'
      LicenseUri = 'https://aka.ms/azps-license'
      ProjectUri = 'https://github.com/Azure/azure-powershell'
      ReleaseNotes = ''
    }
  }
}
