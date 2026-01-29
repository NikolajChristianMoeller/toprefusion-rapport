Hej

# Baggrund

Forestil dig, at du arbejder for TopRefusion, en virksomhed der hjælper
medarbejdere med at få refunderet arbejdsrelaterede udgifter. En central del
af dette er at skabe overblik til finance teamet over udgifterne.

Databasen er lavet for mange år siden af en tidligere ansat og er blevet
agilt udviklet. Funktionalitet er blevet udvidet efter behov og nu er
behovet for bedre rapportering opstået. Du er blevet givet denne opgave.

# Opgave

Din opgave er at lave et script, som udtrækker nedenstående rapport.
Scriptet skal i Python eller TypeScript - vælg det du er stærkest i.
Forventningen er at koden skal flyttes til backend APIen og der skal
laves en UI til at vise rapporterne senere.

Scriptet skal outputte en JSON liste, hvor hvert element er et
JSON objekt per række. Alle input argumenter til rapporterne kan
antages at være valide.

Efter at have givet dig opgaven, så er cheferne smuttet to uger til
Mallorca uden mobil. Forventningen er at du har et udkast klar, når de
kommer tilbage. Du er derfor nød til at håndtere evt. tvetydigheder
og problemstillinger i opgaven ved at dokumenteret hvad du har gjort,
når du møder noget du føler var uklart.

# Rapport: Oversigt over forbrug per medarbejder

Rapporten skal ind indeholde følgende felter:

  * `Medarbejder`    - Navnet på medarbejderen
  * `Total (antal)`  - Det totale antal af udgifter for denne medarbejder i status `Godkendt` og `Udbetalt` 
  * `Total (DKK)`    - Det totale beløb fra udgifter i status `Godkendt` og `Udbetalt`
  * `Godkendt (DKK)` - Det totale beløb som er godkendt til medarbejderen men endnu ikke udbetalt.
  * `Udbetalt (DKK)` - Det totale beløb som allerede er udbetalt til medarbejderen.

Rapporten modtager en `from` og en `to` dato, som afgrænser købstidspunktet (`purchase_ts`).
Rapporten kan modtage et `project_id` og `category_id` som afgrænser henholdsvis projektet
og kategorien.

Alle input kan være `None`, og betyder at feltet ikke skal afgrænses på dette input.

Rapporten sorteres efter `Total (DKK)`.

## SQL driver

Hvis det er første gang du arbejder med SQLite i Python, så er her
en start vejledning til Python. 

```python3
import sqlite3


db = sqlite3.connect("reimbursements.db")

cursor = db.execute("""
    SELECT id,
           name
      FROM employee
""")

for id, name in cursor.fetchall():
    print(f"{name} (ID: {id})")
```

Til TypeScript, kan [typescript sqlite](https://www.npmjs.com/package/sqlite) biblioteket benyttes.

# Output format (eksempel på ét resultat)

```json
{
    "Medarbejder": "Tommy T.",
    "Total (DKK)": 79889.0,
    "Godkendt (DKK)": 53123.0,
    "Udbetalt (DKK)": 21449.0 
}
```


Der er udleveret to SQL filer til `sqlite3` (v3.46.1, men andre versioner
burde virke).

 * ddl-sqlite.sql - indeholder tabellerne.
 * data-sqlite.sql - indeholder data.

Der er en præbygget udgave af databasen i `reimbursements.db` med samme
indhold som SQL filerne. Det er ikke påkrævet at arbejde med SQL filerne
direkte. De er der blot, så du kan komme i gang med færrest mulige
problemer.

# Krav og vejledning

 * Løsningen skal kunne afvikles vha. Python3.13 eller Node.js v22.22

 * Fokusér på klarhed, læsbarhed og korrekthed i din kode.

 * Der er **ikke** kræv til at scriptene kan læse parametre fra kommando linje.
   Parametre må gerne være "konstanter" i scriptet, så længe man kun skal rette
   et sted for at teste at det virker som forventet.
   - Det vil også sige at du **ikke** behøver validere disse argumenter.

 * Vi estimerer, at opgaven kan løses inden for cirka 1 time. Brug den tid, du
   finder passende, men sigt efter dette.

 * Vi beder dig løse opgaven uden brug af AI-kodeassistenter (som f.eks. GitHub
   Copilot eller ChatGPT). Vi er interesserede i at se _din_ tilgang.

 * Dokumentér og begrund:
   - dependencies, som ikke er en del af standardbiblioteket og som vi ikke har
     nævnt ovenfor (typescript sqlite biblioteket)
   - udfordringer og forbedringsforslag.