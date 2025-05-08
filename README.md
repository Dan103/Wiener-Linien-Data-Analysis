# Wiener Linien Data Analysis - [Dashboard Link](https://public.tableau.com/app/profile/danylo.butynskyy/viz/WienerLinienDataAnalysis/WienerLinienDashboard)

## Inhaltsverzeichnis
1. [Projektübersicht](#projektübersicht)  
2. [Motivation](#motivation)  
3. [Datenquellen](#datenquellen)  
4. [Methodik](#methodik)  
5. [Dashboard-Beschreibung](#dashboard-beschreibung)  
   - [PKW-Dichte pro Bezirk](#pkw-dichte-pro-bezirk)  
   - [Fahrten pro Ticket vs. Jahreskarten](#fahrten-pro-ticket-vs-jahreskarten)  
   - [Top-Modus im Jahresvergleich](#top-modus-im-jahresvergleich)  
   - [Anteil öffentlicher Verkehrsmittel](#anteil-öffentlicher-verkehrsmittel)  
6. [Interpretation und Hintergründe](#interpretation-und-hintergründe)  
   - [Soziale Faktoren](#soziale-faktoren)  
   - [Politische Rahmenbedingungen](#politische-rahmenbedingungen)  
   - [Wirtschaftliche Einflüsse](#wirtschaftliche-einflüsse)  
7. [Fazit](#fazit)

## Projektübersicht
In diesem Projekt werden Mobilitätsdaten der Wiener Linien und ergänzende Verkehrsdaten ausgewertet. Ziel ist es, Veränderungen im Fahrgastverhalten, in der Modal Split und in der privaten PKW-Dichte pro Bezirk zu untersuchen. Die Ergebnisse werden in einem interaktiven Tableau-Dashboard visualisiert, um Handlungsfelder für Verkehrsplanung und Politik abzuleiten.

## Motivation
Die Mobilität in Wien unterliegt einem steten Wandel, bedingt durch demografische Verschiebungen, Klimaziele und infrastrukturelle Entwicklungen. Durch die Analyse von Fahrgastzahlen und PKW-Dichte soll aufgezeigt werden, wie sich die Nutzung öffentlicher Verkehrsmittel gegenüber dem Individualverkehr entwickelt hat. Diese Erkenntnisse können Entscheidungsträgern helfen, gezielte Maßnahmen zur Verkehrsberuhigung und ÖPNV-Förderung zu planen.

## Datenquellen
- **Wiener Linien Open Data**: Quartals- und Jahreswerte zu Fahrgastzahlen, Ticketverkäufen und Jahreskarten  
- **Statistik Austria**: PKW-Zulassungen und Einwohnerzahlen auf Bezirksebene  
- **Open Data Wien**: Bezirksgrenzen und demografische Strukturdaten  
- **Mobilitätsumfragen**: Ergebnisse zum Modal Split (zu Fuß, Fahrrad, PKW, ÖPNV)

## Methodik
1. **Datenaufbereitung:** Zusammenführung der Datenquellen, Bereinigung von Zeitreihen und Bezirkskennzahlen  
2. **Berechnungen:** Ermittlung von PKW-Dichte (PKW pro 1 000 Einwohner), Fahrten pro Ticket, Jahreskartenbestand und Modal-Share-Anteilen  
3. **Visualisierung:** Erstellung von Balkendiagrammen, Liniendiagrammen und gestapelten Säulen in Tableau für interaktives Reporting

## Dashboard-Beschreibung

### PKW-Dichte pro Bezirk
Ein horizontales Balkendiagramm stellt die PKW-Dichte (PKW pro 1 000 Einwohner) für alle 23 Wiener Bezirke dar. Die Innere Stadt hebt sich mit rund 9,3 PKW pro 1 000 ab, gefolgt von Liesing mit 5,25 PKW pro 1 000 Einwohner. Die niedrigste Dichte weist Ottakring mit etwa 3,4 PKW pro 1 000 auf. Diese Verteilung korreliert mit dem sozioökonomischen Status und der Parkraumsituation: Zentral gelegene Bezirke und wohlhabende Randgebiete verfügen über mehr Stellplätze und Autonutzung.

### Fahrten pro Ticket vs. Jahreskarten
In einem kombinierten Liniendiagramm werden die **roten** Werte als _Fahrten pro Ticket_ (linke Achse) und die **blauen** als _Jahreskartenbestände_ (rechte Achse) von 2004 bis 2022 dargestellt. Die Fahrten pro Ticket sinken moderat zwischen 2004 und 2011 um je rund 1 %, bevor 2012 ein starker Einbruch von 24,9 % auftritt – wahrscheinlich aufgrund einer Tarifreform und Einführung elektronischer Tickets. Ab 2012 stabilisieren sie sich auf niedrigerem Niveau. Demgegenüber steigen die Jahreskartenbestände ab 2004 jährlich um rund 7–12 % und erreichen 2019 einen Höchstwert (+3,66 %). Nach 2019 fällt der Bestand durch Pandemie-Effekte um fast 38 % und pendelt sich ab 2020 auf niedrigerem Niveau ein.

### Top-Modus im Jahresvergleich
Ein Punktdiagramm visualisiert jeweils den meistgenutzten Verkehrsträger für ausgewählte Jahre: **2005 – Auto**, **2019 – öffentlicher Verkehr**, **2021 – Zufußgehen**. Die Verschiebung zeigt, wie politische Maßnahmen, Umweltbewusstsein und äußere Einflüsse wie Lockdowns das Mobilitätsverhalten verändern. Die Dominanz des öffentlichen Verkehrs bis 2019 spiegelt erfolgreiche ÖPNV-Ausbau- und Werbekampagnen wider. Der Fußgängermodus 2021 korreliert mit erhöhtem Homeoffice-Anteil und verstärkten lokalen Wegen.

### Anteil öffentlicher Verkehrsmittel
Ein gestapeltes Säulendiagramm zeigt die Modal-Shares von 1994 bis 2022 nach Verkehrsart: Bus (Blau), Straßenbahn (Gelb) und U-Bahn (Rosa). Der Busanteil sank von 17,4 % (1994) auf 13,0 % (2011) und der Straßenbahnanteil von 31,6 % (1994) auf 22,2 % (2011), was auf den Ausbau des U-Bahn-Netzes zurückzuführen ist. In den darauffolgenden Jahren erholten sich Bus- und Straßenbahnanteile wieder und erreichten im Jahr 2021 jeweils 20,7 % (Bus) und 33,7 % (Straßenbahn), während der U-Bahn-Anteil auf 45,7 % zurückging. Hauptursache dafür war der umfassende Netzausbau und die Modernisierung der Bus- und Straßenbahnlinien mit verbesserten Direktverbindungen und verdichteten Takten. Ab 2020 ist aufgrund der Coronavirus-Pandemie die Nutzung öffentlicher Verkehrsmittel jedoch stark eingebrochen.

## Interpretation und Hintergründe

### Soziale Faktoren
Dichte Wohnstrukturen in zentralen Bezirken reduzieren den Bedarf an eigenem PKW; junge Berufstätige bevorzugen Flexibilität und ÖPNV. Im Kontrast dazu setzen Bewohner in Einfamilienhausgebieten verstärkt auf das Auto, bedingt durch längere Pendelstrecken und familiäre Alltagswege. Die drastische Reduktion der Jahreskarten im Lockdown zeigt den Einfluss geänderter Arbeitsmuster (Homeoffice) auf das Nutzungsverhalten. Der Anstieg der Fußwege 2021 ist eine direkte Folge davon, dass alltägliche Wege um lokale Nahversorgungsrouten ergänzt wurden.

### Politische Rahmenbedingungen
Parkraumbewirtschaftung und Begegnungszonen in der Inneren Stadt verteuern das Parken und verringern die PKW-Nutzung. Zeitgleich forcieren U-Bahn-Verlängerungen (U2 nach Seestadt) und neue Tramlinien den Umstieg auf ÖPNV. Die Tarifreform 2012 führte zu einem Einbruch der Fahrten pro Ticket, da die Einführung der Wiener-Linien-Card und elektronischer Tickets das Nutzungsverhalten veränderten. Pandemie-bedingte Maßnahmen 2020 zwangen viele Nutzer, auf Einzeltickets auszuweichen oder seltener unterwegs zu sein.

### Wirtschaftliche Einflüsse
Subventionierte Tarife halten den ÖPNV im Vergleich zum PKW günstig und attraktiv. Steigende Betriebskosten, CO₂-Abgaben und Parkgebühren erhöhen die Gesamtbetriebskosten für Autofahrer, was den Umstieg befördert. Infrastrukturinvestitionen in Bus- und Tramnetze steigern deren Kapazität und Attraktivität, wodurch der Busanteil an Fahrgastzahlen anfangs überproportional zunimmt. Langfristig stabilisieren sich die Anteile, sobald neue Kapazitäten vollständig in den Fahrplan integriert sind.

## Fazit
Die Analyse verdeutlicht, wie Farbzuordnungen und Zahlen in den Charts korrekt interpretiert werden: rote Linie steht für Fahrten pro Ticket, blaue Linie für Jahreskarten. Die Verlagerung hin zu Öffis und Fußverkehr wird durch politische, soziale und wirtschaftliche Einflüsse bedingt und liefert wertvolle Impulse für künftige Mobilitätsstrategien in Wien.  
