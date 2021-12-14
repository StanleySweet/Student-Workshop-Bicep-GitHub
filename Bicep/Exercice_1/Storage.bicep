// à lire pour les conventions de noms
// https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/best-practices
// https://fr.wikipedia.org/wiki/Camel_case

// documentation Azure Storage Bicep
// https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts?tabs=bicep


param  storageAccountName string
param location string

@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
param skuName string

@allowed([
  'BlobStorage'
  'BlockBlobStorage'
  'FileStorage'
  'Storage'
  'StorageV2'
])
param kindName string

// https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts?tabs=bicep
resource storageAccount0 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName //https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftstorage
  location: location
  sku: {
    name: skuName //https://docs.microsoft.com/en-us/azure/templates/microsoft.storage/storageaccounts?tabs=bicep#sku
  }
  kind: kindName
}

// editez le fichier Storage.parameters.json pour affecter les valeurs de vos paramètres 
// testez votre code en le déployant dans le resource group créé précédemment
// az deployment group create --resource-group RG-Bicep-00 --template-file ./Bicep/Exercice_1/Storage.bicep --parameters ./Bicep/Exercice_1/Storage.parameters.json
