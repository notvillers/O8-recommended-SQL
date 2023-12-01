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

## Szűrések

### SZ_BESZCIKK_KAPCS

Listázza a cikktörzsben is megtalálható egyező vonalkódokat.

## Funkciók

### F_GLS_TULMERET

Listázza azokat a cikkeket, amelyek a GLS jelenlegi (2023. 12. 01) feltételei alapján túlméretesnek számítanak, illetve azokat, amelyek a @csommodid alatti csomagolási módban vannak. (Ezzel segítve a manuális bővíthetőséget)

## Tárolt eljárások

### T_GLS_TULMERET

A @tultipusid azonosítós tulajdonság típusba tölti be az [F_GLS_TULMERET](https://github.com/notvillers/O8-recommended-SQL/blob/main/README.md#f_gls_tulmeret) alatt meghatározott termékeket.

### TULTIP_TOLT_MEGJ

@tultipusid azonosítós tulajdonság típusba tölti be a TULTIPUS.MEGJ-ben található cikkcsoport cikkeit.