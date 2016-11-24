## /src/briefing

En aquesta carpeta es troben els diferents fitxers per escriure el briefing a les diverses faccions suportades a la Plantilla Bàsica per Missions (PBM) i un especial per l'administrador. Cadascun dels fitxers de té la següent estructura a excepció de `bmt_briefing_admin.sqf`. Cal destacar que els apartats apareixen en ordre invers a Arma 3: la secció que primer s'introdueix apareix en última posició al llistat.

#### Admin

Aquest apartat només apareix al jugador que estigui com a administrador del servidor. Conté els següents apartats:

* *Informació per l'administrador*: Conté el llistat d'addons necessàri per jugar la missió de forma correcta.
* *Notes del creador de la missió*: Diferents comentaris del creador de la missió que poden interessar a l'administrador:
  * **Nom de la missió**: Nom de la missió.
  * **Versió**: 1.0.
  * **Autor**: Nom de l'autor de la missió.
  * **Col·laboradors**: Llistat de persones que han col·laborat a la missió.
  * **Nombre mínim de jugadors**: xx.
  * **Nombre màxim de jugadors**: yy.
  * **Respawn**: Tipus de respawn a la missió (ocell, a base, deshabilitat, ...)
  * **Dificultat**: Dificultat de la missió segons l'autor.
  * **Resum de la missió**: Breu resum de la missió.
* *Diferents finals de la missió*: Aquesta secció permet a l'administrador acabar la missió de la forma que es desitgi. Seleccionar una de les entrades farà que la missió finalitzi de forma Automatica.

#### Crèdits

En aquesta secció s'han de mencionar de forma obligatòria totes aquelles persones que han col·laborat d'alguna forma a la creació de la missió.

#### Radio

Aquesta entrada mostrarà les diferents freqüències de ràdio que utilitzaran les diverses esquadres o equips de foc. Es recomana la següent estructura:

* Command de missió: 41 kHz.
* Suport: 51 kHz.
* Artillery: 61 kHz.
* **Nom de l'esquadra 1**:
* Squad 1: 200 khz.
  * Fireteam 1: 201 khz.
  * Fireteam 2: 202 khz.
  * Fireteam 3: 203 khz.
* Squad 2: 210 khz.
  * Fireteam 1: 211 khz.
  * Fireteam 2: 212 khz.
  * Fireteam 3: 213 khz.

Cal recordar de configurar les freqüències de les ràdios per cada esquadra i equip de foc als documents `bmt_acre2_configuracio.sqf` en el cas d'utilitzar ACRE2 i `fn_tfar_configureFrequencies.sqf`si s'utilitza el TFAR. Els fitxers es poden trobar a la carpeta `/scripts/radios/acre2`i `scripts/radios/tfar` respectivament.

#### Administration/Logistics

En aquesta secció s'informa als jugadors de les diferents unitats de suport (artilleria, cas, extracció) que hi ha a la seva disponibilitat així com la possibilitat de reequipar-se.

#### Execution

En aquest apartat s'el·labora en com realitzar la missió i la prioritat de les tasques en cas d'haver-n'hi. Es recomana també que s'incereixin enllaços a les diverses marques al mapa, utilitzant les comandes `<marker>` per facilitar la lectura.

#### Mission

En aquesta secció s'haurà d'explicar en línies generals de què va la missió. Cal que l'informació sigui breu i concisa. Cal cobrir les diferents fases de la missió: inserció, informació general i extracció. Si és necessàri, es poden incloure imatges, especialment si s'ha d'eliminar o rescatar algú en concret.

#### Intel

La secció d'intel·legència ha de donar informació, en cas d'haver-n'hi, sobre les tropes enemigues i aliades a la zona.

#### SITREP

L'apartat d'informe de situació, SITREP (Situational Report en anglès), ha de donar una visió general de perquè es fa la missió. Aquesta secció pot ser més elaborada i cobrir aspectes que no siguin rellevants per la missió. Tot i que per missions úniques i sense continuació, al contrari que en campanyes, aquest apartat pot resultar poc útil.
