# Foreløbige observationer

Jeg kommenterer her på iagtagelser og små antagelser jeg har gjort mig foreløbig.

---

## 1. Backend/API og UI
- Der skrives at, "Forventningen er at koden skal flyttes til backend APIen og der skal laves en UI til at vise rapporterne senere."
- Ved første øjekast troede jeg, at jeg også skulle lave lidt UI. Jeg antager dog at scriptet senere hen skal kunne integreres i et API og UI, men det er ikke nødvendigt nu.
 
---

## 2. Felter vs. kolonner
- Derudover skrives der at, "Rapporten skal indeholde følgende 'felter'".
- Jeg tolker “felter” som værende kolonner i output (fx JSON eller Excel).
- Så hver medarbejder bliver én række, og felterne 'Total (antal)', 'Total (DKK)', 'Godkendt (DKK)', 'Udbetalt (DKK)' bliver kolonner.

---

## 3. Total (antal)
- Jeg lagde mærke til at der står "Godkendt OG Udbetalt", så jeg tolker "og" som enten Godkendt ELLER Udbetalt, dvs. at alle udgiftsrækker med status Godkendt eller Udbetalt tælles med.

---

## 4. Total beløb og status
- Jeg kan se at status er lagret som 'text' i 'reimbursement_status'. Hvis vi i fremtiden ændrer eller tilføjer statusser, vil rapporten muligvis skulle justeres. Jeg vælger dog at hardcode de aktuelle status-navne (‘Godkendt’, ‘Udbetalt’), men det ville være bedre at lave det dynamisk, hvis nye statusser kommer.

---

## 5. Filtrering på dato
- Der står følgende i opgaven: "Rapporten modtager en 'from' og en 'to' dato, som afgrænser købstidspunktet purchase_ts'.

Jeg har valgt at tolke det således:

Hvis 'from' og 'to' er angivet, så hentes kun udgifter hvor 'purchase_ts' ligger indenfor perioden. Hvis 'from' eller 'to' er 'None', ignoreres filteret. purchase_ts er altså den kolonne, der afgrænses på.

---

## 6. Filtrering på projekt og kategori
- Der står også at "Rapporten kan modtage et 'project_id' og 'category_id' som afgrænser henholdsvis projektet og kategorien"

- Jeg går ud fra at hvis 'from' og 'to' er angivet, hentes kun udgifter hvor 'purchase_ts' ligger indenfor perioden. Hvis from eller 'to' er 'None', ignoreres filteret. Så jeg tænker at  purchase_ts er den kolonne, som jeg har valgt at afgrænse på.

purchase_ts er altså den kolonne, vi afgrænser på, ikke at “from” er en kolonne – det er blot input til filteret.
