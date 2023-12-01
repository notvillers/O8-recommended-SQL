# Octopus 8 ERP részletek

Általam írt, akár másoknak is hasznos sql dolgok.

## Lekérdezések

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

Cikkentként visszaadja a 1 Készl. ME.-re a megadott KTD főtípus értéket

## Szűrések

### SZ_BESZCIKK_KAPCS

Listázza a cikktörzsben is megtalálható egyező vonalkódokat.

## Funkciók

### F_GLS_TULMERET

Listázza azokat a cikkeket, amelyek a GLS jelenlegi (2023. 12. 01) feltételei alapján túlméretesnek számítanak, illetve azokat, amelyek a @csommodid alatti csomagolási módban vannak. (Ezzel segítve a manuális bővíthetőséget)

# Tárolt eljárások

### T_GLS_TULMERET

A @tultipusid1 azonosítós tulajdonság típusba tölti be az F_GLS_TULMERET alatt meghatározott termékeket