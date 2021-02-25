
Clear-Host

$lstLocApp = Get-AzResource -ResourceType Microsoft.Logic/workflows

ForEach($logicApp in $lstLocApp) {
    Write-Host `r`n `r`n ===================== `r`n $logicApp.Name
    $triggerName = (Get-AzLogicAppTrigger  -ResourceGroupName $logicApp.ResourceGroupName -Name $logicApp.Name).Name
    Write-Host Trigger Name: $triggerName
    
    $latestVersion = Get-AzLogicAppTriggerHistory  -ResourceGroupName $logicApp.ResourceGroupName -Name $logicApp.Name -TriggerName $triggerName  | Select-Object -first 1
    Write-Host Versions: $latestVersion.Name
    
    $logicAppCode = Get-AzLogicAppUpgradedDefinition -ResourceGroupName $logicApp.ResourceGroupName -Name $logicApp.Name -TargetSchemaVersion $latestVersion.Name

    $fileName =  $logicApp.Name & ".json"
    Out-File -FilePath $fileName -InputObject $logicAppCode
}


# Get-AzLogicAppTrigger  -ResourceGroupName logicapptest -Name SimpleMorningTest

# $test = Get-AzLogicApp  -ResourceGroupName logicapptest -Name SimpleMorningTest
# $appDef = ConvertFrom-Json $test.Definition.ToString()
# $appDef.$schema
# $appDef.triggers

# Before this we need to find the Name
#Get-AzLogicAppTriggerHistory -ResourceGroupName logicapptest -Name SimpleMorningTest -TriggerName manual

# REQUIRE to know the version
#Get-AzLogicAppUpgradedDefinition -ResourceGroupName logicapptest -Name SimpleMorningTest -TargetSchemaVersion 



Get-AzLogicAppUpgradedDefinition -ResourceGroupName "logicapptest" -Name "SimpleMorningTest" -TargetSchemaVersion "2016-06-01"

Get-AzLogicAppTriggerHistory  -ResourceGroupName logicapptest -Name SimpleMorningTest -TriggerName manual  | Select-Object -first 1

Get-AzLogicAppTriggerHistory  -ResourceGroupName logicapptest -Name SimpleMorningTest -TriggerName manual -HistoryName



$test = Get-AzLogicApp  -ResourceGroupName logicapptest -Name SimpleMorningTest
$appDef = ConvertFrom-Json $test.Definition.ToString()

Out-File -FilePath test.json -InputObject $test.Definition
$jsonObjDef = $test.Definition
Out-File -FilePath test.json -InputObject ConvertFrom-Json $test.Definition

Out-File -FilePath test.json -InputObject $jsonFirstDef


$jsonFirstDef

$test.Definition.PSObject.Properties | ForEach-Object { Write-Host $_.Name  $_.Value }

$jsonObjDef | select Root



# AZ CLI 
az logic workflow show --resource-group logicapptest --name SimpleMorningTest
                       