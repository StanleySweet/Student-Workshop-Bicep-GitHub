// https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/best-practices
// https://fr.wikipedia.org/wiki/Camel_case

// https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-cli
// https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-to-resource-group?tabs=azure-cli
targetScope = // à compléter !!


// Définition des Paramètres
// https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/parameters
param rgName      // à compléter
param location   // à compléter


// Ressource 
// https://docs.microsoft.com/en-us/azure/templates/microsoft.resources/resourcegroups?tabs=bicep
resource rg0 'Microsoft.Resources/resourceGroups@2021-04-01'= {
  name: rgName // paramètre
  location: location // paramètre
}

// testez votre code Bicep en le déployant sur votre Azure Subscription
// az login
// vérifiez que vous êtes sur le bon abonnement Azure
// az account list
// si besoin se positionner sur le bon abonnement
// az account set --subscription "Nom de la subscription"
// az deployment sub create --location westeurope --template-file ./Bicep/Exercice_1/Rg.bicep --parameters 'rgName=RG-Bicep-00' 'location=westeurope'
