
Clear-Host

$lstLocApp = Get-AzResource -ResourceType Microsoft.Logic/workflows

ForEach($logicApp in $lstLocApp) {
    Write-Host $logicApp.Name
    $triggerName = (Get-AzLogicAppTrigger  -ResourceGroupName $logicApp.ResourceGroupName -Name $logicApp.Name).Name
    
    $lastestVersion = Get-AzLogicAppTriggerHistory  -ResourceGroupName $logicApp.ResourceGroupName -Name $logicApp.Name -TriggerName $triggerName
    #$logicAppCode = Get-AzLogicAppUpgradedDefinition -ResourceGroupName $logicApp.ResourceGroupName -Name $logicApp.Name -TargetSchemaVersion $lastestVersion

    #$fileName =  $logicApp.Name & ".json"
    #Out-File -FilePath $fileName -InputObject $logicAppCode
}


# Get-AzLogicAppTrigger  -ResourceGroupName logicapptest -Name SimpleMorningTest

# $azLogicApp = Get-AzLogicApp  -ResourceGroupName logicapptest -Name SimpleMorningTest
# $appDef = ConvertFrom-Json $azLogicApp.Definition.ToString()
# $appDef.$schema
# $appDef.triggers

# Before this we need to find the Name
#Get-AzLogicAppTriggerHistory -ResourceGroupName logicapptest -Name SimpleMorningTest -TriggerName manual

# REQUIRE to know the version
#Get-AzLogicAppUpgradedDefinition -ResourceGroupName logicapptest -Name SimpleMorningTest -TargetSchemaVersion 