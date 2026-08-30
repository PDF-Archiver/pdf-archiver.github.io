/// Every translated string on the home page and in the site chrome, in one language.
///
/// Page titles and body copy of the content pages are not in here — they live in the front matter
/// and body of the Markdown files.
struct SiteStrings {
    /// One of the three steps the workflow section is built from.
    struct Step {
        /// The step's marker in the filename's own vocabulary, e.g. `01_scan`. Not translated.
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

    let noTracking: String
    let copyrightHolder: String
}
