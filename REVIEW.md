# Code Review

## Deploy 

```bash

sf org create scratch --edition=developer --alias=maylson-desafio-02 --target-dev-hub=force-camp-class-01 --wait=10

sf project deploy start -o maylson-desafio-02

```

## Critérios

* Práticas de Clean Code – 10% - 5%
* Nomeação – 10% - 5%
* Organização de Código e Code Style e Indentação – 15% - 10%
* Padrões aplicados – 20% - 10%
* Resolução do Desafio – 45% - 35%

## Requisitos

[OK] Deverá utilizar o Padrão Trigger Handler
[NOT-OK] Deverá utilizar o Padrão FixtureFactory
[OK] Deverá utilizar o Padrão Filter
[NOT-OK] Deverá utilizar o Padrão Validator


### Validação

Maylson gostei da separação de folders, só sugiro que elas fiquem em seguindo o padrão kabab-case. As classes de TriggerHandler devem estar junto com as classes! não misturadas com as triggers.

Você poderia ter criado folders seguindo essa convenção a convenção abaixo

- classes
    - account
        - validator
        - filter
        - trigger
        - 

Acredito que tenha ficado alguma dúvida sobre a utilização dos padrões, sugiro rever a aula de trigger handler, pois vc utilizou o Pattern Filter para ser o Validator! 

Lembrando que o Pattern Filter tem o papel de filtrar, indexar, agrupar os dados de um determinado objeto, removendo assim essa responsabilidade de outras classes. Ela é utilizada com apoio a outras classes. Ela não dever ser responsável por um regra de negócio especifica, e não deve alterar o dado. 

Ela tem geralmente métodos `filterByXXX`, ou `indexByXXXX`, ou `groupByXXXX`.


#### TriggerHandler

Como comentado anteriormente, as **classe** de `TriggerHandler` devem estar na folder de `classes` e não em `triggers`

Percebi um pequeno problema de indentação na TriggerHandler de Account, sou muito critico referente a isso, faz parte do principio básico da comunicação.


#### Validator

Não implementou o Validator, na verdade juntou o Validator no filter.

O Pattern Validator pode utilizar do Filter para aplicar a sua validação.
