# Octopus 8 ERP részletek

Általam írt, akár másoknak is hasznos T-SQL dolgok.

## [Lekérdezések](https://github.com/notvillers/O8-recommended-SQL/tree/main/Lek%C3%A9rdez%C3%A9sek)

A paraméter ajánlás az alábbi sorrendben dolgozik:

```
Paraméter típusa, 
Paraméter altípus, 
Opciók, 
Táblanév, 
Mezőnév, 
Eredménymező / Rádió mező
```

### [KTD_OSSZ](https://github.com/notvillers/O8-recommended-SQL/tree/main/Lek%C3%A9rdez%C3%A9sek/KTD_OSSZ)

Cikkentként visszaadja a 1 Készl. ME.-re a megadott KTD főtípus értéket.

**Példa felhasználás:** KTD/EPR köteles termékek adminisztrációja.


## [Szűrések](https://github.com/notvillers/O8-recommended-SQL/tree/main/Sz%C5%B1r%C3%A9sek)

### [BESZCIKK_KAPCS](https://github.com/notvillers/O8-recommended-SQL/tree/main/Sz%C5%B1r%C3%A9sek/BESZCIKK_KAPCS)

Listázza a cikktörzsben is megtalálható egyező vonalkódokat.

**Példa felhasználás:** Új beszállítói kapcsolat esetén az automata belistázás elősegítése.


## [Funkciók](https://github.com/notvillers/O8-recommended-SQL/tree/main/Funkci%C3%B3k)

### [F_GLS_TULMERET](https://github.com/notvillers/O8-recommended-SQL/tree/main/Funkci%C3%B3k/GLS_TULMERET)

Listázza azokat a cikkeket, amelyek a GLS jelenlegi (2023. 12. 01) feltételei alapján túlméretesnek számítanak, illetve azokat, amelyek a @csommodid alatti csomagolási módban vannak. (Ezzel segítve a manuális bővíthetőséget is.)

**Példa felhasználás:** [T_GLS_TULMERET](https://github.com/notvillers/O8-recommended-SQL/tree/main#t_gls_tulmeret).


## [Tárolt eljárások](https://github.com/notvillers/O8-recommended-SQL/tree/main/T%C3%A1rolt%20elj%C3%A1r%C3%A1sok)

### [T_GLS_TULMERET](https://github.com/notvillers/O8-recommended-SQL/tree/main/T%C3%A1rolt%20elj%C3%A1r%C3%A1sok/GLS_TULMERET)

A @tultipusid azonosítós tulajdonság típusba tölti be az [F_GLS_TULMERET](https://github.com/notvillers/O8-recommended-SQL/blob/main/README.md#f_gls_tulmeret) alatt meghatározott termékeket.

**Példa felhasználás:** Fuvarozási mód megajánló pontosítása, hogy mely termékeket nem viheti a GLS.


### [TULTIP_TOLT_MEGJ](https://github.com/notvillers/O8-recommended-SQL/tree/main/T%C3%A1rolt%20elj%C3%A1r%C3%A1sok/TULTIP_TOLT_MEGJ)

A @tultipusid azonosítós tulajdonság típusba tölti be a TULTIPUS.MEGJ-ben található cikkcsoport cikkeit.
Tulajdonság típus példa:

![TULTIP_TOLT_MEG](https://github.com/notvillers/O8-recommended-SQL/blob/main/T%C3%A1rolt%20elj%C3%A1r%C3%A1sok/TULTIP_TOLT_MEGJ/pic.png)

**Példa felhasználás:** Egyedileg kategorizált cikkek forgalmi kimutatásai.