### Example 1: Remove an app configuration store
```powershell
Remove-AzAppConfigurationStore -Name appconfig-test03 -ResourceGroupName lucas-manual-test

```

This command removes an app configuration store.

### Example 2: Remove an app configuration store
```powershell
Get-AzAppConfigurationStore -Name appconfig-test02 -ResourceGroupName lucas-manual-test | Remove-AzAppConfigurationStore

```

This command removes an app configuration store.