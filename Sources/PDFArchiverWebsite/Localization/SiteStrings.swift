/// Every translated string on the site, in one language.
///
/// Some values carry inline HTML — line breaks, links, icons — and are rendered raw. Page titles
/// are not in here: they live in the front matter of the content files.
struct SiteStrings {
    struct Feature {
        let title: String
        let description: String
    }

    struct Testimonial {
        let imagePath: String
        let name: String
        let statement: String
    }

    let selectLanguage: String
    let germanName: String
    let englishName: String
    let siteTitle: String
    let navigationLabel: String
    let copyright: String
    let websiteAttribution: String
    let appStoreURL: String
    let appIconPath: String

    let homeLabel: String
    let downloadLabel: String
    let featuresLabel: String
    let contactLabel: String

    let featuresTitle: String
    let featuresSubtitle: String
    let features: [Feature]

    let mastheadMessage: String
    let callToActionHeadline: String
    let callToActionSubheadline: String
    let startButton: String
    let downloadHeadline: String
    let availability: String
    let contributionsWelcome: String
    let contributionText: String
    let downloadNow: String
    let appStoreBadgeImageURL: String
    let screenshotPath: String
    let needHelpTitle: String
    let needHelpText: String

    let testimonialsHeadline: String
    let testimonials: [Testimonial]
}
