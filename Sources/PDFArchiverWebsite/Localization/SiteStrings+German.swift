extension SiteStrings {
    static let german = SiteStrings(
        siteTitle: "PDF Archiver",
        selectLanguage: "Sprache auswählen",
        navigationLabel: "Hauptnavigation",
        germanName: "Deutsch",
        englishName: "English",

        navFeatures: "Funktionen",
        navFAQ: "FAQ",
        navDownload: "Laden",
        appStoreURL: "https://apps.apple.com/de/app/pdf-archiver/id1433801905",
        downloadButton: "Im App Store laden",

        heroLead: """
        Ein Archiv, das die App überdauert. Keine Datenbank, kein Server, kein Lock-in — nur \
        Ordner und Dateien, die dir gehören.
        """,
        trustLine: "Seit 2018 · Open Source · Nichts verlässt dein Gerät",

        workflowSteps: [
            Step(
                title: "Scan it.",
                lead: "Halte dein iPhone über die Seite.",
                body: [
                    """
                    Der Scan landet zugeschnitten und gerade in deiner Inbox. Die Texterkennung \
                    läuft auf deinem Gerät, mit Apples eingebauter Engine. Nichts wird \
                    hochgeladen. Nichts wartet auf einem Server.
                    """,
                    """
                    Du hast schon PDFs? Leg sie dazu — vom Scanner, aus dem Mail-Anhang, aus dem \
                    Download-Ordner.
                    """
                ]
            ),
            Step(
                title: "Tag it.",
                lead: "Gib dem Dokument ein Datum, eine Beschreibung und ein paar Tags.",
                body: [
                    """
                    Apple Intelligence schlägt dir alle drei vor, auf dem Gerät. Prüfen, \
                    korrigieren, ⌘S. Das Dokument wandert umbenannt ins Archiv.
                    """,
                    "Am Mac springst du mit ↹ durch die Felder. Deine Hände bleiben auf der Tastatur."
                ]
            ),
            Step(
                title: "Find it.",
                lead: "Such nach einem Tag, einer Beschreibung oder dem Text im Dokument.",
                body: [
                    "Der Text im Dokument ist echter Text, kein Bild davon. Markieren, kopieren, durchsuchen.",
                    """
                    Das funktioniert in PDF Archiver. Es funktioniert genauso in Spotlight, im \
                    Finder und in jedem Dateimanager, den du gerade offen hast — weil die \
                    Suchbegriffe Teil des Dateinamens sind.
                    """
                ]
            )
        ],

        keepStep: Step(
            title: "Keep it.",
            lead: "Dein Archiv ist ein Ordner voller PDFs, nach Jahren sortiert.",
            body: [
                """
                Datum, Beschreibung, Tags — im Dateinamen. Keine Großbuchstaben, keine \
                Leerzeichen, keine Umlaute, damit die Namen jedes Dateisystem überstehen, in \
                dem sie landen.
                """,
                """
                Kopier den Ordner auf eine Backup-Platte, ein NAS, einen Windows-Rechner. Er \
                bleibt lesbar. In zehn Jahren auch noch — mit oder ohne diese App.
                """
            ]
        ),

        filenameExample: FilenameExample(
            date: "2026-03-12",
            description: "stromabrechnung",
            tags: "energie_rechnung",
            dateLabel: "Datum",
            descriptionLabel: "Beschreibung",
            tagsLabel: "Tags"
        ),

        archiveTree: """
        Archive/
        ├── 2017/
        │   └── 2017-05-12--apple-macbook__apple_bill.pdf
        └── 2026/
            ├── 2026-03-12--stromabrechnung__energie_rechnung.pdf
            └── 2026-04-02--mietvertrag__wohnung_vertrag.pdf
        """,

        searchChips: ["_rechnung", "-mietvertrag", "energie"],

        promisesTitle: "Was das konkret heißt",
        promises: [
            Promise(
                title: "Alles bleibt auf deinem Gerät.",
                body: """
                Deine Dokumente werden auf deinem Mac oder iPhone gelesen, erkannt und benannt. Es \
                gibt keinen PDF-Archiver-Server, an den sie gehen könnten.
                """
            ),
            Promise(
                title: "Kein Konto.",
                body: "Keine Anmeldung, kein Passwort, keine E-Mail-Adresse. App laden und loslegen."
            ),
            Promise(
                title: "Du entscheidest, wo die Dateien liegen.",
                body: "iCloud Drive, ein lokaler Ordner oder jeder andere Ordner, den du auswählst."
            ),
            Promise(
                title: "Open Source.",
                body: """
                Der Code liegt auf GitHub. Wenn du wissen willst, was die App mit deinen \
                Dokumenten macht, lies ihn nach.
                """
            ),
            Promise(
                title: "Seit 2018.",
                body: """
                Erste Version im Februar 2018, bis heute gepflegt. Ein Entwickler, acht Jahre.
                """
            ),
            Promise(
                title: "Es antwortet ein Mensch.",
                body: """
                Fragen landen bei einem Entwickler, nicht in einer Ticket-Warteschlange. Meist \
                gibt es innerhalb weniger Stunden eine Antwort.
                """
            )
        ],

        trialTitle: "Erst ausprobieren.",
        trialLead: "Zwei Wochen kostenlos. Kein Konto, keine Kreditkarte.",
        trialBody: """
        Nach der Testphase kannst du ein Abo abschließen oder die App einmalig kaufen. Was das \
        kostet, steht im App Store.
        """,
        trialNote: """
        Kündigen kannst du jederzeit. Deine Dokumente bleiben so oder so lesbar — es sind PDFs in \
        einem Ordner.
        """,

        platformsTitle: "Auf Mac, iPhone, iPad und Apple Vision Pro.",
        platformsBody: """
        Widgets zeigen, was noch ungetaggt ist. Kurzbefehle automatisieren, was du oft machst. \
        Über das Teilen-Menü kommen Dokumente aus jeder anderen App herein.
        """,

        testimonialsTitle: "Was Nutzer sagen",
        testimonials: [
            Testimonial(
                source: "iFun",
                statement: """
                Die Mac-App nutzt eine einfache Dateinamens-Konvention, die Schlagworte, Daten und \
                Beschreibungen einfach im Dateinamen der Dokumente vermerkt und daher weitgehend \
                unabhängig von Betriebssystem, Cloud-Anbieter und Mac- oder PC-Anwendung genutzt \
                werden kann.
                """
            ),
            Testimonial(
                source: "Sir Apfelot",
                statement: """
                Mit dem PDF Archiver habe ich es endlich geschafft, ein bisschen Ordnung und \
                Struktur in meine PDF-Sammlung mit Belegen, Verträgen und anderen Dokumenten zu \
                bringen, die ich seit 2014 aufgebaut habe.
                """
            ),
            Testimonial(
                source: "Jörg P.",
                statement: """
                Bis jetzt lagen alle PDFs mit kryptischen Dateinamen in einem einzigen Ordner. Mit \
                Hilfe von PDF Archiver habe ich endlich meine Buchhaltung strukturieren können.
                """
            )
        ],

        helpTitle: "Fragen?",
        helpBody: "In den FAQ stehen die Antworten auf das, was am häufigsten gefragt wird.",
        helpFAQLink: "Zu den FAQ",
        helpFallback: "Kommst du nicht weiter? Schreib uns auf Mastodon oder per E-Mail.",

        noTracking: "Diese Website setzt keine Cookies und lädt keine Tracker.",
        copyrightHolder: "Julian Kahnert"
    )
}
