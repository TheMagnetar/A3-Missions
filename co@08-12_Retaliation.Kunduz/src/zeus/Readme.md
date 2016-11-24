## /src/zeus

En aquesta carpeta es troben els fitxers que serveixen per afegir al Zeus les unitats que s'han posat mitjançant l'editor,
els jugadors i les unitats posades durant la partida per altres Zeus. Consta de quatre fitxers, que no són necessàris que
es modifiquin per la missió:

* `bmt_zeus_init.sqf`: s'executa només en el servidor i afegeix al Zeus totes les unitats afegides al mapa mitjançant l'editor,
  així com els objectes i els vehicles amb la seva tripulació. S'executa des del fitxer `init.sqf`.
* `fn_zeus_eventHandlers.sqf`: s'executa durant la fase de `PostInit` i crea un "EventHandler" que s'executa cada cop que un dels
  Zeus a la partida posa un objecte (`fn_zeus_afegirObjectes.sqf`) o un grup amb unitats (`fn_zeus_afegirGrups.sqf`).
  * `fn_zeus_afegirObjectes.sqf`: Afegeix un objecte, col·locat mitjançant el Zeus, com a objecte editable als altres Zeus.
  * `fn_zeus_afegirGrups.sqf`: Afegeix un grup, amb la tripulació en cas de que sigui un vehicle, que s'hagi col·locat mitjançant
    el Zeus a la resta de Zeus.
