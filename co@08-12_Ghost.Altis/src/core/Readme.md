## scripts/comu

En aquesta carpeta es troben els següents fitxers, que serveixen per configurar variables comunes a la resta dels scripts i funcions de la plantilla a excepció
d'addons externs:

* *`bmt_variables_comunes.sqf`*: és l'únic fitxer que pot ser d'interès per el creador de la missió. En aquest fitxer es defineixen les variables `bmt_array_groups`
  i `bmt_array_frequenciesShortRange`. Aquestes variables són importants a l'hora de configurar, si es vol, els canals i les freqüències de les ràdios del Task Force
  Arrowhead Radio (TFAR) o del Advanced Combat Radio Environment 2 (ACRE2). És important que aquestes dues variables tinguin la mateixa mida.
* *`fn_processarMods`*: Aquest fitxer no s'hauria de modificar a menys que es vulgui afegir un mod que es vulgui detectar de forma Automatica per després
  configurar-lo mitjançant scripts. S'executa durant la fase de `PostInit`. Actualment els següents mods estan suportats:
  * Advanced Combat Environment 3 (ACE 3). A l'estàndard.
  * Advanced Combat Radio Enviroment 2 (ACRE2). 
  * Advanced Gameplay Modification (AGM). Obsolet.
  * Task Force Arrowhead Radio (TFAR). A l'estàndard.
* *`fn_processarParamsArray`*: Aquest fitxer, que s'executa durant la fase de `PreInit`, no s'ha de modificar ja que processa els diferents paràmetres de la missió
  (`class Params` al fitxer `description.ext`) per tal de que les variables definides siguin accessibles a tots els clients i siguin compatibles amb l'ús de
  servidors dedicats.