extension SiteStrings {
    static let english = SiteStrings(
        siteTitle: "PDF Archiver",
        homeTitle: "PDF Archiver — scan and archive documents on Mac and iPhone",
        selectLanguage: "Select language",
        navigationLabel: "Main navigation",
        germanName: "Deutsch",
        englishName: "English",

        navFeatures: "Features",
        navFAQ: "FAQ",
        navDownload: "Download",
        appStoreURL: "https://apps.apple.com/app/pdf-archiver/id1433801905",
        downloadButton: "Download on the App Store",

        heroEyebrow: "since 2018 · open source",
        heroLead: """
        An archive that outlasts the app. No\u{00A0}database, no\u{00A0}server, \
        no\u{00A0}lock-in — just folders and files that stay yours.
        """,
        heroSecondaryCTA: "See how it works",
        trustLine: "Nothing leaves your device · Two weeks free, no account",

        workflowTitle: "Three steps, start to finish",
        workflowLead: "No workflow to learn. Point, check, done.",
        steps: [
            Step(
                tag: "1",
                title: "Scan\u{00A0}it.",
                lead: "Point your iPhone at the page.",
                body: """
                The scan lands in your inbox, cropped and straight. Text recognition runs on your \
                device — nothing is uploaded, nothing waits on a server.
                """
            ),
            Step(
                tag: "2",
                title: "Tag\u{00A0}it.",
                lead: "Date, description, tags.",
                body: """
                Apple Intelligence suggests all three, on your device. On the Mac, ↹ moves \
                between fields — check them, press ⌘S, and the document is renamed and moved to \
                your archive.
                """
            ),
            Step(
                tag: "3",
                title: "Find\u{00A0}it.",
                lead: "Search a tag, or the text inside.",
                body: """
                It works in PDF Archiver, in Spotlight, in the Finder, and in whatever file \
                manager you happen to open.
                """
            )
        ],
        searchChips: ["_bill", "-lease", "energy"],

        spotlightTitle: "On Mac, iPhone and iPad.",
        spotlightBody: [
            """
            Widgets show what's still untagged. Shortcuts automate what you do often. The share \
            sheet takes documents from any other app.
            """,
            """
            Already have PDFs? Drop them in — from your scanner, a mail attachment, your downloads \
            folder.
            """
        ],
        spotlightShots: [
            Screenshot(
                device: "mac",
                path: "/assets/img/screenshots/tagging-mac-en.png",
                alt: "Tagging a scanned receipt on a Mac: the document beside its date, description and tags"
            ),
            Screenshot(
                device: "iphone",
                path: "/assets/img/screenshots/archive-iphone-en.png",
                alt: "The same archive on an iPhone, listing documents with their dates and tags"
            )
        ],

        keepTitle: "Keep\u{00A0}it.",
        keepLead: """
        Your archive is a folder of PDFs, sorted by year. This is the filename from above, at rest.
        """,
        keepBody: [
            """
            Date, description, tags — written into the name. No capitals, no spaces, no umlauts, \
            so the names survive every filesystem they land on.
            """,
            """
            Copy the folder to a backup drive, a NAS, a Windows machine. It stays readable. In ten \
            years, it still will be — with or without this app.
            """
        ],
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

        promisesTitle: "What that means in practice",
        promises: [
            Promise(
                title: "Everything stays on your device.",
                body: "There is no PDF Archiver server to send documents to."
            ),
            Promise(
                title: "No account.",
                body: "No sign-up, no password, no email address."
            ),
            Promise(
                title: "You choose where files live.",
                body: "iCloud Drive, a local folder, or any folder you point the app at."
            ),
            Promise(
                title: "Open source.",
                body: "The code is on GitHub, if you want to check."
            ),
            Promise(
                title: "Built since 2018.",
                body: "One developer, still shipping updates today."
            ),
            Promise(
                title: "A person answers.",
                body: "Questions go to one developer, not a ticket queue."
            )
        ],

        testimonialsTitle: "What users say",
        testimonials: [
            Testimonial(
                initials: "iF",
                source: "iFun",
                statement: """
                The Mac app uses a simple file name convention, which simply notes keywords, data \
                and descriptions in the file name of the documents and can therefore be used \
                largely independently of the operating system, cloud provider and Mac or PC \
                application.
                """
            ),
            Testimonial(
                initials: "SA",
                source: "Sir Apfelot",
                statement: """
                With the PDF Archiver I have finally managed to bring some order and structure to \
                my PDF collection with documents, contracts and other documents that I have been \
                building since 2014.
                """
            ),
            Testimonial(
                initials: "JP",
                source: "Jörg P.",
                statement: """
                Until now, all PDFs with cryptic file names were stored in a single folder. With \
                the help of PDF Archiver I have finally been able to structure my accounting.
                """
            )
        ],

        trialTitle: "Try it first.",
        trialBody: """
        Two weeks free. No account, no credit card. After the trial you can subscribe, or buy the \
        app once and keep it.
        """,

        helpTitle: "Questions?",
        helpBody: "The FAQ answers the ones we get most.",
        helpFAQLink: "Read the FAQ",
        helpFallback: "Still stuck? Write to us on Mastodon or send an email.",

        copyrightHolder: "Julian Kahnert"
    )
}
