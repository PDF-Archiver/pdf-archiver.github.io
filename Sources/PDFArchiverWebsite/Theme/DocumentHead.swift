import Plot
import Publish

extension Node where Context == HTML.DocumentContext {
    static func siteHead(for location: Location,
                         on site: PDFArchiverWebsite,
                         in language: SiteLanguage) -> Node {
        let strings = language.strings
        // The home pages are titled after the site itself — no point in naming it twice.
        let isSiteTitle = location.title.isEmpty || location.title == strings.siteTitle
        let title = isSiteTitle ? "\(strings.heroHeadline) — \(strings.siteTitle)"
                                : "\(location.title) | \(strings.siteTitle)"
        let description = location.description.isEmpty ? language.metaDescription : location.description

        return .head(
            .encoding(.utf8),
            .viewport(.accordingToDevice),
            .title(title),
            .description(description),
            .siteName(site.name),
            .url(site.url(for: location)),
            .unwrap(location.imagePath ?? site.imagePath) { .socialImageLink(site.url(for: $0)) },
            .meta(.name("twitter:card"), .content("summary_large_image")),
            .meta(.name("apple-itunes-app"),
                  .content("app-id=1433801905, app-clip-bundle-id=de.JulianKahnert.PDFArchiveViewer.Clip")),
            .meta(.name("msapplication-TileColor"), .content("#ca414f")),
            // The header sits on the hero band, so the browser chrome matches it per theme.
            .meta(.name("theme-color"), .content("#fbf7f6"),
                  .attribute(named: "media", value: "(prefers-color-scheme: light)")),
            .meta(.name("theme-color"), .content("#141c27"),
                  .attribute(named: "media", value: "(prefers-color-scheme: dark)")),
            .link(.rel(.appleTouchIcon), .sizes("180x180"), .href("/assets/img/favicon/apple-touch-icon.png")),
            .link(.rel(.icon), .type("image/png"), .sizes("32x32"), .href("/assets/img/favicon/favicon-32x32.png")),
            .link(.rel(.icon), .type("image/png"), .sizes("16x16"), .href("/assets/img/favicon/favicon-16x16.png")),
            .link(.rel(.manifest), .href("/assets/img/favicon/site.webmanifest")),
            .link(.rel(.maskIcon), .color("#ca414f"), .href("/assets/img/favicon/safari-pinned-tab.svg")),
            .link(.rel(.shortcutIcon), .href("/assets/img/favicon/favicon.ico")),
            .alternateLanguageLinks(for: location.path),
            .stylesheet("/css/styles.css"),
            .structuredData(for: site, in: language)
        )
    }
}

private extension Node where Context == HTML.HeadContext {
    /// `hreflang` links let search engines pair the two language versions of a page.
    static func alternateLanguageLinks(for path: Path) -> Node {
        let sharedPath = SiteLanguage.sharedPath(of: path)

        return .group(SiteLanguage.allCases.map { language in
            .link(
                .rel(.alternate),
                .href(language.path(for: sharedPath).absoluteString),
                .attribute(named: "hreflang", value: language.rawValue)
            )
        })
    }

    /// Deliberately without price or rating: both live in the App Store, and a stale number in
    /// the markup is worse than none.
    static func structuredData(for site: PDFArchiverWebsite, in language: SiteLanguage) -> Node {
        let json = """
        {"@context":"https://schema.org","@type":"SoftwareApplication",\
        "name":"\(site.name)","applicationCategory":"ProductivityApplication",\
        "operatingSystem":"iOS 18, macOS 15.6, visionOS 2.0",\
        "url":"\(site.url.absoluteString)","downloadUrl":"\(language.strings.appStoreURL)",\
        "author":{"@type":"Person","name":"\(language.strings.copyrightHolder)"}}
        """

        return .script(.attribute(named: "type", value: "application/ld+json"), .raw(json))
    }
}

private extension SiteLanguage {
    var metaDescription: String {
        switch self {
        case .english:
            return """
            PDF Archiver scans, tags and archives your documents as searchable PDFs — entirely on \
            your Mac, iPhone or iPad. Open source, no cloud required. Two weeks free.
            """
        case .german:
            return """
            PDF Archiver scannt, taggt und archiviert deine Dokumente als durchsuchbare PDFs — \
            komplett auf deinem Gerät. Open Source, ohne Cloud-Zwang. Zwei Wochen gratis.
            """
        }
    }
}
