### Example 1: Remove an DNS forwarding ruleset by name.
```powershell
PS C:\> Remove-AzDnsForwardingRuleset -Name dnsForwardingRulset -ResourceGroupName sampleRG
```

This command removes a DNS forwarding ruleset by name.

### Example 2: Remove a DNS forwarding ruleset by identity
```powershell
PS C:\> $dnsResolverDnsForwardingRulesetObject = Get-AzDnsForwardingRuleset -Name dnsForwardingRuleset -ResourceGroupName sampleRG
PS C:\> Remove-AzDnsForwardingRuleset -InputObject $dnsResolverDnsForwardingRulesetObject 
```

This command removes a DNS forwarding ruleset by identity.

