## scripts/configEquipment

En aquesta carpeta es troben els diferents fitxers per equipar tan les unitats jugables com vehicles i caixes de munició. Cada una de les faccions suportades té un fitxer de configuració propi al que s'accedeix a través del fitxer 'fn_configEquipació.sqf`.

Addicionalment, el fitxer 'bmt_configEquipment_perfils.sqf` equipa la unitat amb un dels perfils de Virtual Arsenal del 1er Regiment Aerotransportat (1RA).

#### Els fitxers `bmt_configEquipment_*.sqf`

Per tal d'equipar, depenent de mods de realisme com ACE3 i/o del sistema mèdic que s'utilitzi de forma Automatica, una de les unitats jugables o vehicle que pertanyin a una facció cal posar la següent entrada a la línia d'init de la unitat.

`["ROL_JUGADOR",this] call bmt_fnc_configEquipment;`

on `ROL_JUGADOR` és una de les entrades, en minúscula, que suporta la facció en si. Per saber quins rols suporta una facció específica només cal Scoper a la capçalera del fitxer de configuració de la facció
en aquesta mateixa carpeta.

En cas de caixes de munició, que no tenen cap facció assignada, cal modificar la línia de codi anterior i afegir un tercer paràmetre a la crida de la funció:

`["ROL_JUGADOR",this,"FACCIO"] call bmt_fnc_configEquipment;`

Aquest tercer paràmetre, `FACCIO`, s'utilitza per forçar una certa facció a la unitat i també es podria fer servir per sobreescriure la facció de la unitat. Això dóna la possibilitat d'equipar
unitats militars amb robes civils que estiguin definides a `bmt_configEquipment_civ_f.sqf` per exemple.

Els fitxers `bmt_configEquipment_rhs*.sqf` depenen del mod RHS.

#### La carpeta 1RA_Perfils

En aquesta carpeta es pot trobar el fitxer que s'utilitza per configurar els perfils `1RA_Perfils.sqf`. Aquest fitxer no s'ha de modificar per una missió específica ja que afecta a tots els perfils guardats al Virtual Arsenal del grup.
S'inclou a la plantilla per tal de que es tingui la possibilitat d'incloure alguna forma de poder guardar els perfils del grup 1RA en cas de que algun jugador no els tingui i la missió depengui d'aquests perfils.

En el cas que es vulgui donar la opció de guardar els perfils predefinits és recomenable introduïr un objecte a la partida amb la següent línia de codi:

`this addAction ["<t color='#027CE7'>Desar perfils 1RA</t>", "scripts\configEquipment\1RA_Perfils\1RAPerfils.sqf"];`

que farà que l'obtecte tingui una opció, resaltada en color vermell, que permetrà al jugador guardar els perfils del grup 1RA.

#### Creació de noves entrades

No hi ha res que prohibeixi la creació de noves entrades per missions específiques. L'única norma a seguir a l'hora de crear una entrada és que aquesta ha de ser sempre en **minúscules**.
L'únic fitxer que no pot contenir entrades addicionals és el `bmt_configEquipment_perfils.sqf`.