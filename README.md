# Octopus 8 ERP részletek

Általam írt, akár másoknak is hasznos sql dolgok.

## Lekérdezések

A paraméter ajánlás az alábbi sorrendben dolgozik:

```
Paraméter típusa, 
Paraméter altípus, 
Opciók, 
Táblanév, 
Mezőnév, 
Eredménymező / Rádió mező
```

### L_KTD_OSSZ

Cikkentként visszaadja a 1 Készl. ME.-re a megadott KTD főtípus értéket.

**Példa felhasználás:** KTD/EPR köteles termékek adminisztrációja.


## Szűrések

### SZ_BESZCIKK_KAPCS

Listázza a cikktörzsben is megtalálható egyező vonalkódokat.

**Példa felhasználás:** Új beszállítói kapcsolat esetén az automata belistázás elősegítése.


## Funkciók

### F_GLS_TULMERET

Listázza azokat a cikkeket, amelyek a GLS jelenlegi (2023. 12. 01) feltételei alapján túlméretesnek számítanak, illetve azokat, amelyek a @csommodid alatti csomagolási módban vannak. (Ezzel segítve a manuális bővíthetőséget)

**Példa felhasználás:** [T_GLS_TULMERET]([F_GLS_TULMERET](https://github.com/notvillers/O8-recommended-SQL/blob/main/README.md#t_gls_tulmeret)).


## Tárolt eljárások

### T_GLS_TULMERET

A @tultipusid azonosítós tulajdonság típusba tölti be az [F_GLS_TULMERET](https://github.com/notvillers/O8-recommended-SQL/blob/main/README.md#f_gls_tulmeret) alatt meghatározott termékeket.

**Példa felhasználás:** Fuvarozási mód megajánló pontosítása, hogy mely termékeket nem viheti a GLS.


### TULTIP_TOLT_MEGJ

A @tultipusid azonosítós tulajdonság típusba tölti be a TULTIPUS.MEGJ-ben található cikkcsoport cikkeit.
Tulajdonság típus példa:

<img src="https://raw.githubusercontent.com/notvillers/O8-recommended-SQL/main/T%C3%A1rolt%20elj%C3%A1r%C3%A1sok/TULTIP_TOLT_MEGJ/TULTIP_TOLT_MEGJ.png?token=GHSAT0AAAAAACHAHWMRLP7XXRLHYHOELSFIZLJ3HHQ" alt="TULTIP_TOLT_MEGJ"/>

**Példa felhasználás:** Egyedileg kategorizált cikkek forgalmi kimutatásai.