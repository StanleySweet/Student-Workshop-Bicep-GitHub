param acrName string // Attention cette valeur doit être unique et en minuscule xxxxx.azurecr.io
param location string
param skuNameACR string

// https://docs.microsoft.com/en-us/azure/container-registry/container-registry-best-practices
// https://docs.microsoft.com/en-us/azure/templates/microsoft.containerregistry/registries?tabs=bicep
// https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming#example-names-storage


// ajouter le tag usage = demo pour la ressource ACR
resource acr0 'Microsoft.ContainerRegistry/registries@2020-11-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: skuNameACR //https://docs.microsoft.com/en-us/azure/container-registry/container-registry-skus 
  }  
}

// créer un fichier de paramètre acr-student.parameters.json avec les valeurs à fournir au déploiement
// déployer le code bicep avec la cli Azure
