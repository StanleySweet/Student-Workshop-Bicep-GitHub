// à lire pour les conventions de noms
// https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/best-practices
// https://fr.wikipedia.org/wiki/Camel_case

// documentation Azure Storage Bicep
// https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts?tabs=bicep


param  storageAccountName string
param location string

@allowed([
  // à compléter
])
param skuName string

@allowed([
   // à compléter
])
param kindName string

// https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts?tabs=bicep
resource storageAccount0 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName //https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftstorage
  location: // à compléter
  sku: {
    name: skuName //https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts?tabs=bicep#sku
  }
  kind: // à compléter
}

// editez le fichier Storage.parameters.json pour affecter les valeurs de vos paramètres 
// testez votre code en le déployant dans le resource group créé précédemment
// az deployment group create --resource-group RG-Bicep-00 --template-file ./Bicep/Exercice_1/Storage.bicep --parameters ./Bicep/Exercice_1/Storage.parameters.json
