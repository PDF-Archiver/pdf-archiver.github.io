/// Every translated string on the home page and in the site chrome, in one language.
///
/// Page titles and body copy of the content pages are not in here — they live in the front matter
/// and body of the Markdown files.
struct SiteStrings {
    /// One of the three steps the workflow section is built from.
    struct Step {
        /// The step's number. Not translated.
        let tag: String
        let title: String
        let lead: String
        let body: String
    }

    /// The example filename, split into the three parts the naming scheme is made of.
    struct FilenameExample {
        let date: String
        let description: String
        let tags: String
        let dateLabel: String
        let descriptionLabel: String
        let tagsLabel: String

        /// Length of the rendered filename, including the separators and the extension.
        /// The hero sizes its type from this, so a longer translation still fits the card.
        var characterCount: Int {
            date.count + 2 + description.count + 2 + tags.count + 4
        }
    }

    struct Promise {
        let title: String
        let body: String
    }

    struct Testimonial {
        let initials: String
        let source: String
        let statement: String
    }

    let siteTitle: String
    /// The home page's `<title>`. Unlike the hero claim it has to carry the words people search
    /// for, because it is the line they read in the result list.
    let homeTitle: String
    let selectLanguage: String
    let navigationLabel: String
    let germanName: String
    let englishName: String

    let navFeatures: String
    let navFAQ: String
    let navDownload: String
    let appStoreURL: String
    let downloadButton: String

    let heroEyebrow: String
    /// The claim is not translated. Its last beat is set in the accent colour.
    let heroTitleLead = "Scan it. Tag it."
    let heroTitleAccent = "Find it."
    let heroLead: String
    let heroSecondaryCTA: String
    let trustLine: String

    let workflowTitle: String
    let workflowLead: String
    let steps: [Step]
    let searchChips: [String]

    let spotlightTitle: String
    let spotlightBody: [String]
    let spotlightImagePath: String
    let spotlightImageAlt: String

    let keepTitle: String
    let keepLead: String
    let keepBody: [String]
    let filenameExample: FilenameExample
    let archiveTree: String

    let promisesTitle: String
    let promises: [Promise]

    let testimonialsTitle: String
    let testimonials: [Testimonial]

    let trialTitle: String
    let trialBody: String

    let helpTitle: String
    let helpBody: String
    let helpFAQLink: String
    let helpFallback: String

    let copyrightHolder: String
}
