RED='\033[0;31m'
NC='\033[0m' 

echo "\n${RED}Compilando imagem localmente${NC}"
docker build -t nginx_teste .

cd terraform

echo "\n${RED}Inicializando o terraform no azure${NC}"
terraform init -upgrade

echo "\n${RED}Criando infra com terraform no azure${NC}"
terraform apply -auto-approve

echo "\n${RED}Logando no container registry privado${NC}"
az acr login --name testesampleaks

docker tag nginx_teste:latest testesampleaks.azurecr.io/nginx_teste:latest

echo "\n${RED}Subindo imagem no registry${NC}"
docker push testesampleaks.azurecr.io/nginx_teste:latest

echo "\n${RED}Logando no aks${NC}"
az aks get-credentials --resource-group rg-testesampleaks --name teste-aks --overwrite-existing

cd ../

echo "\n${RED}Subindo aplicação kubernetes${NC}"
kubectl apply -f k8s

echo "\n${RED}Acessar o endereço abaixo para teste${NC}\n"
kubectl get svc nginx-svc -o jsonpath="{.status.loadBalancer.ingress[*].ip}"