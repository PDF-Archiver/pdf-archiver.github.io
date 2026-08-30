import Publish

/// Publish blocks the calling thread while its pipeline runs, so a step closure written inside this
/// entry point would inherit the main actor and deadlock. Custom steps live in `PublishingSteps`.
@main
enum SiteGenerator {
    static func main() throws {
        try PDFArchiverWebsite().publish(using: [
            .copyResources(),
            .copyFiles(at: "root-resources"),
            // Folder traversal skips dotted folders, so the App Site Association file is copied by name.
            .copyFile(at: "root-resources/.well-known/apple-app-site-association", to: ".well-known"),
            .addMarkdownFiles(),
            .moveGermanIndexPageToLanguageRoot(),
            .sortItems(in: .faq, by: \.path),
            .generateHTML(withTheme: .pdfArchiver),
            .generateSiteMap(excluding: ["404"]),
            .moveNotFoundPageToRoot()
        ])
    }
}
