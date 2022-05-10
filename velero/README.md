 # Velero
 Backup and restore of kubernetes objects.
cd lan-kind
kind create cluster --name velero --config kind-config.yml --image kindest/node:v1.17.11

```shell script
wget https://github.com/vmware-tanzu/velero/archive/v1.7.1.tar.gz
tar -zxvf v1.7.1.tar.gz
cd velero-1.7.1/
go build ./cmd/velero
sudo mv velero /usr/local/bin
```
```shell
docker run -it --rm --entrypoint /bin/sh bitnami/azure-cli:2.31.0-debian-10-r7
az login
az group create -n velero --location francecentral
az storage account create --name backupvelerosk1 --resource-group velero --sku Standard_GRS
az storage account keys list --resource-group velero --account-name backupvelerosk1
AZURE_KEY=`az storage account keys list --resource-group velero --account-name backupvelerosk1 --query "[?keyName =='key1'].value" -o tsv`
export BLOB_CONTAINER=mycluster
export AZURE_BACKUP_RESOURCE_GROUP=velero
export AZURE_STORAGE_ACCOUNT_NAME=backupvelerosk1
export AZURE_STORAGE_ACCOUNT_ACCESS_KEY=Y3+7x2jAM9Cf1UShe6uXOnJExewUvF25ZE2qWILvq/9MGbrVGCrI5GOZWsr1mzzFg+ceYAM6/JjjF6XBmN79cg==
export AZURE_BACKUP_SUBSCRIPTION_ID=c1acdf82-6ae6-4207-97d6-0257a35fac34
export AZURE_CLOUD_NAME=AzureCloud

cat << EOF > /tmp/credential-velero
> AZURE_STORAGE_ACCOUNT_ACCESS_KEY=${AZURE_STORAGE_ACCOUNT_ACCESS_KEY}
> AZURE_CLOUD_NAME=${AZURE_CLOUD_NAME}
> EOF

velero install --provider azure \
--plugins velero/velero-plugin-for-microsoft-azure:v1.3.1 \
--bucket $BLOB_CONTAINER \
--secret-file /tmp/credential-velero \
--backup-location-config resourceGroup=$AZURE_BACKUP_RESOURCE_GROUP,storageAccount=$AZURE_STORAGE_ACCOUNT_NAME,storageAccountKeyEnvVar=AZURE_STORAGE_ACCOUNT_ACCESS_KEY[,subscriptionId=$AZURE_BACKUP_SUBSCRIPTION_ID] \
--use-volume-snapshots=false


AZURE_BACKUP_SUBSCRIPTION_NAME="Azure subscription 1"
AZURE_BACKUP_SUBSCRIPTION_ID=$(az account list --query="[?name=='$AZURE_BACKUP_SUBSCRIPTION_NAME'].id | [0]" -o tsv)
az account set -s $AZURE_BACKUP_SUBSCRIPTION_ID
AZURE_BACKUP_RESOURCE_GROUP=Velero_Backups
az group create -n $AZURE_BACKUP_RESOURCE_GROUP --location WestUS
AZURE_STORAGE_ACCOUNT_ID="velero1b2f229c"
az storage account create \
--name $AZURE_STORAGE_ACCOUNT_ID \
--resource-group $AZURE_BACKUP_RESOURCE_GROUP \
--sku Standard_GRS \
--encryption-services blob \
--https-only true \
--kind BlobStorage \
--access-tier Hot
BLOB_CONTAINER=velero
az storage container create -n $BLOB_CONTAINER --public-access off --account-name $AZURE_STORAGE_ACCOUNT_ID

AZURE_SUBSCRIPTION_ID=`az account list --query '[?isDefault].id' -o tsv`
echo $AZURE_SUBSCRIPTION_ID
AZURE_TENANT_ID=`az account list --query '[?isDefault].tenantId' -o tsv`
AZURE_CLIENT_SECRET=`az ad sp create-for-rbac --name "velero" --role "Contributor" --query 'password' -o tsv \
                     --scopes  /subscriptions/$AZURE_SUBSCRIPTION_ID`
AZURE_CLIENT_ID=`az ad sp list --display-name "velero" --query '[0].appId' -o tsv`

AZURE_SUBSCRIPTION_ID=c1acdf82-6ae6-4207-97d6-0257a35fac34
AZURE_TENANT_ID=f9e161d5-08bc-4174-a5c3-02237cbdf5bb
AZURE_CLIENT_ID=4aa07168-c101-4f0b-b988-f0a4911a2092
AZURE_CLIENT_SECRET=WzhwUmlNefq_cyR0xUkEE9JR_ajiCPGEMB
AZURE_RESOURCE_GROUP=Velero_Backups
AZURE_CLOUD_NAME=AzurePublicCloud 

AZURE_STORAGE_ACCOUNT_ACCESS_KEY=82PZSOdq6mhZ98g9O5wXUNCHwwVsD0gO4SzFzkMgFImVb3vIInQ33dULh0HK2stAFrgpmpvXAsCl+qG9rvWrYQ==
AZURE_BACKUP_SUBSCRIPTION_ID=c1acdf82-6ae6-4207-97d6-0257a35fac34
```