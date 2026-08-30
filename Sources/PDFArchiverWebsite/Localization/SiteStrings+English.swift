extension SiteStrings {
    static let english = SiteStrings(
        siteTitle: "PDF Archiver",
        selectLanguage: "Select language",
        navigationLabel: "Main navigation",
        germanName: "Deutsch",
        englishName: "English",

        navFeatures: "Features",
        navFAQ: "FAQ",
        navDownload: "Download",
        appStoreURL: "https://apps.apple.com/app/pdf-archiver/id1433801905",
        downloadButton: "Download on the App Store",

        heroLead: """
        An archive that outlasts the app. No database, no server, no lock-in — just folders and \
        files that stay yours.
        """,
        trustLine: "Built since 2018 · Open source · Nothing leaves your device",

        workflowSteps: [
            Step(
                title: "Scan it.",
                lead: "Point your iPhone at the page.",
                body: [
                    """
                    The scan lands in your inbox, cropped and straight. Text recognition runs on \
                    your device, with Apple's built-in engine. Nothing is uploaded. Nothing waits \
                    on a server.
                    """,
                    """
                    Already have PDFs? Drop them in — from your scanner, a mail attachment, your \
                    downloads folder.
                    """
                ]
            ),
            Step(
                title: "Tag it.",
                lead: "Give the document a date, a description, and a few tags.",
                body: [
                    """
                    Apple Intelligence suggests all three, on your device. Check them, fix what's \
                    off, press ⌘S. The document is renamed and moved to your archive.
                    """,
                    "On the Mac, ↹ moves between fields. Your hands never leave the keyboard."
                ]
            ),
            Step(
                title: "Find it.",
                lead: "Search a tag, a description, or the text inside.",
                body: [
                    "The text inside is real text, not a picture of text. Select it, copy it, search it.",
                    """
                    This works in PDF Archiver. It also works in Spotlight, in the Finder, and in \
                    whatever file manager you happen to open — because the search terms are part \
                    of the filename.
                    """
                ]
            )
        ],

        keepStep: Step(
            title: "Keep it.",
            lead: "Your archive is a folder of PDFs, sorted by year.",
            body: [
                """
                Date, description, tags — written into the name. No capitals, no spaces, no \
                umlauts, so the names survive every filesystem they land on.
                """,
                """
                Copy the folder to a backup drive, a NAS, a Windows machine. It stays \
                readable. In ten years, it still will be — with or without this app.
                """
            ]
        ),

        filenameExample: FilenameExample(
            date: "2026-03-12",
            description: "electricity-bill",
            tags: "energy_bill",
            dateLabel: "Date",
            descriptionLabel: "Description",
            tagsLabel: "Tags"
        ),

        archiveTree: """
        Archive/
        ├── 2017/
        │   └── 2017-05-12--apple-macbook__apple_bill.pdf
        └── 2026/
            ├── 2026-03-12--electricity-bill__energy_bill.pdf
            └── 2026-04-02--lease-agreement__flat_contract.pdf
        """,

        searchChips: ["_bill", "-lease", "energy"],

        promisesTitle: "What that means in practice",
        promises: [
            Promise(
                title: "Everything stays on your device.",
                body: """
                Documents are read, recognized and named on your Mac or iPhone. There is no PDF \
                Archiver server to send them to.
                """
            ),
            Promise(
                title: "No account.",
                body: "No sign-up, no password, no email address. Download the app and start."
            ),
            Promise(
                title: "You choose where files live.",
                body: "iCloud Drive, a local folder, or any folder you point the app at."
            ),
            Promise(
                title: "Open source.",
                body: """
                The code is on GitHub. If you want to know what the app does with your documents, \
                read it.
                """
            ),
            Promise(
                title: "Built since 2018.",
                body: """
                First release in February 2018, still shipping updates today. One developer, \
                eight years.
                """
            ),
            Promise(
                title: "A person answers.",
                body: """
                Questions go to one developer, not a ticket queue. Most get a reply within a few \
                hours.
                """
            )
        ],

        trialTitle: "Try it first.",
        trialLead: "Two weeks free. No account, no credit card.",
        trialBody: """
        After the trial you can subscribe, or buy the app once and keep it. The App Store shows \
        what applies where you are.
        """,
        trialNote: """
        Cancel whenever you like. Your documents stay readable either way — they are just PDFs in \
        a folder.
        """,

        platformsTitle: "On Mac, iPhone, iPad and Apple Vision Pro.",
        platformsBody: """
        Widgets show what's still untagged. Shortcuts automate what you do often. The share sheet \
        takes documents from any other app.
        """,

        testimonialsTitle: "What users say",
        testimonials: [
            Testimonial(
                source: "iFun",
                statement: """
                The Mac app uses a simple file name convention, which simply notes keywords, data \
                and descriptions in the file name of the documents and can therefore be used \
                largely independently of the operating system, cloud provider and Mac or PC \
                application.
                """
            ),
            Testimonial(
                source: "Sir Apfelot",
                statement: """
                With the PDF Archiver I have finally managed to bring some order and structure to \
                my PDF collection with documents, contracts and other documents that I have been \
                building since 2014.
                """
            ),
            Testimonial(
                source: "Jörg P.",
                statement: """
                Until now, all PDFs with cryptic file names were stored in a single folder. With \
                the help of PDF Archiver I have finally been able to structure my accounting.
                """
            )
        ],

        helpTitle: "Questions?",
        helpBody: "The FAQ answers the ones we get most.",
        helpFAQLink: "Read the FAQ",
        helpFallback: "Still stuck? Write to us on Mastodon or send an email.",

        noTracking: "This website sets no cookies and loads no trackers.",
        copyrightHolder: "Julian Kahnert"
    )
}
