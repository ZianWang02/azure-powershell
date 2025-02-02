Describe 'New-AzKustoScript' {
    BeforeAll{
        $kustoCommonPath = Join-Path $PSScriptRoot 'common.ps1'
        . ($kustoCommonPath)
        $loadEnvPath = Join-Path $PSScriptRoot 'loadEnv.ps1'
        if (-Not (Test-Path -Path $loadEnvPath)) {
            $loadEnvPath = Join-Path $PSScriptRoot '..\loadEnv.ps1'
        }
        . ($loadEnvPath)
        $TestRecordingFile = Join-Path $PSScriptRoot 'New-AzKustoScript.Recording.json'
        $currentPath = $PSScriptRoot
        while (-not $mockingPath) {
            $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
            $currentPath = Split-Path -Path $currentPath -Parent
        }
    . ($mockingPath | Select-Object -First 1).FullName
    }

    It 'CreateExpanded' {
        $continueOnErrors = $false
        $clusterName = $env.clusterName
        $databaseName = "testdatabase" + $env.rstr4
        $databaseFullName = $clusterName + "/" + $databaseName

        $databaseCreated = New-AzKustoDatabase -ResourceGroupName $env.resourceGroupName -ClusterName $clusterName -Name $databaseName -Kind ReadWrite -Location $env.location
        
        $Script = New-AzKustoScript -ClusterName $clusterName -DatabaseName $databaseName -Name $env.scriptName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId -ContinueOnError -ForceUpdateTag $env.forceUpdateTag -ScriptUrl $env.scriptUrl -ScriptUrlSasToken $env.scriptUrlSasToken
        
        Validate_Script $Script $env.scriptUrl $env.forceUpdateTag $continueOnErrors $clusterName $databaseName $env.scriptName

        { Remove-AzKustoDatabase -ResourceGroupName $env.resourceGroupName -ClusterName $env.clusterName -Name $name } | Should -Not -Throw
    }

    It 'Create' {
        $continueOnErrors = $false
        $clusterName = $env.clusterName
        $databaseName = "testdatabase" + $env.rstr4
        $databaseFullName = $clusterName + "/" + $databaseName

        $databaseCreated = New-AzKustoDatabase -ResourceGroupName $env.resourceGroupName -ClusterName $clusterName -Name $databaseName -Kind ReadWrite -Location $env.location
        
        $Parameter = (@{ForceUpdateTag=$env.forceUpdateTag; Url=$env.scriptUrl; UrlSasToken=$env.scriptUrlSasToken})

        $Script = New-AzKustoScript -ClusterName $clusterName -DatabaseName $databaseName -Name $env.scriptName -ResourceGroupName $env.resourceGroupName -SubscriptionId $env.SubscriptionId -Parameter $Parameter
        
        Validate_Script $Script $env.scriptUrl $env.forceUpdateTag $continueOnErrors $clusterName $databaseName $env.scriptName

        { Remove-AzKustoDatabase -ResourceGroupName $env.resourceGroupName -ClusterName $env.clusterName -Name $name } | Should -Not -Throw
    }    
}
