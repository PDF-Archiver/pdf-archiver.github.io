extension SiteStrings {
    static let german = SiteStrings(
        siteTitle: "PDF\u{00A0}Archiver",
        homeTitle: "PDF\u{00A0}Archiver — Dokumente scannen und archivieren auf Mac und iPhone",
        selectLanguage: "Sprache auswählen",
        navigationLabel: "Hauptnavigation",
        germanName: "Deutsch",
        englishName: "English",

        navFeatures: "Funktionen",
        navFAQ: "FAQ",
        navDownload: "Laden",
        appStoreURL: "https://apps.apple.com/de/app/pdf-archiver/id1433801905",
        downloadButton: "Im App Store laden",

        heroEyebrow: "seit 2018 · open source",
        heroLead: """
        Ein Archiv, das die App überdauert. Keine\u{00A0}Datenbank, kein\u{00A0}Server, \
        kein\u{00A0}Lock-in — nur Ordner und Dateien, die dir gehören.
        """,
        heroSecondaryCTA: "So funktioniert es",
        trustLine: "Nichts verlässt dein Gerät · Zwei Wochen kostenlos, ohne Konto",

        workflowTitle: "Drei Schritte, vom Blatt ins Archiv",
        workflowLead: "Kein Workflow zum Lernen. Halten, prüfen, fertig.",
        steps: [
            Step(
                tag: "1",
                title: "Scan\u{00A0}it.",
                lead: "Halte dein iPhone über die Seite.",
                body: """
                Der Scan landet zugeschnitten und gerade in deiner Inbox. Die Texterkennung läuft \
                auf deinem Gerät — nichts wird hochgeladen, nichts wartet auf einem Server.
                """
            ),
            Step(
                tag: "2",
                title: "Tag\u{00A0}it.",
                lead: "Datum, Beschreibung, Tags.",
                body: """
                Apple Intelligence schlägt dir alle drei vor, auf dem Gerät. Am Mac springst du \
                mit ↹ durch die Felder — prüfen, ⌘S drücken, und das Dokument wandert umbenannt \
                ins Archiv.
                """
            ),
            Step(
                tag: "3",
                title: "Find\u{00A0}it.",
                lead: "Such nach einem Tag oder dem Text im Dokument.",
                body: """
                Das funktioniert in PDF\u{00A0}Archiver, in Spotlight, im Finder und in jedem \
                Dateimanager, den du gerade offen hast.
                """
            )
        ],
        searchChips: ["_rechnung", "-mietvertrag", "energie"],

        spotlightTitle: "Auf Mac, iPhone und iPad.",
        spotlightBody: [
            """
            Widgets zeigen, was noch ungetaggt ist. Kurzbefehle automatisieren, was du oft machst. \
            Über das Teilen-Menü kommen Dokumente aus jeder anderen App herein.
            """,
            """
            Du hast schon PDFs? Leg sie dazu — vom Scanner, aus dem Mail-Anhang, aus dem \
            Download-Ordner.
            """
        ],
        spotlightShots: [
            Screenshot(
                device: "mac",
                path: "/assets/img/screenshots/tagging-mac-de.png",
                alt: "Ein gescannter Beleg wird am Mac getaggt: das Dokument neben Datum, Beschreibung und Tags"
            ),
            Screenshot(
                device: "iphone",
                path: "/assets/img/screenshots/archive-iphone-de.png",
                alt: "Dasselbe Archiv auf einem iPhone, mit Dokumenten samt Datum und Tags"
            )
        ],

        keepTitle: "Keep\u{00A0}it.",
        keepLead: """
        Dein Archiv ist ein Ordner voller PDFs, nach Jahren sortiert. Das ist der Dateiname von \
        oben, zur Ruhe gekommen.
        """,
        keepBody: [
            """
            Datum, Beschreibung, Tags — im Dateinamen. Keine Großbuchstaben, keine Leerzeichen, \
            keine Umlaute, damit die Namen jedes Dateisystem überstehen, in dem sie landen.
            """,
            """
            Kopier den Ordner auf eine Backup-Platte, ein NAS, einen Windows-Rechner. Er bleibt \
            lesbar. In zehn Jahren auch noch — mit oder ohne diese App.
            """
        ],
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

        promisesTitle: "Was das konkret heißt",
        promises: [
            Promise(
                title: "Alles bleibt auf deinem Gerät.",
                body: "Es gibt keinen PDF-Archiver-Server, an den deine Dokumente gehen könnten."
            ),
            Promise(
                title: "Kein Konto.",
                body: "Keine Anmeldung, kein Passwort, keine E-Mail-Adresse."
            ),
            Promise(
                title: "Du entscheidest, wo die Dateien liegen.",
                body: "iCloud Drive, ein lokaler Ordner oder jeder andere Ordner, den du auswählst."
            ),
            Promise(
                title: "Open Source.",
                body: "Der Code liegt auf GitHub, falls du nachsehen möchtest."
            ),
            Promise(
                title: "Seit 2018.",
                body: "Ein Entwickler, bis heute mit Updates."
            ),
            Promise(
                title: "Es antwortet ein Mensch.",
                body: "Fragen landen bei einem Entwickler, nicht in einer Ticket-Warteschlange."
            )
        ],

        testimonialsTitle: "Was Nutzer sagen",
        testimonials: [
            Testimonial(
                initials: "iF",
                source: "iFun",
                statement: """
                Die Mac-App nutzt eine einfache Dateinamens-Konvention, die Schlagworte, Daten und \
                Beschreibungen einfach im Dateinamen der Dokumente vermerkt und daher weitgehend \
                unabhängig von Betriebssystem, Cloud-Anbieter und Mac- oder PC-Anwendung genutzt \
                werden kann.
                """
            ),
            Testimonial(
                initials: "SA",
                source: "Sir Apfelot",
                statement: """
                Mit dem PDF\u{00A0}Archiver habe ich es endlich geschafft, ein bisschen Ordnung und \
                Struktur in meine PDF-Sammlung mit Belegen, Verträgen und anderen Dokumenten zu \
                bringen, die ich seit 2014 aufgebaut habe.
                """
            ),
            Testimonial(
                initials: "JP",
                source: "Jörg P.",
                statement: """
                Bis jetzt lagen alle PDFs mit kryptischen Dateinamen in einem einzigen Ordner. Mit \
                Hilfe von PDF\u{00A0}Archiver habe ich endlich meine Buchhaltung strukturieren können.
                """
            )
        ],

        trialTitle: "Erst ausprobieren.",
        trialBody: """
        Zwei Wochen kostenlos. Kein Konto, keine Kreditkarte. Nach der Testphase kannst du ein \
        Abo abschließen oder die App einmalig kaufen.
        """,

        helpTitle: "Fragen?",
        helpBody: "In den FAQ stehen die Antworten auf das, was am häufigsten gefragt wird.",
        helpFAQLink: "Zu den FAQ",
        helpFallback: "Kommst du nicht weiter? Schreib uns auf Mastodon oder per E-Mail.",

        copyrightHolder: "Julian Kahnert"
    )
}
