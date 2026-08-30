/// Every translated string on the home page and in the site chrome, in one language.
///
/// Page titles and body copy of the content pages are not in here — they live in the front matter
/// and body of the Markdown files.
struct SiteStrings {
    /// One of the four steps the page is built around: Scan it, Tag it, Find it, Keep it.
    struct Step {
        let title: String
        let lead: String
        let body: [String]
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

    let heroLead: String
    let trustLine: String

    /// Scan it, Tag it, Find it — the three steps of the workflow.
    let workflowSteps: [Step]
    /// Keep it — the payoff, rendered on its own band with the filename breakdown.
    let keepStep: Step
    let filenameExample: FilenameExample
    let archiveTree: String
    let searchChips: [String]

    let promisesTitle: String
    let promises: [Promise]

    let trialTitle: String
    let trialLead: String
    let trialBody: String
    let trialNote: String

    let platformsTitle: String
    let platformsBody: String

    let testimonialsTitle: String
    let testimonials: [Testimonial]

    let helpTitle: String
    let helpBody: String
    let helpFAQLink: String
    let helpFallback: String

    let noTracking: String
    let copyrightHolder: String

    /// The headline is the same in both languages — the claim is not translated.
    let heroHeadline = "Scan it. Tag it. Find it."
}
