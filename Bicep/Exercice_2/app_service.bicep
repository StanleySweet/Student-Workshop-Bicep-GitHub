param appServiceName string
param dockerImage string
param dockerImageTag string
param appPlan0Id string



resource appService0 'Microsoft.Web/sites@2021-02-01' = {
  name: appServiceName
  location: resourceGroup().location
  properties: {
    siteConfig: {
      appSettings: [
      ]
      linuxFxVersion: 'DOCKER|${dockerImage}:${dockerImageTag}'
    }
    serverFarmId: appPlan0Id
  }
}
