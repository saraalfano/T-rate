<<<<<<< HEAD
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
# T-rate (Lab. ASSI)


È una piattaforma ideata per poter consultare una raccolta di traduzioni di opere audiovisive, quali
Film e Serie TV.
La nostra idea è di introdurre i seguenti ruoli con relativi permessi:
- Utente: ha la possibilità di scaricare e valutare le traduzioni presenti sulla piattaforma e di
selezionare i suoi traduttori “preferiti”. Inoltre, ha la possibilità di diventare Traduttore.
- Traduttore: ha la possibilità di tradurre i testi di Film e Serie TV messi a disposizione dai
Project Manager e di consultare i suoi impegni nel calendario generale. Inoltre, ha la
possibilità di valutare i testi degli altri e di diventare Project Manager a seguito di un
punteggio superiore a una certa soglia realizzato con le valutazioni dei suoi lavori.
- Project Manager: ha la possibilità di mettere a disposizione i testi di Film e Serie TV da
tradurre e di scegliere scadenze e traduttori incaricati per un determinato lavoro. Inoltre,
ha la possibilità di revisionare i testi e modificare il ruolo di Utenti e Traduttori.
Al momento della registrazione o dell’accesso alla piattaforma, Utenti, Traduttori e Project
Manager possono decidere se autenticarsi con la propria email o tramite un loro account Google,
mediante API Google OAuth.
I Traduttori e i Project Manager potranno visualizzare un calendario generale realizzato mediante
l’API di Google Calendar con le scadenze dei lavori.
Inoltre, i Project Manager potranno caricare, sempre sul calendario, i file di traduzione mediante
l’API di Ruby e scegliere i Traduttori che parteciperanno al lavoro. I file verranno poi spartiti con
un’implementazione automatizzata e i Traduttori troveranno in bacheca la loro parte da scaricare.
Per gli Utenti è prevista la possibilità di aggiungere e seguire dalla bacheca i loro traduttori
“preferiti”, mentre, sia per Utenti che per Traduttori, è prevista la possibilità di valutare le parti di
tutti i Traduttori, da cui verrà stilata una classifica.
Quando un Traduttore raggiungerà un punteggio di almeno 9, calcolato dalla media degli ultimi
dieci lavori, avrà la possibilità di diventare Project Manager.
>>>>>>> b0d0a825b355a319e887c29ce4922f607437d772
