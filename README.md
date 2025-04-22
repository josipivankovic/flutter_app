# AutoOglasi (Flutter verzija)

AutoOglasi je mobilna aplikacija razvijena u Flutteru s ciljem prikaza modernog i funkcionalnog oglasnika za unos, pregled i upravljanje oglasima, uz integraciju s REST API servisom.

Aplikacija uključuje više zaslona, formu za unos oglasa, prikaz detalja svakog vozila, kontakt formu i povezivanje s vanjskim serverom putem HTTP zahtjeva.

## Tehnologije korištene

- Flutter
- Dart
- Material Design
- Git & GitHub
- REST API (MockAPI servis)

## Funkcionalnosti

- Prikaz oglasa sa slikom, opisom, tehničkim podacima i kontakt informacijama
- Dodavanje, uređivanje i brisanje oglasa unutar aplikacije
- Kontakt forma za direktno kontaktiranje prodavača
- Navigacija između više stranica putem donjeg navigacijskog izbornika
- Vizualna tražilica i mogućnost filtriranja oglasa po kategoriji
- Lažni gumbovi za prijavu i registraciju s iskačućim dijalozima
- Responsive dizajn prilagođen mobilnim uređajima
- Dohvat podataka o automobilima s vanjskog servera putem `Fetch` ekrana (MockAPI)

## Struktura aplikacije

- `Home` – početna stranica s tražilicom, istaknutim oglasima i login/registracija dijalozima
- `Oglasi` – prikaz svih unesenih oglasa, uključujući fake dugmad za uređivanje i brisanje
- `Dodaj oglas` – forma za unos novog oglasa (planirano dodavanje funkcionalnosti za upload slike)
- `Kontakt` – informacije o autoru aplikacije
- `Fetch` – stranica koja dohvaća podatke o automobilima s vanjskog servera (MockAPI)

## Plan razvoja

Razvoj aplikacije se nastavlja kroz nekoliko ključnih faza:

- Implementacija backend servisa u Go jeziku (Golang) – REST API za upravljanje oglasima
- Povezivanje s bazom podataka (npr. PostgreSQL ili Firebase)
- Dodavanje mogućnosti uploada slike prilikom unosa oglasa
- Autentikacija korisnika (login/registracija s validacijom)
- Sortiranje i napredno filtriranje oglasa (po cijeni, lokaciji, kategoriji)
- Uvođenje administratorskog sučelja za upravljanje oglasima

## O autoru

Moje ime je Josip Ivanković, mobilni i web developer s fokusom na razvoj modernih aplikacija pomoću Fluttera, Reacta i TypeScripta.  
Ovaj projekt prikazuje konkretne vještine u izgradnji sučelja, upravljanju stanjima, radu s formama, navigacijom i povezivanju s REST servisima.

## Kontakt

- Email: josipivankovicc13@gmail.com  
- GitHub: [github.com/josipivankovic](https://github.com/josipivankovic)  
- LinkedIn: [linkedin.com/in/josip-ivanković](https://www.linkedin.com/in/josip-ivanković-061324358/)

---

Napomena: Aplikacija je u razvoju i koristi se u edukativne i prezentacijske svrhe.
