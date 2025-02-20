#  Repositório do GitHub


## Objetivo do Script ##
```batch
@echo off
if not exist %1 (
    mkdir %1
)
cd %1

if not exist %2 (
    mkdir %2
)

set mes=%2
set ano=%1

```

Este script tem como objetivo criar uma estrutura de diretórios para um ano e um mês fornecidos como parâmetros. Para isso, ele cria um diretório para o **ano**, um diretório para o **mês** dentro do ano e, em seguida, cria diretórios correspondentes a **cada dia do mês**, levando em consideração se o ano é bissexto ou não, caso o mês seja **fevereiro**.

# Problema que Resolve

O script resolve a necessidade de organizar arquivos por data, criando uma estrutura de diretórios de forma automatizada. Isso pode ser útil em diversos cenários, como:

- A organização de **backups**.
- A criação de **pastas para armazenar arquivos de eventos diários**.
- Qualquer outro processo que precise de uma organização **baseada em data**.

A automação dessa criação de diretórios pode economizar tempo e evitar erros humanos ao organizar pastas manualmente.

## Parâmetros `%1` e `%2`:

Quando você executa o script, ele espera **dois parâmetros**: 
```batch
set mes=%2
set ano=%1

```
- O primeiro parâmetro (`%1`) representa o **ano**.
- O segundo parâmetro (`%2`) representa o **mês**.

## Criação dos diretórios:

O script vai verificar se os diretórios para o ano (`%1`) e o mês (`%2`) já existem. Se **não existirem**, ele vai **criar esses diretórios** com o comando `mkdir`.

Ou seja, se a pasta para o ano ou o mês não estiver lá, o script vai criar elas automaticamente para organizar as pastas de acordo com a data.

## Cabeçalho - `@echo off`:

A linha `@echo off` serve para **esconder** os comandos do script enquanto ele está sendo executado. Isso faz com que a tela fique mais limpa, sem mostrar todo o código sendo processado. No final, só aparecerá o que for importante para o usuário, como mensagens e resultados.

## Definição das variáveis e lógica do ano bissexto:
```batch
set /a bissexto=0
set /a ano1=ano %% 4
set /a ano2=ano %% 100
set /a ano3=ano %% 400

```

 O mês (%2) e o ano (%1) são passados para o script e armazenados nas variáveis mes e ano, respectivamente.

 **set /a bissexto=0**: Aqui, o script assume que o ano não é bissexto por padrão (bissexto = 0).

 O script faz algumas verificações simples:
 
Se o ano for divisível por 4, mas não por 100, ou

Se o ano for divisível por 400,

# Definição do número de dias no mês
```batch
if %mes%==1 set days=31
if %mes%==2 (
    if %bissexto%==1 (
        set days=29
    ) else (
        set days=28
    )
)
```
Para cada mês, o script atribui o número correto de dias.No caso de fevereiro (%mes%==2), ele verifica se o ano é bissexto. Se for, fevereiro terá 29 dias; caso contrário, terá 28 dias.
