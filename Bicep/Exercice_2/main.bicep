targetScope = 'subscription'

param rgNameApplication string
param acrName string
param skuNameACR string
param appPlanNane string
param skuNameAppPlan string
param AppServiceName string
param dockerImage string 
param dockerImageTag string

// toLower -> https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/bicep-functions-string#tolower
// uniqueString -> https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/bicep-functions-string#uniquestring

var registryName = toLower('${acrName}${uniqueString(rgNameApplication)}')
var planName = toLower('${appPlanNane}${uniqueString(rgNameApplication)}')
var siteName = toLower('${AppServiceName}${uniqueString(rgNameApplication)}')

resource rgApplication0 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgNameApplication
  location: deployment().location

}

module acrApplication0 'acr.bicep' = {
  scope: rgApplication0
  name: 'deployacrApplication0'
  params: {
    acrName: registryName
    location: deployment().location
    skuNameACR: skuNameACR
  }
}

// Demo App Plan
module appPlanService0 'app_plan.bicep' = {
  scope: rgApplication0
  name: 'deployAppPlanService0'
  params: {
    appPlanNane: planName
    skuNameAppPlan: skuNameAppPlan
  }
}

// Demo App Service
module appService0 'app_service.bicep' = {
  scope: rgApplication0
  name: 'deployappService0'
  params: {
    appPlan0Id: appPlanService0.outputs.appPlan0Id
    appServiceName: siteName
    dockerImage: dockerImage
    dockerImageTag: dockerImageTag
  }
}

/* 
Deploiement
az deployment sub create --location westeurope --template-file ./Bicep/Exercice_2/main.bicep --parameters ./Bicep/Exercice_2/deploy.parameters.json


Test ACR:
az acr import --name monacr --source mcr.microsoft.com/windows/servercore:ltsc2019 --image servercore:ltsc2019
az acr import --name monacr --source index.docker.io/nginxdemos/hello:latest --image nginxdemos/hello:latest

Infos:
https://docs.microsoft.com/en-us/azure/container-registry/container-registry-import-images?tabs=azure-cli#import-from-docker-hub
https://docs.microsoft.com/en-us/azure/container-registry/container-registry-authentication?tabs=azure-cli



*/


