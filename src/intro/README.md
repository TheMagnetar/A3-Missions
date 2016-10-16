## scripts/intro

En aquesta carpeta es troben els diferents fitxers per crear una introducció a la partida. El fitxer `bmt_intro.sqf` és el fitxer al qual s'ha d'accedir desde `init.sqf`
i per norma general no s'ha de modificar.

Cada una de les faccions suportades té un fitxer propi que s'ha de customitzar si algun dels jugadors forma part d'aquesta facció i l'efecte que de moment està configurat
és el d'una pantalla en negre on hi van apareixen les següents entrades:

* Una frase de benvinguda d'un dels membres del grup sobre un fons negre (línia 26). Per defecte: `Relaxar-se mata! Estigueu alerta!\nViper - Capità dels cavallers del Cel`.
* Nom de la missió (línia 38), hora (línia 39) i localització (línia 40) a la dreta de la pantalla amb un efecte blur.