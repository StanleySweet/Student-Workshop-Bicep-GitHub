param appPlanNane string
param skuNameAppPlan string

resource appPlan0 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appPlanNane
  location: resourceGroup().location
  kind: 'linux'
  sku: {
    name: skuNameAppPlan // https://docs.microsoft.com/en-us/cli/azure/appservice/plan?view=azure-cli-latest#az_appservice_plan_create
  }
  properties: {
    reserved: true
  }
}

output appPlan0Id string = appPlan0.id
