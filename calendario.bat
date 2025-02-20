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
pause

rem Verifica se o ano é bissexto
set /a bissexto=0
set /a ano1=ano %% 4
set /a ano2=ano %% 100
set /a ano3=ano %% 400

if %ano1%==0 (
    if %ano2%==0 (
        if %ano3%==0 (
            set bissexto=1
        ) else (
            set bissexto=0
        )
    ) else (
        set bissexto=1
    )
) else (
    set bissexto=0
)

rem Define o número de dias no mês
if %mes%==1 set days=31
if %mes%==2 (
    if %bissexto%==1 (
        set days=29
    ) else (
        set days=28
    )
)
if %mes%==3 set days=31
if %mes%==4 set days=30
if %mes%==5 set days=31
if %mes%==6 set days=30
if %mes%==7 set days=31
if %mes%==8 set days=31
if %mes%==9 set days=30
if %mes%==10 set days=31
if %mes%==11 set days=30
if %mes%==12 set days=31

echo O número de dias no mês %mes% do ano %ano% é %days%

rem Cria diretórios para cada dia do mês
for /L %%i in (1,1,%days%) do (
    mkdir %%i
)