Kyseessä Opintorekisteri ohjelma

Ohjelman avulla voit lisätä rekisteriin Oppilaita, Opintojaksoja sekä Arvosanoja oppilaille. Ohjelma sisältää myös näkymän joka kerää kaikki suoritukset yhteen arvioinnin jälkeen.

Reitit näihin CRUD operaatioihin postmanissa ovat:
http://localhost:3000/opintojakso
http://localhost:3000/arviointi
http://localhost:3000/opiskelija

Suoritus näkymänkin saat haettua postmanilla

http://localhost:3000/suoritus


Tietokannassa on myös muutama aliohjelma. Yhtä näistä voit käyttää postnamin avulla. Aliohjelmaa pääset käyttämään postmanissa kun menet body -> raw -> JSON ja noudatat ao ohjeita. 

Voit tällä aliohjelmalla lisätä kurssin tietokantaan kunhan syötät postmaniin tavat ao muodossa. Lisäyksen jälkeen postman tulostaa myös kaikki tällä hetkellä tietokannassa olevat kurssit. N = kurssitunnus, L = Laajuus, K = Kurssi

{
  "N": "IN123123",
  "L": 5,
  "K": "Pilviohjelmointi"
}

ER-Diagrammi muodostuu 3 taulusta jotka ovat "Opisjelija" "Arviointi" ja "Opintojakso". Näiden välille on luotu viiteavaimet. ER-Diagrammin ja muut suunnitelmat saat auki arviointi_2025.mwb tiedostosta.