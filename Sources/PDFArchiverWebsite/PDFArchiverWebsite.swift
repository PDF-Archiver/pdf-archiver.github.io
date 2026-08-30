import Foundation
import Plot
import Publish

/// The pdf-archiver.io website.
///
/// The site is bilingual: English pages live at the root (`/faq`), German ones below `/de`
/// (`/de/faq`). `language` is the site-wide default; every page picks its own via `SiteLanguage`.
struct PDFArchiverWebsite: Website {
    enum SectionID: String, WebsiteSectionID {
        case faq
        case changelog
    }

    struct ItemMetadata: WebsiteItemMetadata {}

    let url = URL(string: "https://pdf-archiver.io")!
    let name = "PDF Archiver"
    let description = "Scan it. Tag it. Find it."
    let language: Language = .english
    var imagePath: Path? { "assets/img/opengraph-preview.png" }
    // The full icon set is declared in the document head, so Publish must not add a second one.
    var favicon: Favicon? { nil }
    var tagHTMLConfig: TagHTMLConfiguration? { nil }

    let mastodonURL = URL(string: "https://chaos.social/@jtk")!
    let githubURL = URL(string: "https://github.com/PDF-Archiver/PDF-Archiver")!
    let supportEmail = "support@pdf-archiver.io"
    let featureRequestEmail = "feature-request@pdf-archiver.io"
}
