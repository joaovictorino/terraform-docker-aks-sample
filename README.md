# Subindo um exemplo com Docker, Terraform e Kubernetes no Azure

Passos para executar o exemplo:

1.  Instalar o az-cli e logar na sua conta Azure

    https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

2.  Instalar o Docker

    https://docs.docker.com/get-docker/

3.  Instalar o Terraform

    https://learn.hashicorp.com/collections/terraform/azure-get-started

4.  Instalar o kubectl

    https://kubernetes.io/docs/tasks/tools/

5.  Executar o seguinte comando no terminal `az ad sp create-for-rbac` e observe a saída abaixo:

```json
{
  "appId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
  "displayName": "some-display-name",
  "name": "http://azure-cli-2017-04-03-15-30-52",
  "password": "XXXXXXXXXXXXXXXXXXXX",
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
```

5.  Criar o arquivo terraform.tfvars na pasta terraform com o seguinte conteúdo:

```
    appId = "[conteúdo comando acima]"
    password = "[conteúdo comando acima]"
    project_name = "prodam"
```

5.  Executar o script tfs.sh

```sh
    ./tfs.sh
```

6.  Acessar no browser o endereço IP exibido no final do script

# Finalizando o exemplo

Para descartar o ambiente entrar na pasta terraform e executar o seguinte comando `terraform destroy --force`